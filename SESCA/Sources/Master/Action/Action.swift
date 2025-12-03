//
//  Action.swift
//  SESCA
//
//  Created by Kenna Blackburn on 11/27/25.
//

import Foundation

extension Master {
    struct Action: Codable, Hashable {
        typealias PersistentID = String
        
        let persistentID: PersistentID
        
        let parameters: [Parameter]
        let outputTypeID: ValueType.PersistentID
        
        let sourceContainerID: Container.PersistentID
        let attributionContainerID: Container.PersistentID?
        
        let localization: Master.Action.Localization
        
        let _flags: Int
        let _visibilityFlags: Int
        let _requirements: Data
        let _authenticationPolicy: String
        let _customIcon: Data?
        let _sourceActionProviderID: String
        let _outputTypeInstance: ValueType._Instance
    }
}

extension Master.Action {
    init(
        toolRow: RawSQLite.Tables.Tools.Row,
        sqlite: RawSQLite,
    ) throws {
        self.persistentID = toolRow.persistentToolID
        
        self.parameters = try sqlite[RawSQLite.Tables.Parameters.self]
            .rows
            .filter({ $0.transientToolID == toolRow.transientToolID })
            .sorted(using: SortDescriptor(\.sortOrder))
            .map({ try Master.Action.Parameter(parameterRow: $0, sqlite: sqlite) })
        
        self.outputTypeID = try sqlite[RawSQLite.Tables.ToolOutputTypes.self]
            .rows
            .first(where: { $0.transientToolID == toolRow.transientToolID })
            .unwrap(throwing: LocativeError())
            .persistentTypeID
        
        self.sourceContainerID = try sqlite[RawSQLite.Tables.ContainerMetadata.self]
            .rows
            .first(where: { $0.transientContainerID == toolRow.transientSourceContainerID })
            .unwrap(throwing: LocativeError())
            .persistentContainerID
        
        if let transientAttributionContainerID = toolRow.transientAttributionContainerID {
            self.attributionContainerID = try sqlite[RawSQLite.Tables.ContainerMetadata.self]
                .rows
                .first(where: { $0.transientContainerID == transientAttributionContainerID })
                .unwrap(throwing: LocativeError())
                .persistentContainerID
        } else {
            self.attributionContainerID = nil
        }
        
        self.localization = try Master.Action.Localization(
            toolRow: toolRow,
            sqlite: sqlite,
        )
        
        self._flags = toolRow.flags
        
        self._visibilityFlags = toolRow.visibilityFlags
        
        self._requirements = try toolRow
            .requirementsBlob
            .data(using: .utf8)
            .unwrap(throwing: LocativeError())
        
        self._authenticationPolicy = toolRow.authenticationPolicy
        
        if let customIconBlob = toolRow.customIconBlob {
            self._customIcon = try customIconBlob
                .data(using: .utf8)
                .unwrap(throwing: LocativeError())
        } else {
            self._customIcon = nil
        }
        
        self._sourceActionProviderID = toolRow.sourceActionProvider
        
        self._outputTypeInstance = try toolRow
            .outputTypeInstanceBlob
            .data(using: .utf8)
            .unwrap(throwing: LocativeError())
    }
}
