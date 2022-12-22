//
//  SearchResults.swift
//  ios-dca-calculator
//
//  Created by Simran Preet Narang on 2022-12-23.
//

import Foundation


// MARK: - SearchResults


struct SearchResults: Codable {
    let items: [SearchResult]
    
    enum CodingKeys: String, CodingKey {
        case items = "bestMatches"
    }
}
