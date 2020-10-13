import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

import "../Constants"

TextArea {
    id: text_field

    font.family: Style.font_family
    placeholderTextColor: Style.colorPlaceholderText
    Behavior on color { ColorAnimation { duration: Style.animationDuration } }
    Behavior on placeholderTextColor { ColorAnimation { duration: Style.animationDuration } }

    property bool remove_newline: true
    wrapMode: TextEdit.Wrap

    KeyNavigation.priority: KeyNavigation.BeforeItem
    KeyNavigation.backtab: nextItemInFocusChain(false)
    KeyNavigation.tab: nextItemInFocusChain(true)
    Keys.onPressed: {
        if(event.key === Qt.Key_Return) {
            if(onReturn !== undefined) {
                onReturn()
            }

            // Ignore \n \r stuff
            if(remove_newline) event.accepted = true
        }
    }

    onTextChanged: {
        if(remove_newline) {
            if(text.indexOf('\r') !== -1 || text.indexOf('\n') !== -1) {
                text = text.replace(/[\r\n]/, '')
            }
        }
    }

    // Right click Context Menu
    selectByMouse: true
    persistentSelection: true

    background: InnerBackground { }

    RightClickMenu { }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
