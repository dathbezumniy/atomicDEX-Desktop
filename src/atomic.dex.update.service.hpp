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

#include <antara/gaming/ecs/system.hpp>
#include <boost/thread/synchronized_value.hpp>

namespace atomic_dex
{
    class update_system_service final : public ag::ecs::pre_update_system<update_system_service>
    {
        //! Private typedefs
        using t_update_time_point = std::chrono::high_resolution_clock::time_point;
        using t_json_synchronized = boost::synchronized_value<nlohmann::json>;

        //! Private members
        t_json_synchronized m_update_status;
        t_update_time_point m_update_clock;

        //! Private API
        void fetch_update_status() noexcept;

      public:
        //! Constructor
        explicit update_system_service(entt::registry& registry);
        ~update_system_service() noexcept final = default;

        //! Public override
        void update() noexcept final;

        //! Public API
        [[nodiscard]] nlohmann::json get_update_status() const noexcept;
    };
} // namespace atomic_dex

REFL_AUTO(type(atomic_dex::update_system_service))