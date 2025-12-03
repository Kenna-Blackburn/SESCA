//
//  Container.swift
//  SESCA
//
//  Created by Kenna Blackburn on 11/27/25.
//

import Foundation

extension Master {
    struct Container: Codable, Hashable {
        typealias PersistentID = String
        
        let persistentID: PersistentID
        
        let bundleVersionString: String
        let teamID: String
        
        let localization: Master.Container.Localization
        
        let _origin: Int
        let _containerType: Int
    }
}

extension Master.Container {
    init(
        containerRow: RawSQLite.Tables.ContainerMetadata.Row,
        sqlite: RawSQLite,
    ) throws {
        self.persistentID = containerRow.persistentContainerID
        
        self.bundleVersionString = containerRow.bundleVersion
        
        self.teamID = containerRow.teamID
        
        self.localization = try Master.Container.Localization(
            containerRow: containerRow,
            sqlite: sqlite,
        )
        
        self._origin = containerRow.origin
        
        self._containerType = containerRow.containerType
    }
}
