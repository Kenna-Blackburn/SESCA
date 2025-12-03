//
//  Parameter+Localization.swift
//  SESCA
//
//  Created by Kenna Blackburn on 11/27/25.
//

import Foundation

extension Master.Action.Parameter {
    struct Localization: Codable, Hashable {
        let localeID: String
        
        let name: String
        
        let descriptionSummary: String?
        
        let booleanDisplay: BooleanDisplay?
    }
}

extension Master.Action.Parameter.Localization {
    init(
        parameterRow: RawSQLite.Tables.Parameters.Row,
        sqlite: RawSQLite,
    ) throws {
        let parameterLocalizationRow = try sqlite[RawSQLite.Tables.ParameterLocalizations.self]
            .rows
            .first {
                $0.transientToolID == parameterRow.transientToolID &&
                $0.persistentParameterID == parameterRow.persistentParameterID
            }
            .unwrap(throwing: LocativeError())
        
        self.localeID = parameterLocalizationRow.locale
        
        self.name = parameterLocalizationRow.name
        
        self.descriptionSummary = parameterLocalizationRow.description
        
        self.booleanDisplay = BooleanDisplay(
            true: parameterLocalizationRow.trueString,
            false: parameterLocalizationRow.falseString,
        )
    }
}
