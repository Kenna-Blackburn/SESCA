//
//  Property+Locatization.swift
//  SESCA
//
//  Created by Kenna Blackburn on 11/27/25.
//

import Foundation

extension Master.ValueType.KindSpecificMetadata.Entity.Property {
    struct Locatization: Codable, Hashable {
        let localeID: String
        
        let name: String
    }
}

extension Master.ValueType.KindSpecificMetadata.Entity.Property.Locatization {
    init(
        propertyRow: RawSQLite.Tables.EntityProperties.Row,
        sqlite: RawSQLite,
    ) throws {
        let propertyLocalizationRow = try sqlite[RawSQLite.Tables.EntityPropertyLocalizations.self]
            .rows
            .first {
                $0.persistentEntityID == propertyRow.persistentEntityID &&
                $0.persistentPropertyID == propertyRow.persistentPropertyID
            }
            .unwrap(throwing: LocativeError())
        
        self.localeID = propertyLocalizationRow.locale
        
        self.name = propertyLocalizationRow.displayName
    }
}
