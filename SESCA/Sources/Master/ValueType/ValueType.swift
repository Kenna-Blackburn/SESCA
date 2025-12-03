//
//  ValueType.swift
//  SESCA
//
//  Created by Kenna Blackburn on 11/27/25.
//

import Foundation
import UniformTypeIdentifiers

extension Master {
    struct ValueType: Codable, Hashable {
        typealias PersistentID = String
        
        let persistentID: PersistentID
        
        let kindSpecificMetadata: KindSpecificMetadata?
        
        let sourceContainerID: Container.PersistentID
        let coercions: [UTType]
        
        let localization: Master.ValueType.Locatization?
        
        let _blobID: Data
        let _kind: Int
        let _runtimeFlags: Int?
        let _runtimeRequirements: Data?
        
        typealias _Instance = Data
    }
}

extension Master.ValueType {
    init(
        typeRow: RawSQLite.Tables.Types.Row,
        sqlite: RawSQLite,
    ) throws {
        self.persistentID = typeRow.persistentTypeID
        
        self.kindSpecificMetadata = try Master.ValueType.KindSpecificMetadata(
            typeRow: typeRow,
            sqlite: sqlite
        )
        
        self.sourceContainerID = try sqlite[RawSQLite.Tables.ContainerMetadata.self]
            .rows
            .first(where: { $0.transientContainerID == typeRow.transientSourceContainerID })
            .unwrap(throwing: LocativeError())
            .persistentContainerID
        
        self.coercions = sqlite[RawSQLite.Tables.UTTypeCoercions.self]
            .rows
            .filter({ $0.persistentTypeID == typeRow.persistentTypeID })
            .map {
                if let type = UTType($0.coercionUTI) {
                    return type
                } else {
                    print("Got unknown UTI '\($0.coercionUTI)'. Falling back to 'UTType.init(importedAs:)'.")
                    return UTType(importedAs: $0.coercionUTI)
                }
            }
        
        self.localization = try Master.ValueType.Locatization(
            typeRow: typeRow,
            sqlite: sqlite,
        )
        
        self._blobID = try typeRow
            .persistentTypeIDBlob
            .data(using: .utf8)
            .unwrap(throwing: LocativeError())
        
        self._kind = typeRow.kind
        
        self._runtimeFlags = typeRow.runtimeFlags
        
        if let runtimeRequirementsBlob = typeRow.runtimeRequirementsBlob {
            self._runtimeRequirements = try runtimeRequirementsBlob
                .data(using: .utf8)
                .unwrap(throwing: LocativeError())
        } else {
            self._runtimeRequirements = nil
        }
    }
}
