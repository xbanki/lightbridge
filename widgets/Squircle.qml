// SPDX-FileCopyrightText:  2026 xbanki <development@xbanki.me>
// SPDX-License-Identifier: GPL-3.0-only

import QtQuick

Item {
    id: root

    property color borderColor: "black"
    property color color: "white"

    property real borderWidth: 0
    property real rounding: 6

    onBorderColorChanged: canvas.requestPaint()
    onColorChanged: canvas.requestPaint()

    onBorderWidthChanged: canvas.requestPaint()
    onRoundingChanged: canvas.requestPaint()
    onHeightChanged: canvas.requestPaint()
    onWidthChanged: canvas.requestPaint()

    Canvas {
        id: canvas

        renderStrategy: Canvas.Cooperative
        anchors.fill: root

        onPaint: {
            const ctx = getContext("2d")
            const STEPS = 90
            ctx.reset()
            if (width <= 0 || height <= 0) return

            ctx.beginPath()
            for (let i = 0; i <= STEPS; i++) {
                const t = (i / STEPS) * Math.PI * 2
                const c = Math.cos(t)
                const s = Math.sin(t)
                const y = height / 2 + Math.sign(s) * Math.pow(Math.abs(s), 2 / root.rounding) * (height / 2)
                const x = width  / 2 + Math.sign(c) * Math.pow(Math.abs(c), 2 / root.rounding) * (width  / 2)

                if (i === 0) ctx.moveTo(x, y)
                else ctx.lineTo(x, y)
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
