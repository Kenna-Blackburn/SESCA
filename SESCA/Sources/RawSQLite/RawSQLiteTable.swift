//
//  RawSQLiteTable.swift
//  SESCA
//
//  Created by Kenna Blackburn on 11/29/25.
//

import Foundation

protocol RawSQLiteTable: Codable, Hashable {
    associatedtype Row: RawSQLiteTableRow
    
    static var name: String { get }
    
    var rows: Set<Row> { get }
    
    init(rows: Set<Row>)
}

protocol RawSQLiteTableRow: Codable, Hashable {
    
}
