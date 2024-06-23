//
//  MainPresenter.swift
//  USDTConverter
//
//  Created by Emil Shpeklord on 23.06.2024.
//

import Foundation

final class MainPresenter {
    
    private let service: UsdtService
    
    init(_ service: UsdtService) {
        self.service = service
    }
    
    func convert() {
        service.convert()
    }
}
