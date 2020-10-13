import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

import "Screens"
import "Constants"
import "Components"

Rectangle {
    id: app

    color: Style.colorTheme8

    property string selected_wallet_name: ""

    function firstPage() {
        return !API.app.first_run() && selected_wallet_name !== "" ? idx_login : idx_first_launch
    }

    function cleanApp() {
        dashboard.reset()
    }

    function onDisconnect() { openFirstLaunch() }

    function openFirstLaunch(force=false, set_wallet_name=true) {
        if(set_wallet_name) selected_wallet_name = API.app.wallet_default_name
        cleanApp()

        current_page = force ? idx_first_launch : firstPage()
        first_launch.updateWallets()
    }

    Component.onCompleted: openFirstLaunch()

    readonly property int idx_first_launch: 0
    readonly property int idx_recover_seed: 1
    readonly property int idx_new_user: 2
    readonly property int idx_login: 3
    readonly property int idx_initial_loading: 4
    readonly property int idx_dashboard: 5
    property int current_page

    onCurrent_pageChanged: {
        if(current_page === idx_new_user) {
            new_user.onOpened()
        }
    }

    NoConnection {
        id: no_connection_page
        anchors.fill: parent
    }

    StackLayout {
        visible: !no_connection_page.visible

        anchors.fill: parent

        currentIndex: current_page
        onCurrentIndexChanged: {
            if(current_page === idx_login)
                login.forceActiveFocus()
        }

        FirstLaunch {
            id: first_launch
            onClickedNewUser: () => { current_page = idx_new_user }
            onClickedRecoverSeed: () => { current_page = idx_recover_seed }
            onClickedWallet: () => { current_page = idx_login }
        }

        RecoverSeed {
            onClickedBack: () => { openFirstLaunch() }
            postConfirmSuccess: () => { openFirstLaunch(false, false) }
        }

        NewUser {
            id: new_user
            onClickedBack: () => { openFirstLaunch() }
            postCreateSuccess: () => { openFirstLaunch(false, false) }
        }

        Login {
            id: login
            onClickedBack: () => { openFirstLaunch(true) }
            postLoginSuccess: () => {
                current_page = idx_initial_loading
                cleanApp()
            }
        }

        InitialLoading {
            id: initial_loading
            onLoaded: () => { current_page = idx_dashboard }
        }

        Dashboard {
            id: dashboard
        }
    }

    // Error Modal
    LogModal {
        id: error_log_modal
    }

    function showError(title, content) {
        if(content === undefined || content === null) return
        error_log_modal.header = title
        error_log_modal.field.text = content
        error_log_modal.open()
    }

    // Toast
    ToastManager {
        id: toast
    }

    // Update Modal
    UpdateModal {
        id: update_modal
    }

    UpdateNotificationLine {
        anchors.top: parent.top
        anchors.right: parent.right
    }
}



/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
