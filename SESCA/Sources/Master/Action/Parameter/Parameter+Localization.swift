//
//  Parameter+Localization.swift
//  SESCA
//
//  Created by Kenna Blackburn on 11/27/25.
//

import Foundation

extension Master.Action.Parameter {
    struct Localization: Codable, Hashable {
        let localeID: String
        
        let name: String
        
        let descriptionSummary: String?
        
        let booleanDisplay: BooleanDisplay?
    }
}
