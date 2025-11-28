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
            .desktopDirectory
            .appending(path: "SESCA/Master_3_3.json")
    }
    
    static func main() throws {
        let rawJSONDirectory = try parseSQLiteIntoRawJSONDirectory(sqliteURL: Configuration.toolsSQLiteURL)
        let tableBundle = try parseRawJSONDirectoryIntoMemory(rawJSONDirectory: rawJSONDirectory)
        
        let master: Master = try Master(
            actions: Set(
                tableBundle
                    .rawToolRows
                    .map { rawToolRow in
                        
                    }
            ),
            types: Set(
                tableBundle
                    .rawTypeRows
                    .map { rawTypeRow in
                        Master.ValueType(
                            persistentID: rawTypeRow.rowID,
                            kindSpecificMetadata: try {
                                return .entity(Master.ValueType.KindSpecificMetadata.Entity(properties: Set()))
                            }(),
                            sourceContainerID: try {
                                try tableBundle
                                    .rawContainerMetadataRows
                                    .first(where: { $0.rowID == rawTypeRow.sourceContainerID })
                                    .unwrap(throwing: LocativeError())
                                    .id
                            }(),
                            coercions: Set(
                                tableBundle
                                    .rawUTTypeCoercionRows
                                    .filter({ $0.typeID == rawTypeRow.rowID })
                                    .map({ UTType(importedAs: $0.coercionIdentifier) })
                            ),
                            localization: {
                                let rawTypeDisplayRepresentationRow = try tableBundle
                                    .rawTypeDisplayRepresentationRows
                                    .first(where: { $0.typeID == rawTypeRow.rowID })
                                    .unwrap(throwing: LocativeError())
                                
                                return Master.ValueType.Locatization(
                                    localeID: rawTypeDisplayRepresentationRow.locale,
                                    name: rawTypeDisplayRepresentationRow.name
                                )
                            }(),
                            _blobID: rawTypeRow.id,
                            _kind: rawTypeRow.kind,
                            _runtimeFlags: rawTypeRow.runtimeFlags,
                            _runtimeRequirements: try rawTypeRow.runtimeRequirements.map {
                                try $0
                                    .data(using: .utf8)
                                    .unwrap(throwing: LocativeError())
                            }()
                        )
                    }
            ),
            containers: Set(
                tableBundle
                    .rawContainerMetadataRows
                    .map { rawContainerMetadataRow in
                        Master.Container(
                            persistentID: rawContainerMetadataRow.id,
                            bundleVersionString: rawContainerMetadataRow.bundleVersion,
                            teamID: {
                                let teamID = rawContainerMetadataRow.teamID
                                return teamID.isEmpty ? nil : teamID
                            }(),
                            localization: try {
                                let rawContainerMetadataLocalizationRow = try tableBundle
                                    .rawContainerMetadataLocalizationRows
                                    .first(where: { $0.containerID == rawContainerMetadataRow.rowID })
                                    .unwrap(throwing: LocativeError())
                                
                                return Master.Container.Localization(
                                    localeID: rawContainerMetadataLocalizationRow.locale,
                                    name: rawContainerMetadataLocalizationRow.name,
                                )
                            }(),
                            _origin: rawContainerMetadataRow.origin,
                            _containerType: rawContainerMetadataRow.containerType,
                        )
                    }
            ),
        )
        
        try saveMasterAsJSON(master: master, to: Configuration.outputURL)
        
        if Configuration.eraseTemporaryDirectoryWhenDone {
            try FileManager.default.removeItem(at: Configuration.temporaryDirectory)
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
        
        let rawJSONDirectory = Configuration.temporaryDirectory
            .appending(path: "RawJSON")
        
        try FileManager.default.createDirectory(at: rawJSONDirectory, withIntermediateDirectories: true)
        
        let tables = try {
            guard let string = try runCommand(
                "sqlite3 '\(sqliteURL.path())' \"SELECT name FROM sqlite_master WHERE type='table';\""
            ) else {
                throw LocativeError()
            }
            
            let tables = string
                .components(separatedBy: "\n")
                .filter({ !$0.isEmpty })
            
            return tables
        }()
        
        for table in tables {
            let jsonURL = rawJSONDirectory
                .appending(path: table + ".json")
            
            try runCommand("sqlite3 '\(sqliteURL.path())' -json \"SELECT * FROM \(table);\" > '\(jsonURL.path())'")
        }
        
        return rawJSONDirectory
    }
    
    static func parseRawJSONDirectoryIntoMemory(
        rawJSONDirectory: URL
    ) throws -> RawRows.Bundle {
        func decode<T: Decodable>(
            _ type: T.Type,
            from filename: String,
        ) -> [T] {
            let url = rawJSONDirectory.appending(path: filename + ".json")
            
            do {
                let data = try Data(contentsOf: url)
                return try JSONDecoder().decode([T].self, from: data)
            } catch {
                print("Failed to parse json at '/\(filename).json'. Substituting with '[]'.")
                return []
            }
        }
        
        return (
            decode(RawRows.AdditionalToolAttributionContainerRow.self, from: "AdditionalToolAttributionContainers"),
            decode(RawRows.CategoryRow.self, from: "Categories"),
            decode(RawRows.ContainerMetadataLocalizationRow.self, from: "ContainerMetadataLocalizations"),
            decode(RawRows.ContainerMetadataRow.self, from: "ContainerMetadata"),
            decode(RawRows.ContainerMetadataSynonymRow.self, from: "ContainerMetadataSynonyms"),
            decode(RawRows.EntityPropertyLocalizationRow.self, from: "EntityPropertyLocalizations"),
            decode(RawRows.EntityPropertyRow.self, from: "EntityProperties"),
            decode(RawRows.EnumerationCaseRow.self, from: "EnumerationCases"),
            decode(RawRows.LaunchServiceStateRow.self, from: "LaunchServicesState"),
            decode(RawRows.LinkActionIdentifierRow.self, from: "LinkActionIdentifiers"),
            decode(RawRows.LinkStateRow.self, from: "LinkState"),
            decode(RawRows.MetadataRow.self, from: "Metadata"),
            decode(RawRows.ParameterLocalizationRow.self, from: "ParameterLocalizations"),
            decode(RawRows.ParameterRow.self, from: "Parameters"),
            decode(RawRows.PredicateTemplateRow.self, from: "PredicateTemplates"),
            decode(RawRows.SearchKeywordRow.self, from: "SearchKeywords"),
            decode(RawRows.SystemToolProtocolRow.self, from: "SystemToolProtocols"),
            decode(RawRows.SystemTypeProtocolRow.self, from: "SystemTypeProtocols"),
            decode(RawRows.ToolLocalizationRow.self, from: "ToolLocalizations"),
            decode(RawRows.ToolOutputTypeRow.self, from: "ToolOutputTypes"),
            decode(RawRows.ToolParameterTypeRow.self, from: "ToolParameterTypes"),
            decode(RawRows.ToolRow.self, from: "Tools"),
            decode(RawRows.TriggerLocalizationRow.self, from: "TriggerLocalizations"),
            decode(RawRows.TriggerOutputTypeRow.self, from: "TriggerOutputTypes"),
            decode(RawRows.TriggerParameterLocalizationRow.self, from: "TriggerParameterLocalizations"),
            decode(RawRows.TriggerParameterRow.self, from: "TriggerParameters"),
            decode(RawRows.TriggerRow.self, from: "Triggers"),
            decode(RawRows.TypeCoercionRow.self, from: "TypeCoercions"),
            decode(RawRows.TypeDisplayRepresentationRow.self, from: "TypeDisplayRepresentations"),
            decode(RawRows.TypeRow.self, from: "Types"),
            decode(RawRows.UTTypeCoercionRow.self, from: "UTTypeCoercions"),
        )
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
