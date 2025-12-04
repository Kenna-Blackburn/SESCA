//
//  KindSpecificMetadata.swift
//  SESCA
//
//  Created by Kenna Blackburn on 11/27/25.
//

import Foundation

extension Master.ValueType {
    enum KindSpecificMetadata: Codable, Hashable {
        case entity(Entity)
        case enumeration(Enumeration)
        
        func encode(to encoder: any Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            switch self {
            case .entity(let entity):
                try container.encode(entity, forKey: .entity)
            case .enumeration(let enumeration):
                try container.encode(enumeration, forKey: .enumeration)
            }
        }
        
        init(from decoder: any Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            if let entity = try container.decodeIfPresent(Entity.self, forKey: .entity) {
                self = .entity(entity)
                
                return
            }
            
            if let enumeration = try container.decodeIfPresent(Enumeration.self, forKey: .enumeration) {
                self = .enumeration(enumeration)
                
                return
            }
            
            throw LocativeError()
        }
        
        enum CodingKeys: String, CodingKey {
            case entity
            case enumeration
        }
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
                try Entity(
                    typeRow: typeRow,
                    sqlite: sqlite,
                )
            )
            
            return
        }
        
        if sqlite[RawSQLite.Tables.EnumerationCases.self]
            .rows
            .contains(where: { $0.persistentEnumerationID == typeRow.persistentTypeID })
        {
            self = .enumeration(
                try Enumeration(
                    typeRow: typeRow,
                    sqlite: sqlite,
                )
            )
            
            return
        }
        
        return nil
    }
}
