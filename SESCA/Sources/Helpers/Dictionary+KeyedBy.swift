//
//  Dictionary+KeyedBy.swift
//  SESCA
//
//  Created by Kenna Blackburn on 11/28/25.
//

import Foundation

extension Dictionary {
    init(
        _ elements: some Sequence<Value>,
        keyedBy keyPath: KeyPath<Value, Key>,
    ) {
        self = elements.reduce(into: [:]) { (result, value) in
            let key = value[keyPath: keyPath]
            result[key] = value
        }
    }
    
    init<ValueElement>(
        _ elements: some Sequence<ValueElement>,
        groupedBy keyPath: KeyPath<ValueElement, Key>,
    ) where Value == [ValueElement] {
        self = elements.reduce(into: [:]) { (result, value) in
            let key = value[keyPath: keyPath]
            result[key, default: []].append(value)
        }
    }
}
