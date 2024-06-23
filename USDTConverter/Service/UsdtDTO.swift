//
//  UsdtDTO.swift
//  USDTConverter
//
//  Created by Emil Shpeklord on 23.06.2024.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let usdtDTO = try? JSONDecoder().decode(UsdtDTO.self, from: jsonData)

import Foundation

// MARK: - UsdtDTO
struct UsdtDTO: Codable {
    let data: DataClass?
    let status: Status?
}

// MARK: - DataClass
struct DataClass: Codable {
    let id, rank: Int?
    let slug, name, symbol, category: String?
    let type: String?
    let volume24HBase: Double?
    let circulatingSupply, totalSupply: Int?
    let images: Images?
    let values: [String: [String: Double]]?
    let lastUpdated: String?
    let links: [Link]?
    let tokens: [Token]?

    enum CodingKeys: String, CodingKey {
        case id, rank, slug, name, symbol, category, type
        case volume24HBase = "volume24hBase"
        case circulatingSupply, totalSupply, images, values, lastUpdated, links, tokens
    }
}

// MARK: - Images
struct Images: Codable {
    let the16X16, the200X200, the60X60: String?

    enum CodingKeys: String, CodingKey {
        case the16X16 = "16x16"
        case the200X200 = "200x200"
        case the60X60 = "60x60"
    }
}

// MARK: - Link
struct Link: Codable {
    let type: String?
    let value: String?
}

// MARK: - Token
struct Token: Codable {
    let tokenAddress: String?
    let platform: Platform?
}

// MARK: - Platform
struct Platform: Codable {
    let id: Int?
    let name, slug: String?
}

// MARK: - Status
struct Status: Codable {
    let time: String?
    let success: Bool?
    let code: Int?
    let message: String?
    let responseTime, creditsCost: Int?
}
