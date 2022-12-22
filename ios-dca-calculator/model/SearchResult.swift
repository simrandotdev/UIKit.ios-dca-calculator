//
//  BestMatches.swift
//  ios-dca-calculator
//
//  Created by Simran Preet Narang on 2022-12-23.
//

import Foundation


// MARK: - BestMatch


struct SearchResult: Codable {
    let symbol, name, type, region: String
    let marketOpen, marketClose, timeZone, currency: String
    let matchScore: String

    enum CodingKeys: String, CodingKey {
        case symbol = "1. symbol"
        case name = "2. name"
        case type = "3. type"
        case region = "4. region"
        case marketOpen = "5. marketOpen"
        case marketClose = "6. marketClose"
        case timeZone = "7. timezone"
        case currency = "8. currency"
        case matchScore = "9. matchScore"
    }
}
