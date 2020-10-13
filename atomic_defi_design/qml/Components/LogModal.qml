import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

import "../Constants"

BasicModal {
    id: root

    property alias header: text_area.title
    property alias field: text_area.field

    ModalContent {
        title: qsTr("Log")

        TextAreaWithTitle {
            id: text_area
            Layout.fillWidth: true
            field.readOnly: true
            copyable: true
            remove_newline: false
        }

        // Buttons
        footer: [
            DefaultButton {
                text: qsTr("Close")
                Layout.fillWidth: true
                onClicked: root.close()
            }
        ]
    }
}
