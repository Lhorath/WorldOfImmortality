/*
 * Copyright (C) 2008-2011 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#include "HMACSHA1.h"
#include "BigNumber.h"

/*
* -- HERE GOES COMPATIBILITY HELPER 
* Lhorath added this to Help With Modern COMPILATION
*/
#if OPENSSL_VERSION_NUMBER < 0x11000000L
inline HMAC_CTX* HMAC_CTX_new() {
    HMAC_CTX *ctx = new HMAC_CTX;
    HMAC_CTX_init(ctx);
    return ctx;
}
inline void HMAC_CTX_free(HMAC_CTX *ctx) {
    HMAC_CTX_cleanup(ctx);
    delete ctx;
}
#endif

HmacHash::HmacHash(uint32 len, uint8 *seed)
#if OPENSSL_VERSION_NUMBER >= 0x10100000L
    : m_ctx(HMAC_CTX_new())
#else
    : m_ctx(new HMAC_CTX)
#endif
{
#if OPENSSL_VERSION_NUMBER < 0x10100000L
    HMAC_CTX_init(m_ctx);
#endif
    HMAC_Init_ex(m_ctx, seed, len, EVP_sha1(), NULL);
}

HmacHash::~HmacHash()
{
#if OPENSSL_VERSION_NUMBER >= 0x10100000L
    HMAC_CTX_free(m_ctx);
#else
    HMAC_CTX_cleanup(m_ctx);
    delete m_ctx;
#endif
}

void HmacHash::UpdateBigNumber(BigNumber *bn)
{
    UpdateData(bn->AsByteArray(), bn->GetNumBytes());
}

void HmacHash::UpdateData(const uint8 *data, int length)
{
    HMAC_Update(m_ctx, data, length);
}

void HmacHash::UpdateData(const std::string &str)
{
    UpdateData((uint8 const*)str.c_str(), str.length());
}

void HmacHash::Finalize()
{
    uint32 length = 0;
    HMAC_Final(m_ctx, (uint8*)m_digest, &length);
    ASSERT(length == SHA_DIGEST_LENGTH)
}

uint8 *HmacHash::ComputeHash(BigNumber *bn)
{
    HMAC_Update(m_ctx, bn->AsByteArray(), bn->GetNumBytes());
    Finalize();
    return (uint8*)m_digest;
}
