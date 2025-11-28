//
//  Case+Locatization.swift
//  SESCA
//
//  Created by Kenna Blackburn on 11/27/25.
//

import Foundation

extension Master.ValueType.KindSpecificMetadata.Enumeration.Case {
    struct Locatization: Codable, Hashable {
        let localeID: String
        
        let title: String
        let subtitle: String?
    }
}
