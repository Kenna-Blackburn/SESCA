//
//  ValueType+Locatization.swift
//  SESCA
//
//  Created by Kenna Blackburn on 11/27/25.
//

import Foundation

extension Master.ValueType {
    struct Locatization: Codable, Hashable {
        let localeID: String
        
        let name: String
    }
}
