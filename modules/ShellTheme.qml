// SPDX-FileCopyrightText:  2026 xbanki <development@xbanki.me>
// SPDX-License-Identifier: GPL-3.0-only

pragma Singleton

import QtQuick
import Quickshell

Singleton {
    property bool dark: true

    // Lights
    readonly property color colorLightTextOnPrimary: "#F9FCFE"
    readonly property color colorLightTextSecondary: "#335166"
    readonly property color colorLightPrimaryHover:  "#0063BB"
    readonly property color colorLightSurfaceSolid:  "#F7FDFF"
    readonly property color colorLightTextTertiary:  "#718A9C"
    readonly property color colorLightTextPrimary:   "#030A11"
    readonly property color colorLightBackground:    "#EDF5FB"
    readonly property color colorLightDivider:       "#A1BBCF"
    readonly property color colorLightOverlay:       "#FDFFFF"
    readonly property color colorLightPrimary:       "#0076CB"
    readonly property color colorLightSurface:       "#F7FDFF"
    readonly property color colorLightSuccess:       "#009044"
    readonly property color colorLightWarning:       "#E17B00"
    readonly property color colorLightAccent:        "#00A4B3"
    readonly property color colorLightBorder:        "#A1BBCF"
    readonly property color colorLightDanger:        "#D40237"
    readonly property color colorLightInfo:          "#009DBB"

    // Darks
    readonly property color colorDarkTextOnPrimary:  "#F9FCFE"
    readonly property color colorDarkTextSecondary:  "#839CAF"
    readonly property color colorDarkPrimaryHover:   "#00A2F5"
    readonly property color colorDarkSurfaceSolid:   "#08131A"
    readonly property color colorDarkTextTertiary:   "#496172"
    readonly property color colorDarkTextPrimary:    "#E9F0F5"
    readonly property color colorDarkBackground:     "#010509"
    readonly property color colorDarkDivider:        "#6E95B0"
    readonly property color colorDarkOverlay:        "#121C23"
    readonly property color colorDarkPrimary:        "#008fE6"
    readonly property color colorDarkSurface:        "#08131A"
    readonly property color colorDarkSuccess:        "#00A95C"
    readonly property color colorDarkWarning:        "#F29000"
    readonly property color colorDarkAccent:         "#00BECD"
    readonly property color colorDarkBorder:         "#6E95B0"
    readonly property color colorDarkDanger:         "#ED324B"
    readonly property color colorDarkInfo:           "#00B1CE"

    // Switches
    readonly property color colorTextOnPrimary: dark ? colorDarkTextOnPrimary : colorLightTextOnPrimary
    readonly property color colorTextSecondary: dark ? colorDarkTextSecondary : colorLightTextSecondary
    readonly property color colorPrimaryHover:  dark ? colorDarkPrimaryHover  : colorLightPrimaryHover
    readonly property color colorSurfaceSolid:  dark ? colorDarkSurfaceSolid  : colorLightSurfaceSolid
    readonly property color colorTextTertiary:  dark ? colorDarkTextTertiary  : colorLightTextTertiary
    readonly property color colorTextPrimary:   dark ? colorDarkTextPrimary   : colorLightTextPrimary
    readonly property color colorBackground:    dark ? colorDarkBackground    : colorLightBackground
    readonly property color colorDivider:       dark ? colorDarkDivider       : colorLightDivider
    readonly property color colorOverlay:       dark ? colorDarkOverlay       : colorLightOverlay
    readonly property color colorPrimary:       dark ? colorDarkPrimary       : colorLightPrimary
    readonly property color colorSurface:       dark ? colorDarkSurface       : colorLightSurface
    readonly property color colorSuccess:       dark ? colorDarkSuccess       : colorLightSuccess
    readonly property color colorWarning:       dark ? colorDarkWarning       : colorLightWarning
    readonly property color colorAccent:        dark ? colorDarkAccent        : colorLightAccent
    readonly property color colorBorder:        dark ? colorDarkBorder        : colorLightBorder
    readonly property color colorDanger:        dark ? colorDarkDanger        : colorLightDanger
    readonly property color colorInfo:          dark ? colorDarkInfo          : colorLightInfo
}
