// SPDX-FileCopyrightText:  2026 xbanki <development@xbanki.me>
// SPDX-License-Identifier: GPL-3.0-only

import QtQuick

Item {
    id: root

    property color borderColor: "black"
    property color color: "white"

    property real borderWidth: 0

    property real smoothing: 1.0
    property real rounding: 5

    onBorderColorChanged: canvas.requestPaint()
    onColorChanged: canvas.requestPaint()

    onSmoothingChanged: canvas.requestPaint()
    onRoundingChanged: canvas.requestPaint()

    onBorderWidthChanged: canvas.requestPaint()
    onHeightChanged: canvas.requestPaint()
    onWidthChanged: canvas.requestPaint()

    Canvas {
        id: canvas

        renderStrategy: Canvas.Cooperative
        anchors.fill: root

        onPaint: {
            const ctx = getContext("2d")
            const STEPS_PER_CORNER = 32
            ctx.reset()
            if (width <= 0 || height <= 0) return

            const inset = root.borderWidth > 0 ? root.borderWidth / 2 : 0
            const x0 = inset, y0 = inset
            const x1 = width - inset, y1 = height - inset
            const w = x1 - x0, h = y1 - y0
            if (w <= 0 || h <= 0) return

            const r = Math.min(w, h) / 2 * Math.max(0, Math.min(root.smoothing, 1))
            const exp = 2 / Math.max(root.rounding, 0.01)

            const corners = [
            { cx: x1 - r, cy: y0 + r, a0: -Math.PI / 2 },
            { cx: x1 - r, cy: y1 - r, a0: 0 },
            { cx: x0 + r, cy: y1 - r, a0: Math.PI / 2 },
            { cx: x0 + r, cy: y0 + r, a0: Math.PI }
            ]

            ctx.beginPath()
            let first = true
            for (const corner of corners) {
                for (let i = 0; i <= STEPS_PER_CORNER; i++) {
                    const t = corner.a0 + (i / STEPS_PER_CORNER) * (Math.PI / 2)
                    const c = Math.cos(t)
                    const s = Math.sin(t)
                    const x = corner.cx + Math.sign(c) * Math.pow(Math.abs(c), exp) * r
                    const y = corner.cy + Math.sign(s) * Math.pow(Math.abs(s), exp) * r

                    if (first) { ctx.moveTo(x, y); first = false }
                    else ctx.lineTo(x, y)
                }
            }
            ctx.closePath()

            ctx.fillStyle = root.color
            ctx.fill()

            if (root.borderWidth > 0) {
                ctx.strokeStyle = root.borderColor
                ctx.lineWidth = root.borderWidth
                ctx.stroke()
            }
        }
    }
}
