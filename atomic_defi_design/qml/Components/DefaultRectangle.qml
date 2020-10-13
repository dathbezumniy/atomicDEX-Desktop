import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

import QtGraphicalEffects 1.0

import "../Constants"

AnimatedRectangle {
    id: rect
    radius: Style.rectangleCornerRadius
    color: Style.colorRectangle
    border.color: Style.colorBorder
    border.width: 1
}

