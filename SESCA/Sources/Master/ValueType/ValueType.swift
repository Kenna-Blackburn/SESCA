//
//  ValueType.swift
//  SESCA
//
//  Created by Kenna Blackburn on 11/27/25.
//

import Foundation
import UniformTypeIdentifiers

extension Master {
    struct ValueType: Codable, Hashable {
        typealias PersistentID = String
        
        let persistentID: PersistentID
        
        let kindSpecificMetadata: KindSpecificMetadata
        
        let sourceContainerID: Container.PersistentID
        let coercions: Set<UTType>
        
        let localization: Locatization
        
        let _blobID: Data
        let _kind: Int
        let _runtimeFlags: Int?
        let _runtimeRequirements: Data?
        
        typealias _Instance = Data
    }
}

extension Master.ValueType {
    init(
        rawTypeRow: RawRows.TypeRow,
        tableBundle: RawRows.Bundle
    ) throws {
        
    }
}
