/******************************************************************************
 * Copyright © 2013-2019 The Komodo Platform Developers.                      *
 *                                                                            *
 * See the AUTHORS, DEVELOPER-AGREEMENT and LICENSE files at                  *
 * the top-level directory of this distribution for the individual copyright  *
 * holder information and the developer policies on copyright and licensing.  *
 *                                                                            *
 * Unless otherwise agreed in a custom licensing agreement, no part of the    *
 * Komodo Platform software, including this file may be copied, modified,     *
 * propagated or distributed except according to the terms contained in the   *
 * LICENSE file                                                               *
 *                                                                            *
 * Removal or modification of this copyright notice is prohibited.            *
 *                                                                            *
 ******************************************************************************/

#pragma once

//! QT Include
#include <QObject>

//! Deps
#include <entt/signal/dispatcher.hpp>

//! Project Headers
#include "atomic.dex.qt.events.hpp"

namespace atomic_dex
{
    class notification_manager final : public QObject
    {
        Q_OBJECT
      public:
        notification_manager(entt::dispatcher& dispatcher, QObject* parent = nullptr) noexcept;
        ~notification_manager() noexcept final;

        //! Public API
        void connect_signals() noexcept;
        void disconnect_signals() noexcept;

        //! Callbacks
        void on_swap_status_notification(const swap_status_notification& evt);
        void on_balance_update_notification(const balance_update_notification& evt);

      signals:
        void updateSwapStatus(QString old_swap_status, QString new_swap_status, QString swap_uuid, QString base_coin, QString rel_coin, QString human_date);
        void balanceUpdateStatus(bool am_i_sender, QString amount, QString ticker, QString human_date, qint64 timestamp);

      private:
        entt::dispatcher& m_dispatcher;
    };
} // namespace atomic_dex