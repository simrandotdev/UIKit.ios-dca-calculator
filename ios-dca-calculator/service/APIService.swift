//
//  APIService.swift
//  ios-dca-calculator
//
//  Created by Simran Preet Narang on 2022-12-22.
//

import Foundation
import Combine

struct APIService {
    
    var API_KEY: String {
        return keys.randomElement() ?? "0TFQQ6KBK1O0KTQJ"
    }
    
    let keys = ["53ESL15XW9ZIQ97F", "A7O2IV5QO538AUOL", "0TFQQ6KBK1O0KTQJ"]
    
    func fetchSymbolsPublisher(keywords: String) -> AnyPublisher<SearchResults, Error> {
        let urlString = "https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=\(keywords)&apikey=\(API_KEY)"
        
        guard let url = URL(string: urlString) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        return URLSession
            .shared
            .dataTaskPublisher(for: url)
            .tryMap(handleResponse)
            .receive(on: DispatchQueue.main)
            .decode(type: SearchResults.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    private func handleResponse(data: Data, response: URLResponse) throws -> Data {
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        
        if httpResponse.statusCode == 200 {
            
            return data
        }
        
        throw URLError(.unknown)
    }
}
