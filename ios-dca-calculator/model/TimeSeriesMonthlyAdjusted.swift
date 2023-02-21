//
//  TimeSeriesMonthlyAdjusted.swift
//  ios-dca-calculator
//
//  Created by Simran Preet Narang on 2023-02-21.
//

import Foundation

struct TimeSeriesMonthlyAdjusted: Codable {
    let meta: Meta
    let timeSeries: [String: OHLC]
}


struct Meta: Codable {
    
    let symbol: String
    
    enum CodingKeys: String, CodingKey {
        case symbol = "2. Symbol"
    }
    
}

struct OHLC: Codable {
    let open: String
    let high: String
    let low: String
    let close: String
    
    enum CodingKeys: String, CodingKey {
        case open = "1. open"
        case high = "2. high"
        case low = "3. low"
        case close = "4. close"
    }
}
