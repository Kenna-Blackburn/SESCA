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
        rawToolRow: RawRows.ToolRow,
        tableBundle: RawRows.Bundle
    ) throws {
        let rawToolLocalizationRow = try tableBundle
            .rawToolLocalizationRows
            .first(where: { $0.toolID == rawToolRow.rowID })
            .unwrap(throwing: LocativeError())
        
        return Master.Action.Localization(
            localeID: rawToolLocalizationRow.locale,
            name: rawToolLocalizationRow.name,
            descriptionSummary: rawToolLocalizationRow.descriptionSummary,
            descriptionRequirements: rawToolLocalizationRow.descriptionRequires,
            descriptionNote: rawToolLocalizationRow.descriptionNote,
            descriptionAttribution: rawToolLocalizationRow.descriptionAttribution,
            outputName: rawToolLocalizationRow.outputResultName,
            outputDescription: rawToolLocalizationRow.descriptionResult,
            category: {
                tableBundle
                    .rawCategoryRows
                    .first {
                        $0.toolID == rawToolRow.rowID &&
                        $0.locale == rawToolLocalizationRow.locale
                    }?
                    .category
            }(),
            searchKeywords: {
                tableBundle
                    .rawSearchKeywordRows
                    .filter({ $0.locale == rawToolLocalizationRow.locale })
                    .filter({ $0.toolID == rawToolRow.rowID })
                    .sorted(using: SortDescriptor(\.order))
                    .map(\.keyword)
            }()
        )
    }
}
