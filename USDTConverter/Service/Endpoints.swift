//
//  Endpoints.swift
//  USDTConverter
//
//  Created by Emil Shpeklord on 23.06.2024.
//

import Foundation

struct Endpoints {
    
    static var cryptoBase: String {
        "https://api.cryptorank.io"
    }
    
    static var cryptoApiPath: String {
        "/v1/currencies/16"
    }

    static var cryptoApiKey: String {
        "06d6e629e3640e87ceca9866fa9fb1834890e14e2db4ea86ba2635499e06"
    }
    
    static var cbrApiString: String {
        "https://www.cbr-xml-daily.ru/daily_json.js"
    }
}
