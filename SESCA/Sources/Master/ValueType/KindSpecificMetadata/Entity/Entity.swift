//
//  Entity.swift
//  SESCA
//
//  Created by Kenna Blackburn on 11/27/25.
//

import Foundation

extension Master.ValueType.KindSpecificMetadata {
    struct Entity: Codable, Hashable {
        let properties: [Property]
    }
}

extension Master.ValueType.KindSpecificMetadata.Entity {
    init(
        typeRow: RawSQLite.Tables.Types.Row,
        sqlite: RawSQLite,
    ) throws {
        self.properties = try sqlite[RawSQLite.Tables.EntityProperties.self]
            .rows
            .filter({ $0.persistentEntityID == typeRow.persistentTypeID })
            .map({ try Master.ValueType.KindSpecificMetadata.Entity.Property(propertyRow: $0, sqlite: sqlite) })
    }
}
