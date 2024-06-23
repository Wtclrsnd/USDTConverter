//
//  MainPresenter.swift
//  USDTConverter
//
//  Created by Emil Shpeklord on 23.06.2024.
//

import Foundation

final class MainPresenter {
    
    private let service: NetworkService
    
    private var model: Model?
    
    init(_ service: NetworkService) {
        self.service = service
    }
    
    func getCurrencyModel() async throws -> Model? {
        let usdtCourse = try await getUSDTCourse()
        let usdCourse = try await getMoneyCorse()
        model = Model(usdtCourseInUsd: usdtCourse, usdCourseInRub: usdCourse)
        return model
    }
    
    func calculateSalaryInRub(salary: Double, hours: Int) -> Double {
        guard let model = model else { return 0 }
        return salary * Double(hours) * model.usdtCourseInUsd * model.usdtCourseInRub
    }
    
    private func getUSDTCourse() async throws -> Double {
        let dto = try await service.getUsdtCourse()
        let value = String(format: "%.6f", dto?.data?.values?["USD"]?["price"] ?? 0)
        return Double(value) ?? 0
    }
    
    private func getMoneyCorse() async throws -> Double {
        let dto = try await service.getMoneyCourse()
        let value = String(format: "%.3f", dto?.valute?["USD"]?.value ?? 0)
        return Double(value) ?? 0
    }
}
