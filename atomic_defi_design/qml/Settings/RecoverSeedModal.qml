import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

import "../Components"
import "../Constants"

BasicModal {
    id: root

    property bool wrong_password: false
    property string seed: ''

    function tryViewSeed() {
        if(!submit_button.enabled) return

        const result = API.app.retrieve_seed(API.app.wallet_default_name, input_password.field.text)

        if(result !== 'wrong password') {
            seed = result
            wrong_password = false
        }
        else {
            wrong_password = true
        }
    }

    width: 500

    onClosed: {
        seed = ''
        wrong_password = false
        input_password.reset()
    }

    ModalContent {
        title: qsTr("View Seed")

        ColumnLayout {
            visible: seed === ''

            DefaultText {
                Layout.topMargin: 10
                Layout.bottomMargin: 10
                Layout.alignment: Qt.AlignHCenter

                text_value: qsTr("Please enter your password to view the seed.")
            }

            PasswordForm {
                id: input_password
                Layout.fillWidth: true
                confirm: false
                field.onAccepted: tryViewSeed()
            }

            DefaultText {
                text_value: qsTr("Wrong Password")
                color: Style.colorRed
                visible: wrong_password
            }
        }

        TextAreaWithTitle {
            visible: seed !== ''

            title: qsTr("Seed")
            field.text: seed
            field.readOnly: true
            copyable: true
        }

        // Buttons
        footer: [
            DefaultButton {
                text: seed === '' ? qsTr("Cancel") : qsTr("Close")
                Layout.fillWidth: true
                onClicked: root.close()
            },

            PrimaryButton {
                id: submit_button
                visible: seed === ''
                text: qsTr("View")
                Layout.fillWidth: true
                enabled: input_password.isValid()
                onClicked: tryViewSeed()
            }
        ]
    }
}
