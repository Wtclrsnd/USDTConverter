//
//  MoneyDTO.swift
//  USDTConverter
//
//  Created by Emil Shpeklord on 23.06.2024.
//

import Foundation

// MARK: - MoneyDTO
struct MoneyDTO: Codable {
    let valute: [String: Valute]?

    enum CodingKeys: String, CodingKey {
        case valute = "Valute"
    }
}

// MARK: - Valute
struct Valute: Codable {
    let id, numCode, charCode: String?
    let nominal: Int?
    let name: String?
    let value, previous: Double?

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case numCode = "NumCode"
        case charCode = "CharCode"
        case nominal = "Nominal"
        case name = "Name"
        case value = "Value"
        case previous = "Previous"
    }
}

