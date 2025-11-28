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
        
        let authenticationPolicy: AuthenticationPolicy?
        
        let sourceContainerID: Container.PersistentID
        let attributionContainerID: Container.PersistentID?
        
        let localization: Localization
        
        let _flags: Int
        let _visibilityFlags: Int
        let _requirements: Data
        let _customIcon: Data?
        let _sourceActionProviderID: String
        let _outputTypeInstance: ValueType._Instance
        
        enum AuthenticationPolicy: String, Codable, Hashable {
            case requiresAuthenticationOnOriginAndRemote
            case requiresAuthenticationOnOrigin
        }
    }
}

extension Master.Action {
    init(
        rawToolRow: RawRows.ToolRow,
        tableBundle: RawRows.Bundle,
    ) throws {
        self.persistentID = rawToolRow.id
        
        self.parameters = try tableBundle
            .rawParameterRows
            .filter({ $0.toolID == rawToolRow.rowID })
            .sorted(using: SortDescriptor(\.sortOrder))
            .map({ try Master.Action.Parameter(rawParameterRow: $0, tableBundle: tableBundle) })
        
        self.outputTypeID = try tableBundle
            .rawToolOutputTypeRows
            .first(where: { $0.toolID == rawToolRow.rowID })
            .unwrap(throwing: LocativeError())
            .typeIdentifier
        
        self.authenticationPolicy = Master.Action.AuthenticationPolicy(rawValue: rawToolRow.authenticationPolicy)
        
        self.sourceContainerID = try tableBundle
            .rawContainerMetadataRows
            .first(where: { $0.rowID == rawToolRow.sourceContainerID })
            .unwrap(throwing: LocativeError())
            .id
        
        self.attributionContainerID = tableBundle
            .rawContainerMetadataRows
            .first(where: { $0.rowID == rawToolRow.attributionContainerID })?
            .id
        
        self.localization = try Master.Action.Localization(rawToolRow: rawToolRow, tableBundle: tableBundle)
        
        self._flags = rawToolRow.flags
        
        self._visibilityFlags = rawToolRow.visibilityFlags
        
        self._requirements = try rawToolRow
            .requirements
            .data(using: .utf8)
            .unwrap(throwing: LocativeError())
        
        self._customIcon = try rawToolRow
            .customIcon
            .map {
                try $0
                    .data(using: .utf8)
                    .unwrap(throwing: LocativeError())
            }
        
        self._sourceActionProviderID = rawToolRow.sourceActionProvider
        
        self._outputTypeInstance = try rawToolRow
            .outputTypeInstance
            .data(using: .utf8)
            .unwrap(throwing: LocativeError())
    }
}
