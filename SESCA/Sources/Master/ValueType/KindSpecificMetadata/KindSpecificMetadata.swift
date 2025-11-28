//
//  KindSpecificMetadata.swift
//  SESCA
//
//  Created by Kenna Blackburn on 11/27/25.
//

extension Master.ValueType {
    enum KindSpecificMetadata: Codable, Hashable {
        case entity(Entity)
        case enumeration(Enumeration)
        
        
        
        
    }
}
