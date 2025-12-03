//
//  Master.swift
//  SESCA
//
//  Created by Kenna Blackburn on 11/27/25.
//

import Foundation

struct Master: Codable, Hashable {
    let actions: [Action]
    
    let valueTypes: [ValueType]
    
    let containers: [Container]
}

extension Master {
    init(sqlite: RawSQLite) throws {
        self.actions = try sqlite[RawSQLite.Tables.Tools.self]
            .rows
            .map({ try Master.Action(toolRow: $0, sqlite: sqlite) })
            .sorted(using: SortDescriptor(\.persistentID))
        
        self.valueTypes = try sqlite[RawSQLite.Tables.Types.self]
            .rows
            .map({ try Master.ValueType(typeRow: $0, sqlite: sqlite) })
            .sorted(using: SortDescriptor(\.persistentID))
        
        self.containers = try sqlite[RawSQLite.Tables.ContainerMetadata.self]
            .rows
            .map({ try Master.Container(containerRow: $0, sqlite: sqlite) })
            .sorted(using: SortDescriptor(\.persistentID))
    }
}
