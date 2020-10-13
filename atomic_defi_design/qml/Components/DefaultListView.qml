import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

import "../Constants"

ListView {
    id: root

    property bool scrollbar_visible: contentItem.childrenRect.height > height
    readonly property double scrollbar_margin: scrollbar_visible ? 8 : 0

    boundsBehavior: Flickable.StopAtBounds
    ScrollBar.vertical: DefaultScrollBar { }

    implicitWidth: contentItem.childrenRect.width
    implicitHeight: contentItem.childrenRect.height

    clip: true
}
