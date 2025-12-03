//
//  ValueType+Locatization.swift
//  SESCA
//
//  Created by Kenna Blackburn on 11/27/25.
//

import Foundation

extension Master.ValueType {
    struct Locatization: Codable, Hashable {
        let localeID: String
        
        let name: String
        
        let _numericFormat: String?
    }
}

extension Master.ValueType.Locatization {
    init?(
        typeRow: RawSQLite.Tables.Types.Row,
        sqlite: RawSQLite,
    ) throws {
        guard let typeDisplayRepresentationRow = sqlite[RawSQLite.Tables.TypeDisplayRepresentations.self]
            .rows
            .first(where: { $0.persistentTypeID == typeRow.persistentTypeID })
        else {
            return nil
        }
        
        self.localeID = typeDisplayRepresentationRow.locale
        
        self.name = typeDisplayRepresentationRow.name
        
        self._numericFormat = typeDisplayRepresentationRow.numericFormat
    }
}
