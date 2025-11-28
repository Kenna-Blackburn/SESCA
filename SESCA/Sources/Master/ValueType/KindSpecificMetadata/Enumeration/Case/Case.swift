//
//  Case.swift
//  SESCA
//
//  Created by Kenna Blackburn on 11/27/25.
//

import Foundation

extension Master.ValueType.KindSpecificMetadata.Enumeration {
    struct Case: Codable, Hashable {
        typealias PersistentID = String
        
        let persistentID: PersistentID
        
        let localization: Locatization
        
        
    }
}
