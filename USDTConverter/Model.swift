//
//  Model.swift
//  USDTConverter
//
//  Created by Emil Shpeklord on 23.06.2024.
//

import Foundation

struct Model {

    let usdtCourseInUsd: Double
    let usdtCourseInRub: Double
    
    init (usdtCourseInUsd: Double, usdCourseInRub: Double) {
        self.usdtCourseInUsd = usdtCourseInUsd
        self.usdtCourseInRub = usdtCourseInUsd * usdCourseInRub
    }
}
