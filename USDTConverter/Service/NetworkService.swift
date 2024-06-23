//
//  UsdtService.swift
//  USDTConverter
//
//  Created by Emil Shpeklord on 23.06.2024.
//

import Foundation

final class NetworkService {
    
    func getUsdtCourse() async throws -> UsdtDTO? {
        var components = URLComponents(string: Endpoints.cryptoBase)
        components?.path = Endpoints.cryptoApiPath
        components?.queryItems = [
            URLQueryItem(name: "api_key", value: Endpoints.cryptoApiKey)
        ]
        guard let url = components?.url else { return nil }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return try JSONDecoder().decode(UsdtDTO.self, from: data)
        } catch let error {
            throw error
        }
    }
    
    func getMoneyCourse() async throws -> MoneyDTO? {
        guard let url = URL(string: Endpoints.cbrApiString) else { return nil }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return try JSONDecoder().decode(MoneyDTO.self, from: data)
        } catch let error {
            throw error
        }
    }
}
