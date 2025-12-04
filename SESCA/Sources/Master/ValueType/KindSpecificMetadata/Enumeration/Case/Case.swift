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

extension Master.ValueType.KindSpecificMetadata.Enumeration.Case {
    init(
        caseRow: RawSQLite.Tables.EnumerationCases.Row,
        sqlite: RawSQLite,
    ) throws {
        self.persistentID = caseRow.persistentCaseID
        
        self.localization = try Locatization(
            caseRow: caseRow,
            sqlite: sqlite,
        )
    }
}
