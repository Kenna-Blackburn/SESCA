//
//  LocativeError.swift
//  SESCA
//
//  Created by Kenna Blackburn on 11/14/25.
//


struct LocativeError: Error {
    let file: String
    let line: Int
    let columm: Int
    
    init(
        file: String = #file,
        line: Int = #line,
        columm: Int = #column
    ) {
        self.file = file
        self.line = line
        self.columm = columm
    }
}