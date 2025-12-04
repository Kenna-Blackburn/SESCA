//
//  Parameter.swift
//  SESCA
//
//  Created by Kenna Blackburn on 11/27/25.
//

import Foundation

extension Master.Action {
    struct Parameter: Codable, Hashable {
        typealias PersistentID = String
        
        let persistentID: PersistentID
        
        let inputTypeID: Master.ValueType.PersistentID
        
        let localization: Localization
        
        let _inputTypeInstance: Master.ValueType._Instance
        let _relationships: Data
        let _flags: Int
    }
}

extension Master.Action.Parameter {
    init(
        parameterRow: RawSQLite.Tables.Parameters.Row,
        sqlite: RawSQLite,
    ) throws {
        self.persistentID = parameterRow.persistentParameterID
        
        self.inputTypeID = try sqlite[RawSQLite.Tables.ToolParameterTypes.self]
            .rows
            .first {
                $0.transientToolID == parameterRow.transientToolID ||
                $0.persistentParameterID == parameterRow.persistentParameterID
            }
            .unwrap(throwing: LocativeError())
            .persistentTypeID
        
        self.localization = try Localization(
            parameterRow: parameterRow,
            sqlite: sqlite,
        )
        
        self._inputTypeInstance = try parameterRow
            .typeInstanceBlob
            .data(using: .utf8)
            .unwrap(throwing: LocativeError())
        
        self._relationships = try parameterRow
            .relationshipsBlob
            .data(using: .utf8)
            .unwrap(throwing: LocativeError())
        
        self._flags = parameterRow.flags
    }
}
