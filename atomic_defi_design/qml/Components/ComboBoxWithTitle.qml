import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

import "../Constants"

ColumnLayout {
    property alias title: title_text.text
    property alias field: input_field
    property alias model: input_field.model
    property alias currentIndex: input_field.currentIndex
    property alias currentText: input_field.currentText
    property alias currentValue: input_field.currentValue
    property alias textRole: input_field.textRole
    property alias valueRole: input_field.valueRole

    DefaultText {
        id: title_text
    }

    DefaultComboBox {
        id: input_field
        Layout.fillWidth: true
    }
}



/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
