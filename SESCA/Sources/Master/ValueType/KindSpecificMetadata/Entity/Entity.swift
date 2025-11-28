//
//  Entity.swift
//  SESCA
//
//  Created by Kenna Blackburn on 11/27/25.
//

import Foundation

extension Master.ValueType.KindSpecificMetadata {
    struct Entity: Codable, Hashable {
        let properties: Set<Property>
    }
}
