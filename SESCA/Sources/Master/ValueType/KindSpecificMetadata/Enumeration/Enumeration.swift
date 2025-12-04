//
//  Enumeration.swift
//  SESCA
//
//  Created by Kenna Blackburn on 11/27/25.
//

import Foundation

extension Master.ValueType.KindSpecificMetadata {
    struct Enumeration: Codable, Hashable {
        let cases: [Case]
    }
}

extension Master.ValueType.KindSpecificMetadata.Enumeration {
    init(
        typeRow: RawSQLite.Tables.Types.Row,
        sqlite: RawSQLite,
    ) throws {
        self.cases = try sqlite[RawSQLite.Tables.EnumerationCases.self]
            .rows
            .filter({ $0.persistentEnumerationID == typeRow.persistentTypeID })
            .map({ try Case(caseRow: $0, sqlite: sqlite) })
            .sorted(using: SortDescriptor(\.persistentID))
    }
}
