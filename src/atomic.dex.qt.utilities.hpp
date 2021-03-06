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

#include <QJsonObject>
#include <QString>
#include <QVariantList>

//! Project headers
#include "atomic.dex.coins.config.hpp"
#include "atomic.dex.pch.hpp"
#include "atomic.dex.provider.coinpaprika.hpp"
#include "atomic.dex.wallet.config.hpp"

namespace atomic_dex
{
    bool        am_i_able_to_reach_this_endpoint(const QString& endpoint);
    QStringList vector_std_string_to_qt_string_list(const std::vector<std::string>& vec);
    QJsonArray  nlohmann_json_array_to_qt_json_array(const nlohmann::json& j);
    QJsonObject nlohmann_json_object_to_qt_json_object(const nlohmann::json& j);
    QString     retrieve_change_24h(const atomic_dex::coinpaprika_provider& paprika, const atomic_dex::coin_config& coin, const atomic_dex::cfg& config);
} // namespace atomic_dex