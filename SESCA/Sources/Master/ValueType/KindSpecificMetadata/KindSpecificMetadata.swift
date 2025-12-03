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

extension Master.ValueType.KindSpecificMetadata {
    init?(
        typeRow: RawSQLite.Tables.Types.Row,
        sqlite: RawSQLite,
    ) throws {
        if sqlite[RawSQLite.Tables.EntityProperties.self]
            .rows
            .contains(where: { $0.persistentEntityID == typeRow.persistentTypeID })
        {
            self = .entity(
                try Master.ValueType.KindSpecificMetadata.Entity(
                    typeRow: typeRow,
                    sqlite: sqlite,
                )
            )
        }
        
        if sqlite[RawSQLite.Tables.EnumerationCases.self]
            .rows
            .contains(where: { $0.persistentEnumerationID == typeRow.persistentTypeID })
        {
            self = .enumeration(
                try Master.ValueType.KindSpecificMetadata.Enumeration(
                    typeRow: typeRow,
                    sqlite: sqlite,
                )
            )
        }
        
        return nil
    }
}
