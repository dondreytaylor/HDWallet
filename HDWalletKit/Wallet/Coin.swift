//
//  Coin.swift
//  HDWalletKit
//
//  Created by Pavlo Boiko on 10/3/18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation

public enum Coin {
    case bitcoin
    case bitcointestnet
    case ethereum
    case litecoin
    case bitcoinCash
    case dash
    case bithereum

    //https://github.com/satoshilabs/slips/blob/master/slip-0132.md
    public var privateKeyVersion: UInt32 {
        switch self {
        case .litecoin:
            return 0x019D9CFE
        case .bithereum: fallthrough
        case .bitcoinCash: fallthrough
        case .bitcoin:
            return 0x0488ADE4
        case .bitcointestnet:
            return 0x04358394
        case .dash:
            return 0x02FE52CC
        default:
            fatalError("Not implemented")
        }
    }
    // P2PKH
    public var publicKeyHash: UInt8 {
        switch self {
        case .litecoin:
            return 0x30
        case .bitcoinCash: fallthrough
        case .bitcoin:
            return 0x00
        case .bitcointestnet:
            return 0x6F
        case .dash:
            return 0x4C
        case .bithereum:
            return 0x19
        default:
            fatalError("Not implemented")
        }
    }

    // P2SH
    public var scriptHash: UInt8 {
        switch self {
        case .bitcoinCash: fallthrough
        case .litecoin: fallthrough
        case .bitcoin:
            return 0x05
        case .bithereum:
            return 0x28
        case .bitcointestnet:
            return 0xC4
        case .dash:
            return 0x10
        default:
            fatalError("Not implemented")
        }
    }

    //https://www.reddit.com/r/litecoin/comments/6vc8tc/how_do_i_convert_a_raw_private_key_to_wif_for/
    public var wifAddressPrefix: UInt8 {
        switch self {
        case .bithereum: fallthrough
        case .bitcoinCash: fallthrough
        case .bitcoin:
            return 0x80
        case .bitcointestnet:
            return 0xEF
        case .litecoin:
            return 0xB0
        case .dash:
            return 0xCC
        default:
            fatalError("Not implemented")
        }
    }

    public var addressPrefix:String {
        switch self {
        case .ethereum:
            return "0x"
        default:
            return ""
        }
    }

    public var uncompressedPkSuffix: UInt8 {
        return 0x01
    }


    public var coinType: UInt32 {
        switch self {
        case .bitcoin:
            return 0
        case .litecoin:
            return 2
        case .dash:
            return 5
        case .ethereum:
            return 60
        case .bitcoinCash:
            return 145
        case .bithereum:
            return 469
        case .bitcointestnet:
            return 1
        }
    }

    public var scheme: String {
        switch self {
        case .bitcoin:
            return "bitcoin"
        case .litecoin:
            return "litecoin"
        case .bitcoinCash:
            return "bitcoincash"
        case .bitcointestnet:
            return "bitcointestnet"
        case .dash:
            return "dash"
        case .bithereum:
            return "bithereum"
        default: return ""
        }
    }
}
