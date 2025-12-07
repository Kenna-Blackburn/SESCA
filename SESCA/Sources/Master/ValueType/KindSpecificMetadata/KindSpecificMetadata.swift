//
//  KindSpecificMetadata.swift
//  SESCA
//
//  Created by Kenna Blackburn on 11/27/25.
//

import Foundation

extension Master.ValueType {
    struct KindSpecificMetadata: Codable, Hashable {
        var entity: Entity?
        var enumeration: Enumeration?
    }
}

extension Master.ValueType.KindSpecificMetadata {
    init?(
        typeRow: RawSQLite.Tables.Types.Row,
        sqlite: RawSQLite,
    ) throws {
        if sqlite[RawSQLite.Tables.EntityProperties.self]
            .rows
            .contains(where: { $0.persistentEntityID == typeRow.persistentTypeID })
        {
            self.entity = try Entity(
                typeRow: typeRow,
                sqlite: sqlite,
            )
        }
        
        if sqlite[RawSQLite.Tables.EnumerationCases.self]
            .rows
            .contains(where: { $0.persistentEnumerationID == typeRow.persistentTypeID })
        {
            self.enumeration = try Enumeration(
                typeRow: typeRow,
                sqlite: sqlite,
            )
        }
        
        if self.entity == nil,
           self.enumeration == nil
        {
            return nil
        }
    }
}
