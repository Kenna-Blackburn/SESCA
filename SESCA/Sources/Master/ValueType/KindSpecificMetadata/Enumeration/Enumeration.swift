//
//  Enumeration.swift
//  SESCA
//
//  Created by Kenna Blackburn on 11/27/25.
//

import Foundation

extension Master.ValueType.KindSpecificMetadata {
    struct Enumeration: Codable, Hashable {
        let cases: Set<Case>
        
        
    }
}
