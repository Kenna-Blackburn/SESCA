//
//  Action+Localization.swift
//  SESCA
//
//  Created by Kenna Blackburn on 11/27/25.
//

import Foundation

extension Master.Action {
    struct Localization: Codable, Hashable {
        let localeID: String
        
        let name: String
        
        let descriptionSummary: String?
        let descriptionRequirements: String?
        let descriptionNote: String?
        let descriptionAttribution: String?
        
        let outputName: String?
        let outputDescription: String?
        
        let category: String?
        let searchKeywords: [String]
    }
}

extension Master.Action.Localization {
    init(
        toolRow: RawSQLite.Tables.Tools.Row,
        sqlite: RawSQLite
    ) throws {
        let toolLocalizationRow = try sqlite[RawSQLite.Tables.ToolLocalizations.self]
            .rows
            .first(where: { $0.transientToolID == toolRow.transientToolID })
            .unwrap(throwing: LocativeError())
        
        self.localeID = toolLocalizationRow.locale
        
        self.name = toolLocalizationRow.name
        
        self.descriptionSummary = toolLocalizationRow.descriptionSummary
        
        self.descriptionRequirements = toolLocalizationRow.descriptionRequires
        
        self.descriptionNote = toolLocalizationRow.descriptionNote
        
        self.descriptionAttribution = toolLocalizationRow.descriptionAttribution
        
        self.outputName = toolLocalizationRow.outputResultName
        
        self.outputDescription = toolLocalizationRow.descriptionResult
        
        self.category = sqlite[RawSQLite.Tables.Categories.self]
            .rows
            .first {
                $0.transientToolID == toolRow.transientToolID &&
                $0.locale == toolLocalizationRow.locale
            }?
            .category
        
        self.searchKeywords = sqlite[RawSQLite.Tables.SearchKeywords.self]
            .rows
            .filter {
                $0.transientToolID == toolRow.transientToolID &&
                $0.locale == toolLocalizationRow.locale
            }
            .sorted(using: SortDescriptor(\.sortOrder))
            .map(\.keyword)
    }
}

