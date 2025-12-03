//
//  RawSQLite.swift
//  SESCA
//
//  Created by Kenna Blackburn on 11/29/25.
//

import Foundation

struct RawSQLite {
    static let tableTypes: [any RawSQLiteTable.Type] = [
        RawSQLite.Tables.AdditionalToolAttributionContainers.self,
        RawSQLite.Tables.Categories.self,
        RawSQLite.Tables.ContainerMetadata.self,
        RawSQLite.Tables.ContainerMetadataLocalizations.self,
        RawSQLite.Tables.ContainerMetadataSynonyms.self,
        RawSQLite.Tables.EntityProperties.self,
        RawSQLite.Tables.EntityPropertyLocalizations.self,
        RawSQLite.Tables.EnumerationCases.self,
        RawSQLite.Tables.LaunchServiceState.self,
        RawSQLite.Tables.LinkActionIdentifiers.self,
        RawSQLite.Tables.LinkState.self,
        RawSQLite.Tables.Metadata.self,
        RawSQLite.Tables.ParameterLocalizations.self,
        RawSQLite.Tables.Parameters.self,
        RawSQLite.Tables.PredicateTemplates.self,
        RawSQLite.Tables.SearchKeywords.self,
        RawSQLite.Tables.SystemToolProtocols.self,
        RawSQLite.Tables.SystemTypeProtocols.self,
        RawSQLite.Tables.ToolLocalizations.self,
        RawSQLite.Tables.ToolOutputTypes.self,
        RawSQLite.Tables.ToolParameterTypes.self,
        RawSQLite.Tables.Tools.self,
        RawSQLite.Tables.TriggerLocalizations.self,
        RawSQLite.Tables.TriggerOutputTypes.self,
        RawSQLite.Tables.TriggerParameterLocalizations.self,
        RawSQLite.Tables.TriggerParameters.self,
        RawSQLite.Tables.Triggers.self,
        RawSQLite.Tables.TypeCoercions.self,
        RawSQLite.Tables.TypeDisplayRepresentations.self,
        RawSQLite.Tables.Types.self,
        RawSQLite.Tables.UTTypeCoercions.self,
    ]
    
    let tables: [any RawSQLiteTable]
    
    enum Tables {}
}

extension RawSQLite {
    subscript<T: RawSQLiteTable>(
        _ tableType: T.Type
    ) -> T {
        guard let table = tables.first(where: { $0 is T }) as? T else {
            fatalError()
        }
        
        return table
    }
}
