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

#include "atomic.dex.pch.hpp"
#include "atomic.dex.utilities.hpp"
#include <doctest/doctest.h>

TEST_CASE("AtomicDex Pro get_atomic_dex_data_folder()")
{
    auto result = get_atomic_dex_data_folder();
    MESSAGE("Result is [" << result << "]");
    CHECK_FALSE(result.string().empty());
}

TEST_CASE("AtomicDex Pro get_atomic_dex_logs_folder()")
{
    auto result = get_atomic_dex_logs_folder();
    MESSAGE("Result is [" << result.string() << "]");
    CHECK_FALSE(result.string().empty());
    CHECK(fs::exists(result));
}

TEST_CASE("AtomicDex Pro get_atomic_dex_current_log_file()")
{
    auto result = get_atomic_dex_current_log_file();
    MESSAGE("Result is [" << result.string() << "]");
    CHECK_FALSE(result.string().empty());
    CHECK_FALSE(fs::exists(result));
}