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
        let teamID: String?
        
        let localization: Localization
        
        let _origin: Int
        let _containerType: Int
    }
}

extension Master.Container {
    init(
        rawContainerMetadataRow: RawRows.ContainerMetadataRow,
        tableBundle: RawRows.Bundle,
    ) throws {
        
    }
}
