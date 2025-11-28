//
//  Property.swift
//  SESCA
//
//  Created by Kenna Blackburn on 11/27/25.
//

import Foundation

extension Master.ValueType.KindSpecificMetadata.Entity {
    struct Property: Codable, Hashable {
        typealias PersistentID = String
        
        let persistentID: PersistentID
        
        let localization: Locatization
        
        let _typeInstance: Master.ValueType._Instance
    }
}
