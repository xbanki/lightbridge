// SPDX-FileCopyrightText:  2026 xbanki <development@xbanki.me>
// SPDX-License-Identifier: GPL-3.0-only

import QtQuick

Item {
    id: root
    anchors.fill: parent

    required property Item origin
    required property var  target

    property real tolerance: 2
    property real padding: 4
    property int  stall: 0

    property bool hovered: false
    property bool debug: false

    readonly property bool active: _pointerIsOverOrigin || hovered || _isTransiting
    readonly property bool transiting: _isTransiting

    property bool _pointerIsOverOrigin: false
    property var _pointerLastPosition: null

    property real _closestDistanceToTarget: Infinity
    property bool _isTransiting: false

    property var _safeZoneApexPoint: null
    property var _safeZonePolygon: []

    onHoveredChanged: if (hovered) {
        _pointerIsOverOrigin = false
        _stopTransit()
    }

    Timer {
        id: timer

        interval: root.stall
        onTriggered: root._stopTransit()
    }

    HoverHandler {
        onHoveredChanged: if (!hovered && root._pointerIsOverOrigin) root._startTransit(root._lastPointerPosition)
        onPointChanged: root._handlePointerMoved(root.mapToItem(null, point.position.x, point.position.y))
    }

    function _handlePointerMoved(pointer_position) {
        root._pointerLastPosition = pointer_position
        if (origin && this._rectContainsPoint(this._windowRectOfItem(origin), pointer_position)) {
            root._pointerIsOverOrigin = true
            this._stopTransit()

            return
        }

        if (root._pointerIsOverOrigin) this._startTransit(pointer_position)
        if (!root._isTransiting) return

        const target_base_rect = this._resolveTargetRect()
        if (!target_base_rect) {
            this._stopTransit()

            return
        }

        const expanded_target_rect = this._expandRect(target_base_rect, root.tolerance)
        if (!this._convexPolygonContainsPoint(this._buildSafeZonePolygon(root._safeZoneApexPoint, expanded_target_rect), pointer_position)) {
            this._stopTransit()

            return
        }

        const distance_to_target = this._distanceFromRectToPoint(expanded_target_rect, pointer_position)
        if (distance_to_target <= root._closestDistanceToTarget + 1) {
            root._closestDistanceToTarget = Math.min(root._closestDistanceToTarget, distance_to_target)
            root._safeZoneApexPoint = pointer_position

            if (root.stall > 0) timer.restart()
        }
        root._safeZonePolygon = this._buildSafeZonePolygon(root._safeZoneApexPoint, expanded_target_rect)
    }

    function _startTransit(apex_point) {
        if (root.stall > 0) timer.restart()

        root._closestDistanceToTarget = Infinity
        root._safeZoneApexPoint = apex_point
        root._pointerIsOverOrigin = false
        root._isTransiting = true
    }

    function _stopTransit() {
        timer.stop()

        root._safeZoneApexPoint = null
        root._safeZonePolygon = []
        root._isTransiting = false
    }

    function _windowRectOfItem(item) {
        const top_left_in_window = item.mapToItem(null, 0, 0)
        return Qt.rect(top_left_in_window.x, top_left_in_window.y, item.width, item.height)
    }

    function _resolveTargetRect() {
        if (Qt.isQtObject(root.target)) return _windowRectOfItem(root.target)
        if (root.target !== undefined && root.target !== null) return target

        return null
    }

    function _expandRect(rectangle, amount) {
        return Qt.rect(rectangle.x - amount, rectangle.y - amount, rectangle.width + 2 * amount, rectangle.height + 2 * amount)
    }

    function _rectContainsPoint(rectangle, point) {
        return point.x >= rectangle.x && point.x <= rectangle.x + rectangle.width && point.y >= rectangle.y && point.y <= rectangle.y + rectangle.height
    }

    function _distanceFromRectToPoint(rectangle, point) {
        const vertical_gap   = Math.max(rectangle.y - point.y, 0, point.y - (rectangle.y + rectangle.height))
        const horizontal_gap = Math.max(rectangle.x - point.x, 0, point.x - (rectangle.x + rectangle.width))

        return Math.hypot(horizontal_gap, vertical_gap)
    }

    function _buildSafeZonePolygon(apex_point, target_rectangle) {
        return _computeConvexHull([
            {
                x: apex_point.x - root.padding,
                y: apex_point.y - root.padding,
            },
            {
                x: apex_point.x + root.padding,
                y: apex_point.y - root.padding,
            },
            {
                x: apex_point.x + root.padding,
                y: apex_point.y + root.padding,
            },
            {
                x: apex_point.x - root.padding,
                y: apex_point.y + root.padding,
            },
            {
                x: target_rectangle.x,
                y: target_rectangle.y,
            },
            {
                x: target_rectangle.x + target_rectangle.width,
                y: target_rectangle.y,
            },
            {
                x: target_rectangle.x + target_rectangle.width,
                y: target_rectangle.y + target_rectangle.height,
            },
            {
                x: target_rectangle.x,
                y: target_rectangle.y + target_rectangle.height,
            }
            ])
    }

    function _computeConvexHull(points) {
        const sorted_points = points.slice().sort((first, second) => first.x - second.x || first.y - second.y)

        const crossProduct = (origin, first, second) =>
        (first.x - origin.x) * (second.y - origin.y) - (first.y - origin.y) * (second.x - origin.x)

        const lower_hull = []
        const upper_hull = []

        for (let i = 0; i < sorted_points.length; ++i) {
            while (lower_hull.length >= 2 && crossProduct(lower_hull[lower_hull.length - 2], lower_hull[lower_hull.length - 1], sorted_points[i]) <= 0) lower_hull.pop()

            lower_hull.push(sorted_points[i])
        }

        for (let i = sorted_points.length - 1; i >= 0; --i) {
            while (upper_hull.length >= 2 && crossProduct(upper_hull[upper_hull.length - 2], upper_hull[upper_hull.length - 1], sorted_points[i]) <= 0) upper_hull.pop()

            upper_hull.push(sorted_points[i])
        }

        lower_hull.pop()
        upper_hull.pop()

        return lower_hull.concat(upper_hull)
    }

    function _convexPolygonContainsPoint(polygon, point) {
        let positive = false
        let negative = false
        for (let i = 0; i < polygon.length; ++i) {
            const edge_start = polygon[i]
            const edge_end   = polygon[(i + 1) % polygon.length]
            const edge_side = (edge_end.x - edge_start.x) * (point.y - edge_start.y) - (edge_end.y - edge_start.y) * (point.x - edge_start.x)
            if (edge_side < 0) negative = true
            if (edge_side > 0) positive = true

            if (positive && negative) return false
        }

        return true
    }

    on_SafeZonePolygonChanged: overlay.requestPaint()
    onTargetChanged: overlay.requestPaint()
    onDebugChanged: overlay.requestPaint()

    Canvas {
        id: overlay

        anchors.fill: parent
        visible: root.debug
        z: 10000

        onPaint: {
            if (!root.debug) return

            const context = getContext("2d")

            context.clearRect(0, 0, width, height)
            if (root._safeZonePolygon.length >= 3) {
                context.beginPath()
                for (let i = 0; i < root._safeZonePolygon.length; ++i) {
                    const vertexInOverlay = root.mapFromItem(null, root._safeZonePolygon[i].x, root._safeZonePolygon[i].y)
                    if (i === 0) context.moveTo(vertexInOverlay.x, vertexInOverlay.y)
                    else context.lineTo(vertexInOverlay.x, vertexInOverlay.y)
                }

                context.strokeStyle = "rgba(0, 255, 136, 0.90)"
                context.fillStyle   = "rgba(0, 255, 136, 0.25)"
                context.closePath()
                context.fill()
                context.stroke()
            }
        }
    }
}
