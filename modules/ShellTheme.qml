pragma Singleton

import QtQuick
import Quickshell

Singleton {
    property bool dark: true

    // Lights
    readonly property color colorLightBackground: "#edf5fb"
    readonly property color colorLightSurface: "#f7fdff"
    readonly property color colorLightSurfaceSolid: "#f7fdff"
    readonly property color colorLightOverlay: "#fdffff"
    readonly property color colorLightBorder: "#a1bbcf"
    readonly property color colorLightDivider: "#a1bbcf"
    readonly property color colorLightPrimary: "#0076cb"
    readonly property color colorLightPrimaryHover: "#0063bb"
    readonly property color colorLightAccent: "#00a4b3"
    readonly property color colorLightTextPrimary: "#030a11"
    readonly property color colorLightTextSecondary: "#335166"
    readonly property color colorLightTextTertiary: "#718a9c"
    readonly property color colorLightTextOnPrimary: "#f9fcfe"
    readonly property color colorLightSuccess: "#009044"
    readonly property color colorLightWarning: "#e17b00"
    readonly property color colorLightDanger: "#d40237"
    readonly property color colorLightInfo: "#009dbb"

    // Darks
    readonly property color colorDarkBackground: "#010509"
    readonly property color colorDarkSurface: "#08131a"
    readonly property color colorDarkSurfaceSolid: "#08131a"
    readonly property color colorDarkOverlay: "#121c23"
    readonly property color colorDarkBorder: "#6e95b0"
    readonly property color colorDarkDivider: "#6e95b0"
    readonly property color colorDarkPrimary: "#008fe6"
    readonly property color colorDarkPrimaryHover: "#00a2f5"
    readonly property color colorDarkAccent: "#00becd"
    readonly property color colorDarkTextPrimary: "#e9f0f5"
    readonly property color colorDarkTextSecondary: "#839caf"
    readonly property color colorDarkTextTertiary: "#496172"
    readonly property color colorDarkTextOnPrimary: "#f9fcfe"
    readonly property color colorDarkSuccess: "#00a95c"
    readonly property color colorDarkWarning: "#f29000"
    readonly property color colorDarkDanger: "#ed324b"
    readonly property color colorDarkInfo: "#00b1ce"

    // Switches
    readonly property color colorBackground:
    dark ? colorDarkBackground : colorLightBackground

    readonly property color colorSurface:
    dark ? colorDarkSurface : colorLightSurface

    readonly property color colorSurfaceSolid:
    dark ? colorDarkSurfaceSolid : colorLightSurfaceSolid

    readonly property color colorOverlay:
    dark ? colorDarkOverlay : colorLightOverlay

    readonly property color colorBorder:
    dark ? colorDarkBorder : colorLightBorder

    readonly property color colorDivider:
    dark ? colorDarkDivider : colorLightDivider

    readonly property color colorPrimary:
    dark ? colorDarkPrimary : colorLightPrimary

    readonly property color colorPrimaryHover:
    dark ? colorDarkPrimaryHover : colorLightPrimaryHover

    readonly property color colorAccent:
    dark ? colorDarkAccent : colorLightAccent

    readonly property color colorTextPrimary:
    dark ? colorDarkTextPrimary : colorLightTextPrimary

    readonly property color colorTextSecondary:
    dark ? colorDarkTextSecondary : colorLightTextSecondary

    readonly property color colorTextTertiary:
    dark ? colorDarkTextTertiary : colorLightTextTertiary

    readonly property color colorTextOnPrimary:
    dark ? colorDarkTextOnPrimary : colorLightTextOnPrimary

    readonly property color colorSuccess:
    dark ? colorDarkSuccess : colorLightSuccess

    readonly property color colorWarning:
    dark ? colorDarkWarning : colorLightWarning

    readonly property color colorDanger:
    dark ? colorDarkDanger : colorLightDanger

    readonly property color colorInfo:
    dark ? colorDarkInfo : colorLightInfo
}
