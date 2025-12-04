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

extension Master.ValueType.KindSpecificMetadata.Entity.Property {
    init(
        propertyRow: RawSQLite.Tables.EntityProperties.Row,
        sqlite: RawSQLite,
    ) throws {
        self.persistentID = propertyRow.persistentPropertyID
        
        self.localization = try Locatization(
            propertyRow: propertyRow,
            sqlite: sqlite,
        )
        
        self._typeInstance = try propertyRow
            .typeInstanceBlob
            .data(using: .utf8)
            .unwrap(throwing: LocativeError())
    }
}
