//
//  RawRows.swift
//  SESCA
//
//  Created by Kenna Blackburn on 11/14/25.
//

import Foundation

enum RawRows {
    typealias Bundle = (
        rawAdditionalToolAttributionContainerRows: [RawRows.AdditionalToolAttributionContainerRow],
        rawCategoryRows: [RawRows.CategoryRow],
        rawContainerMetadataLocalizationRows: [RawRows.ContainerMetadataLocalizationRow],
        rawContainerMetadataRows: [RawRows.ContainerMetadataRow],
        rawContainerMetadataSynonymRows: [RawRows.ContainerMetadataSynonymRow],
        rawEntityPropertyLocalizationRows: [RawRows.EntityPropertyLocalizationRow],
        rawEntityPropertyRows: [RawRows.EntityPropertyRow],
        rawEnumerationCaseRows: [RawRows.EnumerationCaseRow],
        rawLaunchServiceStateRows: [RawRows.LaunchServiceStateRow],
        rawLinkActionIdentifierRows: [RawRows.LinkActionIdentifierRow],
        rawLinkStateRows: [RawRows.LinkStateRow],
        rawMetadataRows: [RawRows.MetadataRow],
        rawParameterLocalizationRows: [RawRows.ParameterLocalizationRow],
        rawParameterRows: [RawRows.ParameterRow],
        rawPredicateTemplateRows: [RawRows.PredicateTemplateRow],
        rawSearchKeywordRows: [RawRows.SearchKeywordRow],
        rawSystemToolProtocolRows: [RawRows.SystemToolProtocolRow],
        rawSystemTypeProtocolRows: [RawRows.SystemTypeProtocolRow],
        rawToolLocalizationRows: [RawRows.ToolLocalizationRow],
        rawToolOutputTypeRows: [RawRows.ToolOutputTypeRow],
        rawToolParameterTypeRows: [RawRows.ToolParameterTypeRow],
        rawToolRows: [RawRows.ToolRow],
        rawTriggerLocalizationRows: [RawRows.TriggerLocalizationRow],
        rawTriggerOutputTypeRows: [RawRows.TriggerOutputTypeRow],
        rawTriggerParameterLocalizationRows: [RawRows.TriggerParameterLocalizationRow],
        rawTriggerParameterRows: [RawRows.TriggerParameterRow],
        rawTriggerRows: [RawRows.TriggerRow],
        rawTypeCoercionRows: [RawRows.TypeCoercionRow],
        rawTypeDisplayRepresentationRows: [RawRows.TypeDisplayRepresentationRow],
        rawTypeRows: [RawRows.TypeRow],
        rawUTTypeCoercionRows: [RawRows.UTTypeCoercionRow]
    )

    struct AdditionalToolAttributionContainerRow: Codable {
        let toolID: Int
        let containerID: String

        enum CodingKeys: String, CodingKey {
            case toolID = "toolId"
            case containerID = "containerId"
        }
    }

    struct CategoryRow: Codable {
        let toolID: Int
        let locale: String
        let category: String

        enum CodingKeys: String, CodingKey {
            case toolID = "toolId"
            case locale = "locale"
            case category = "category"
        }
    }

    struct ContainerMetadataLocalizationRow: Codable {
        let containerID: Int
        let locale: String
        let name: String

        enum CodingKeys: String, CodingKey {
            case containerID = "containerId"
            case locale = "locale"
            case name = "name"
        }
    }

    struct ContainerMetadataRow: Codable {
        let rowID: Int
        let id: String
        let bundleVersion: String
        let teamID: String
        let deviceID: String
        let origin: Int
        let containerType: Int

        enum CodingKeys: String, CodingKey {
            case rowID = "rowId"
            case id = "id"
            case bundleVersion = "bundleVersion"
            case teamID = "teamId"
            case deviceID = "deviceId"
            case origin = "origin"
            case containerType = "containerType"
        }
    }

    struct ContainerMetadataSynonymRow: Codable {
        let containerID: Int
        let locale: String
        let synonym: String
        let order: Int

        enum CodingKeys: String, CodingKey {
            case containerID = "containerId"
            case locale = "locale"
            case synonym = "synonym"
            case order = "order"
        }
    }

    struct EntityPropertyLocalizationRow: Codable {
        let typeID: String
        let propertyID: String
        let locale: String
        let displayName: String

        enum CodingKeys: String, CodingKey {
            case typeID = "typeId"
            case propertyID = "propertyId"
            case locale = "locale"
            case displayName = "displayName"
        }
    }

    struct EntityPropertyRow: Codable {
        let id: String
        let typeID: String
        let typeInstance: String

        enum CodingKeys: String, CodingKey {
            case id = "id"
            case typeID = "typeId"
            case typeInstance = "typeInstance"
        }
    }

    struct EnumerationCaseRow: Codable {
        let typeID: String
        let locale: String
        let id: String
        let title: String?
        let subtitle: String?
        let synonyms: String?

        enum CodingKeys: String, CodingKey {
            case typeID = "typeId"
            case locale = "locale"
            case id = "id"
            case title = "title"
            case subtitle = "subtitle"
            case synonyms = "synonyms"
        }
    }

    struct LaunchServiceStateRow: Codable {
        let bundleID: String
        let persistentIdentifier: String

        enum CodingKeys: String, CodingKey {
            case bundleID = "bundleId"
            case persistentIdentifier = "persistentIdentifier"
        }
    }

    struct LinkActionIdentifierRow: Codable {
        let identifier: String
        let toolID: Int

        enum CodingKeys: String, CodingKey {
            case identifier = "identifier"
            case toolID = "toolId"
        }
    }

    struct LinkStateRow: Codable {
        let containerID: String
        let installIdentifier: String

        enum CodingKeys: String, CodingKey {
            case containerID = "containerId"
            case installIdentifier = "installIdentifier"
        }
    }

    struct MetadataRow: Codable {
        let key: String
        let value: String

        enum CodingKeys: String, CodingKey {
            case key = "key"
            case value = "value"
        }
    }

    struct ParameterLocalizationRow: Codable {
        let toolID: Int
        let key: String
        let locale: String
        let name: String
        let description: String?
        let trueString: String?
        let falseString: String?

        enum CodingKeys: String, CodingKey {
            case toolID = "toolId"
            case key = "key"
            case locale = "locale"
            case name = "name"
            case description = "description"
            case trueString = "trueString"
            case falseString = "falseString"
        }
    }

    struct ParameterRow: Codable {
        let typeInstance: String
        let key: String
        let sortOrder: Int
        let relationships: String
        let flags: Int
        let toolID: Int

        enum CodingKeys: String, CodingKey {
            case typeInstance = "typeInstance"
            case key = "key"
            case sortOrder = "sortOrder"
            case relationships = "relationships"
            case flags = "flags"
            case toolID = "toolId"
        }
    }

    struct PredicateTemplateRow: Codable {
        let typeID: String
        let comparison: String

        enum CodingKeys: String, CodingKey {
            case typeID = "typeId"
            case comparison = "comparison"
        }
    }

    struct SearchKeywordRow: Codable {
        let toolID: Int
        let locale: String
        let keyword: String
        let order: Int

        enum CodingKeys: String, CodingKey {
            case toolID = "toolId"
            case locale = "locale"
            case keyword = "keyword"
            case order = "order"
        }
    }

    struct SystemToolProtocolRow: Codable {
        let toolID: Int
        let identifier: String
        let nameProtocol: String

        enum CodingKeys: String, CodingKey {
            case toolID = "toolId"
            case identifier = "identifier"
            case nameProtocol = "protocol"
        }
    }

    struct SystemTypeProtocolRow: Codable {
        let typeID: String
        let identifier: String
        let `protocol`: String

        enum CodingKeys: String, CodingKey {
            case typeID = "typeId"
            case identifier = "identifier"
            case `protocol` = "protocol"
        }
    }

    struct ToolLocalizationRow: Codable {
        let toolID: Int
        let locale: String
        let name: String
        let outputResultName: String?
        let descriptionSummary: String?
        let descriptionAttribution: String?
        let descriptionResult: String?
        let descriptionNote: String?
        let descriptionRequires: String?
        let deprecationMessage: String?
        let localizationUsage: String

        enum CodingKeys: String, CodingKey {
            case toolID = "toolId"
            case locale = "locale"
            case name = "name"
            case outputResultName = "outputResultName"
            case descriptionSummary = "descriptionSummary"
            case descriptionAttribution = "descriptionAttribution"
            case descriptionResult = "descriptionResult"
            case descriptionNote = "descriptionNote"
            case descriptionRequires = "descriptionRequires"
            case deprecationMessage = "deprecationMessage"
            case localizationUsage = "localizationUsage"
        }
    }

    struct ToolOutputTypeRow: Codable {
        let toolID: Int
        let typeIdentifier: String

        enum CodingKeys: String, CodingKey {
            case toolID = "toolId"
            case typeIdentifier = "typeIdentifier"
        }
    }

    struct ToolParameterTypeRow: Codable {
        let toolID: Int
        let key: String
        let typeID: String

        enum CodingKeys: String, CodingKey {
            case toolID = "toolId"
            case key = "key"
            case typeID = "typeId"
        }
    }

    struct ToolRow: Codable {
        let rowID: Int
        let id: String
        let toolType: String
        let flags: Int
        let visibilityFlags: Int
        let requirements: String
        let authenticationPolicy: String
        let customIcon: String?
        let deprecationReplacementID: String?
        let sourceActionProvider: String
        let outputTypeInstance: String
        let sourceContainerID: Int
        let attributionContainerID: Int?

        enum CodingKeys: String, CodingKey {
            case rowID = "rowId"
            case id = "id"
            case toolType = "toolType"
            case flags = "flags"
            case visibilityFlags = "visibilityFlags"
            case requirements = "requirements"
            case authenticationPolicy = "authenticationPolicy"
            case customIcon = "customIcon"
            case deprecationReplacementID = "deprecationReplacementId"
            case sourceActionProvider = "sourceActionProvider"
            case outputTypeInstance = "outputTypeInstance"
            case sourceContainerID = "sourceContainerId"
            case attributionContainerID = "attributionContainerId"
        }
    }

    struct TriggerLocalizationRow: Codable {
        let triggerID: Int
        let locale: String
        let name: String
        let outputResultName: String?
        let descriptionSummary: String

        enum CodingKeys: String, CodingKey {
            case triggerID = "triggerId"
            case locale = "locale"
            case name = "name"
            case outputResultName = "outputResultName"
            case descriptionSummary = "descriptionSummary"
        }
    }

    struct TriggerOutputTypeRow: Codable {
        let triggerID: Int
        let typeIdentifier: String

        enum CodingKeys: String, CodingKey {
            case triggerID = "triggerId"
            case typeIdentifier = "typeIdentifier"
        }
    }

    struct TriggerParameterLocalizationRow: Codable {
        let triggerID: Int
        let key: String
        let locale: String
        let name: String
        let description: String?

        enum CodingKeys: String, CodingKey {
            case triggerID = "triggerId"
            case key = "key"
            case locale = "locale"
            case name = "name"
            case description = "description"
        }
    }

    struct TriggerParameterRow: Codable {
        let typeInstance: String
        let key: String
        let sortOrder: Int
        let relationships: String
        let flags: Int
        let typeID: String
        let triggerID: Int

        enum CodingKeys: String, CodingKey {
            case typeInstance = "typeInstance"
            case key = "key"
            case sortOrder = "sortOrder"
            case relationships = "relationships"
            case flags = "flags"
            case typeID = "typeId"
            case triggerID = "triggerId"
        }
    }

    struct TriggerRow: Codable {
        let rowID: Int
        let id: String
        let flags: Int
        let requirements: String
        let outputTypeInstance: String

        enum CodingKeys: String, CodingKey {
            case rowID = "rowId"
            case id = "id"
            case flags = "flags"
            case requirements = "requirements"
            case outputTypeInstance = "outputTypeInstance"
        }
    }

    struct TypeCoercionRow: Codable {
        let typeID: String
        let coercionDefinition: String

        enum CodingKeys: String, CodingKey {
            case typeID = "typeId"
            case coercionDefinition = "coercionDefinition"
        }
    }

    struct TypeDisplayRepresentationRow: Codable {
        let typeID: String
        let locale: String
        let name: String
        let numericFormat: String?
        let synonyms: String

        enum CodingKeys: String, CodingKey {
            case typeID = "typeId"
            case locale = "locale"
            case name = "name"
            case numericFormat = "numericFormat"
            case synonyms = "synonyms"
        }
    }

    struct TypeRow: Codable {
        let rowID: String
        let id: String
        let sourceContainerID: Int
        let kind: Int
        let runtimeFlags: Int?
        let runtimeRequirements: String?

        enum CodingKeys: String, CodingKey {
            case rowID = "rowId"
            case id = "id"
            case sourceContainerID = "sourceContainerId"
            case kind = "kind"
            case runtimeFlags = "runtimeFlags"
            case runtimeRequirements = "runtimeRequirements"
        }
    }

    struct UTTypeCoercionRow: Codable {
        let typeID: String
        let coercionIdentifier: String

        enum CodingKeys: String, CodingKey {
            case typeID = "typeId"
            case coercionIdentifier = "coercionIdentifier"
        }
    }
}
