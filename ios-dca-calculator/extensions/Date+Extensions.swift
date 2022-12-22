//
//  Date+Extensions.swift
//  ios-dca-calculator
//
//  Created by Kelvin Fok on 30/11/20.
//

import Foundation

extension Date {
    
    var MMYYFormat: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM yyyy"
        return dateFormatter.string(from: self)
    }
    
}
