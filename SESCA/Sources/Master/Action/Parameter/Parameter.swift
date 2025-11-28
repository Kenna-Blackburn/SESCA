//
//  Parameter.swift
//  SESCA
//
//  Created by Kenna Blackburn on 11/27/25.
//

import Foundation

extension Master.Action {
    struct Parameter: Codable, Hashable {
        let key: String
        
        let inputTypeID: Master.ValueType.PersistentID
        
        let localization: Localization
        
        let _inputTypeInstance: Master.ValueType._Instance
        let _relationships: Data
        let _flags: Int
    }
}

extension Master.Action.Parameter {
    init(
        rawParameterRow: RawRows.ParameterRow,
        tableBundle: RawRows.Bundle,
    ) throws {
        try {
            try tableBundle
                .rawParameterRows
                .filter({ $0.toolID == rawToolRow.rowID })
                .sorted(using: SortDescriptor(\.sortOrder))
                .map { rawParameterRow in
                    Master.Action.Parameter(
                        key: rawParameterRow.key,
                        inputTypeID: try {
                            try tableBundle
                                .rawToolParameterTypeRows
                                .first {
                                    $0.key == rawParameterRow.key &&
                                    $0.toolID == rawToolRow.rowID
                                }
                                .unwrap(throwing: LocativeError())
                                .typeID
                        }(),
                        localization: try {
                            let rawParameterLocalizationRow = try tableBundle
                                .rawParameterLocalizationRows
                                .first {
                                    $0.key == rawParameterRow.key &&
                                    $0.toolID == rawToolRow.rowID
                                }
                                .unwrap(throwing: LocativeError())
                            
                            return Master.Action.Parameter.Localization(
                                localeID: rawParameterLocalizationRow.locale,
                                name: rawParameterLocalizationRow.name,
                                descriptionSummary: rawParameterLocalizationRow.description,
                                booleanDisplay: {
                                    if rawParameterLocalizationRow.trueString == nil,
                                       rawParameterLocalizationRow.falseString == nil
                                    {
                                        return nil
                                    } else {
                                        return Master.Action.Parameter.Localization.BooleanDisplay(
                                            true: rawParameterLocalizationRow.trueString,
                                            false: rawParameterLocalizationRow.falseString
                                        )
                                    }
                                }(),
                            )
                        }(),
                        _inputTypeInstance: try {
                            try rawParameterRow
                                .typeInstance
                                .data(using: .utf8)
                                .unwrap(throwing: LocativeError())
                        }(),
                        _relationships: try {
                            try rawParameterRow
                                .relationships
                                .data(using: .utf8)
                                .unwrap(throwing: LocativeError())
                        }(),
                        _flags: rawParameterRow.flags
                    )
                }
        }()
    }
}
