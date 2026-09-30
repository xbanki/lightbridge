// SPDX-FileCopyrightText:  2026 xbanki <development@xbanki.me>
// SPDX-License-Identifier: GPL-3.0-only

pragma Singleton

import QtQuick
import Quickshell

Singleton {
    property bool dark: true

    // Lights
    readonly property color colorLightTextOnPrimary: "#F9FCFEFF"
    readonly property color colorLightTextSecondary: "#335166FF"
    readonly property color colorLightPrimaryHover:  "#0063BBFF"
    readonly property color colorLightSurfaceSolid:  "#F7FDFFFF"
    readonly property color colorLightTextTertiary:  "#718A9CFF"
    readonly property color colorLightTextPrimary:   "#030A11FF"
    readonly property color colorLightBackground:    "#EDF5FBFF"
    readonly property color colorLightDivider:       "#A1BBCF24"
    readonly property color colorLightOverlay:       "#FDFFFF8C"
    readonly property color colorLightPrimary:       "#0076CBFF"
    readonly property color colorLightSurface:       "#F7FDFFA6"
    readonly property color colorLightSuccess:       "#009044FF"
    readonly property color colorLightWarning:       "#E17B00FF"
    readonly property color colorLightAccent:        "#00A4B3FF"
    readonly property color colorLightBorder:        "#A1BBCF47"
    readonly property color colorLightDanger:        "#D40237FF"
    readonly property color colorLightInfo:          "#009DBBFF"

    // Darks
    readonly property color colorDarkTextOnPrimary:  "#F9FCFEFF"
    readonly property color colorDarkTextSecondary:  "#839CAFFF"
    readonly property color colorDarkPrimaryHover:   "#00A2F5FF"
    readonly property color colorDarkSurfaceSolid:   "#08131AFF"
    readonly property color colorDarkTextTertiary:   "#496172FF"
    readonly property color colorDarkTextPrimary:    "#E9F0F5FF"
    readonly property color colorDarkBackground:     "#010509FF"
    readonly property color colorDarkDivider:        "#6E95B01A"
    readonly property color colorDarkOverlay:        "#121C2399"
    readonly property color colorDarkPrimary:        "#008fE6FF"
    readonly property color colorDarkSurface:        "#08131AB3"
    readonly property color colorDarkSuccess:        "#00A95CFF"
    readonly property color colorDarkWarning:        "#F29000FF"
    readonly property color colorDarkAccent:         "#00BECDFF"
    readonly property color colorDarkBorder:         "#6E95B02E"
    readonly property color colorDarkDanger:         "#ED324BFF"
    readonly property color colorDarkInfo:           "#00B1CEFF"

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
