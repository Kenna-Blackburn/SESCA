//
//  Master.swift
//  SESCA
//
//  Created by Kenna Blackburn on 11/27/25.
//

import Foundation

struct Master: Codable, Hashable {
    let actions: Set<Action>
    
    let valueTypes: Set<ValueType>
    
    let containers: Set<Container>
}

extension Master {
    init(tableBundle: RawRows.Bundle) throws {
        func helper<Row, MasterType>(
            _ keyPath: KeyPath<RawRows.Bundle, [Row]>,
            _ initializer: (Row, RawRows.Bundle) throws -> MasterType
        ) throws -> Set<MasterType> {
            Set(try tableBundle[keyPath: keyPath].map({ try initializer($0, tableBundle) }))
        }
        
        self.actions = try helper(\.rawToolRows, Master.Action.init)
        self.valueTypes = try helper(\.rawTypeRows, Master.ValueType.init)
        self.containers = try helper(\.rawContainerMetadataRows, Master.Container.init)
    }
}
