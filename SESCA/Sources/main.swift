//
//  main.swift
//  SESCA
//
//  Created by Kenna Blackburn on 11/13/25.
//

import Foundation
import UniformTypeIdentifiers

enum Main {
    enum Configuration {
        static let temporaryDirectory: URL = URL
            .desktopDirectory
            .appending(path: UUID().uuidString)
        
        static let eraseTemporaryDirectoryWhenDone: Bool = true
        
        // `~/Library/` is protected so you must use a copy of the link of `~/Library/Shortcuts/ToolKit/Tools-active`
        static let toolsSQLiteURL: URL = URL
            .desktopDirectory
            .appending(path: "SESCA/Tools-prod_1.sqlite")
        
        static let outputURL: URL = URL
            .libraryDirectory
            .appending(path: "Mobile Documents/com~apple~CloudDocs/Projects/SESCA/SESCA/Master.json")
    }
    
    static func main() throws {
        let rawJSONDirectory = try parseSQLiteIntoRawJSONDirectory(sqliteURL: Configuration.toolsSQLiteURL)
        
        let sqlite = try parseRawJSONDirectoryIntoRawSQLite(rawJSONDirectory: rawJSONDirectory)
        
        let master = try Master(sqlite: sqlite)
        
        try saveMasterAsJSON(master: master, to: Configuration.outputURL)
        
        if Configuration.eraseTemporaryDirectoryWhenDone {
            try FileManager
                .default
                .removeItem(at: Configuration.temporaryDirectory)
        }
    }
    
    static func parseSQLiteIntoRawJSONDirectory(
        sqliteURL: URL
    ) throws -> URL {
        @discardableResult
        func runCommand(_ command: String) throws -> String? {
            let process = Process()
            process.executableURL = URL(filePath: "/bin/zsh")
            process.arguments = ["-c", command]
            
            let pipe = Pipe()
            process.standardOutput = pipe
            process.standardError = pipe
            
            try process.run()
            
            process.waitUntilExit()
            
            guard let data = try pipe.fileHandleForReading.readToEnd(),
                  let string = String(data: data, encoding: .utf8)
            else {
                return nil
            }
            
            return string
        }
        
        let rawJSONDirectory = Configuration
            .temporaryDirectory
            .appending(path: "RawJSON")
        
        try FileManager
            .default
            .createDirectory(at: rawJSONDirectory, withIntermediateDirectories: true)
        
        // for some reason '.map(\.name)' throws 'Command SwiftCompile failed with a nonzero exit code' at compile time
        let tableNames = RawSQLite.tableTypes.map({ $0.name })
        
        for tableName in tableNames {
            let jsonURL = rawJSONDirectory
                .appending(path: tableName + ".json")
            
            try runCommand("sqlite3 '\(sqliteURL.path())' -json \"SELECT * FROM \(tableName);\" > '\(jsonURL.path())'")
        }
        
        return rawJSONDirectory
    }
    
    static func parseRawJSONDirectoryIntoRawSQLite(
        rawJSONDirectory: URL
    ) throws -> RawSQLite {
        func decode<Table: RawSQLiteTable>(
            type: Table.Type
        ) throws -> Table {
            let url = rawJSONDirectory.appending(path: Table.name + ".json")
            
            do {
                let data = try Data(contentsOf: url)
                let rows = try JSONDecoder().decode(Set<Table.Row>.self, from: data)
                let table = Table(rows: rows)
                
                return table
            } catch {
                print("Failed to parse json at '\(url)'. Substituting with empty table.")
                return Table(rows: [])
            }
        }
        
        let tables = try RawSQLite
            .tableTypes
            .map({ try decode(type: $0) })
        
        return RawSQLite(tables: tables)
    }
    
    static func saveMasterAsJSON(
        master: Master,
        to fileURL: URL
    ) throws {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        
        let data = try encoder.encode(master)
        
        try data.write(to: fileURL, options: .atomic)
    }
}

try! Main.main()
