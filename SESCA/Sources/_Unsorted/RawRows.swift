//
//  RawRows.swift
//  SESCA
//
//  Created by Kenna Blackburn on 11/27/25.
//

import Foundation

// TODO: break into files
// TODO: make bundle struct
// TODO: add O(1) indexing
// TODO: rename things

struct RawSQLite {
    let additionalToolAttributionContainerRows: [RawSQLite.AdditionalToolAttributionContainerRow]
    let categoryRows: [RawSQLite.CategoryRow]
    let containerMetadataLocalizationRows: [RawSQLite.ContainerMetadataLocalizationRow]
    let containerMetadataRows: [RawSQLite.ContainerMetadataRow]
    let containerMetadataSynonymRows: [RawSQLite.ContainerMetadataSynonymRow]
    let entityPropertyLocalizationRows: [RawSQLite.EntityPropertyLocalizationRow]
    let entityPropertyRows: [RawSQLite.EntityPropertyRow]
    let enumerationCaseRows: [RawSQLite.EnumerationCaseRow]
    let launchServiceStateRows: [RawSQLite.LaunchServiceStateRow]
    let linkActionIdentifierRows: [RawSQLite.LinkActionIdentifierRow]
    let linkStateRows: [RawSQLite.LinkStateRow]
    let metadataRows: [RawSQLite.MetadataRow]
    let parameterLocalizationRows: [RawSQLite.ParameterLocalizationRow]
    let parameterRows: [RawSQLite.ParameterRow]
    let predicateTemplateRows: [RawSQLite.PredicateTemplateRow]
    let searchKeywordRows: [RawSQLite.SearchKeywordRow]
    let systemToolProtocolRows: [RawSQLite.SystemToolProtocolRow]
    let systemTypeProtocolRows: [RawSQLite.SystemTypeProtocolRow]
    let toolLocalizationRows: [RawSQLite.ToolLocalizationRow]
    let toolOutputTypeRows: [RawSQLite.ToolOutputTypeRow]
    let toolParameterTypeRows: [RawSQLite.ToolParameterTypeRow]
    let toolRows: [RawSQLite.ToolRow]
    let triggerLocalizationRows: [RawSQLite.TriggerLocalizationRow]
    let triggerOutputTypeRows: [RawSQLite.TriggerOutputTypeRow]
    let triggerParameterLocalizationRows: [RawSQLite.TriggerParameterLocalizationRow]
    let triggerParameterRows: [RawSQLite.TriggerParameterRow]
    let triggerRows: [RawSQLite.TriggerRow]
    let typeCoercionRows: [RawSQLite.TypeCoercionRow]
    let typeDisplayRepresentationRows: [RawSQLite.TypeDisplayRepresentationRow]
    let typeRows: [RawSQLite.TypeRow]
    let utTypeCoercionRows: [RawSQLite.UTTypeCoercionRow]
    
    lazy var additionalToolAttributionContainerRowsKeyedByTransientContainerID = Dictionary(additionalToolAttributionContainerRows, keyedBy: \.transientContainerID)
    lazy var categoryRowsKeyedByTransientToolID = Dictionary(categoryRows, keyedBy: \.transientToolID)
    lazy var containerMetadataLocalizationRowsKeyedByTransientContainerID = Dictionary(containerMetadataLocalizationRows, keyedBy: \.transientContainerID)
    lazy var containerMetadataRowsKeyedByTransientContainerID = Dictionary(containerMetadataRows, keyedBy: \.transientContainerID)
    lazy var containerMetadataSynonymRowsKeyedByTransientContainerID = Dictionary(containerMetadataSynonymRows, keyedBy: \.transientContainerID)
//    lazy var entityPropertyLocalizationRowsKeyedBy<#Key#> = Dictionary(entityPropertyLocalizationRows, keyedBy: <#T##KeyPath<Value, Hashable>#>) // double key
    lazy var entityPropertyRowsKeyedByPersistentEntityID = Dictionary(entityPropertyRows, groupedBy: \.persistentEntityID) // plural value
    lazy var enumerationCaseRowsKeyedByPersistentEnumerationID = Dictionary(enumerationCaseRows, groupedBy: \.persistentEnumerationID) // plural value
    lazy var linkActionIdentifierRowsKeyedByTransientToolID = Dictionary(linkActionIdentifierRows, keyedBy: \.transientToolID)
    lazy var linkStateRowsKeyedByPersistentContainerID = Dictionary(linkStateRows, keyedBy: \.persistentContainerID)
    lazy var metadataRowsKeyedByMetadataKey = Dictionary(metadataRows, keyedBy: \.key)
//    lazy var parameterLocalizationRowsKeyedBy<#Key#> = Dictionary(parameterLocalizationRows, keyedBy: <#T##KeyPath<Value, Hashable>#>) // double key
    lazy var parameterRowsKeyedByTransientToolID = Dictionary(parameterRows, groupedBy: \.transientToolID) // plural value
    lazy var predicateTemplateRowsKeyedByPersistentTypeID = Dictionary(predicateTemplateRows, keyedBy: \.persistentTypeID)
    lazy var searchKeywordRowsKeyedByTransientToolID = Dictionary(searchKeywordRows, groupedBy: \.transientToolID) // plural value
    lazy var systemToolProtocolRowsKeyedByTransientToolID = Dictionary(systemToolProtocolRows, groupedBy: \.transientToolID) // plural value
    lazy var systemTypeProtocolRowsKeyedByPersistentTypeID = Dictionary(systemTypeProtocolRows, groupedBy: \.persistentTypeID) // plural value
    lazy var toolLocalizationRowsKeyedByTransientToolID = Dictionary(toolLocalizationRows, keyedBy: \.transientToolID)
    lazy var toolOutputTypeRowsKeyedByTransientToolID = Dictionary(toolOutputTypeRows, keyedBy: \.transientToolID)
//    lazy var toolParameterTypeRowsKeyedBy<#Key#> = Dictionary(toolParameterTypeRows, keyedBy: <#T##KeyPath<Value, Hashable>#>) // double key
    lazy var toolRowsKeyedByTransientToolID = Dictionary(toolRows, keyedBy: \.transientToolID)
    lazy var triggerLocalizationRowsKeyedByTransientTriggerID = Dictionary(triggerLocalizationRows, keyedBy: \.transientTriggerID)
    lazy var triggerOutputTypeRowsKeyedByTransientTriggerID = Dictionary(triggerOutputTypeRows, keyedBy: \.transientTriggerID)
//    lazy var triggerParameterLocalizationRowsKeyedBy<#Key#> = Dictionary(triggerParameterLocalizationRows, keyedBy: <#T##KeyPath<Value, Hashable>#>) // double key
//    lazy var triggerParameterRowsKeyedBy<#Key#> = Dictionary(triggerParameterRows, keyedBy: <#T##KeyPath<Value, Hashable>#>) // double key
    lazy var triggerRowsKeyedByTransientTriggerID = Dictionary(triggerRows, keyedBy: \.transientTriggerID)
    lazy var typeCoercionRowsKeyedByPersistentTypeID = Dictionary(typeCoercionRows, keyedBy: \.persistentTypeID)
    lazy var typeDisplayRepresentationRowsKeyedByPersistentTypeID = Dictionary(typeDisplayRepresentationRows, keyedBy: \.persistentTypeID)
    lazy var typeRowsKeyedByPersistentTypeID = Dictionary(typeRows, keyedBy: \.persistentTypeID)
    lazy var typeRowsKeyedByPersistentTypeIDBlob = Dictionary(typeRows, keyedBy: \.persistentTypeIDBlob)
    lazy var utTypeCoercionRowsKeyedByPersistentTypeID = Dictionary(utTypeCoercionRows, keyedBy: \.persistentTypeID)
}

extension RawSQLite {
    struct AdditionalToolAttributionContainerRow: Codable {
        let transientToolID: Int
        let transientContainerID: String

        enum CodingKeys: String, CodingKey {
            case transientToolID = "toolId"
            case transientContainerID = "containerId"
        }
    }

    struct CategoryRow: Codable {
        let transientToolID: Int
        let locale: String
        let category: String

        enum CodingKeys: String, CodingKey {
            case transientToolID = "toolId"
            case locale = "locale"
            case category = "category"
        }
    }

    struct ContainerMetadataLocalizationRow: Codable {
        let transientContainerID: Int
        let locale: String
        let name: String

        enum CodingKeys: String, CodingKey {
            case transientContainerID = "containerId"
            case locale = "locale"
            case name = "name"
        }
    }

    struct ContainerMetadataRow: Codable {
        let transientContainerID: Int
        let persistentContainerID: String
        let bundleVersion: String
        let teamID: String
        let deviceID: String
        let origin: Int
        let containerType: Int

        enum CodingKeys: String, CodingKey {
            case transientContainerID = "rowId"
            case persistentContainerID = "id"
            case bundleVersion = "bundleVersion"
            case teamID = "teamId"
            case deviceID = "deviceId"
            case origin = "origin"
            case containerType = "containerType"
        }
    }

    struct ContainerMetadataSynonymRow: Codable {
        let transientContainerID: Int
        let locale: String
        let synonym: String
        let order: Int

        enum CodingKeys: String, CodingKey {
            case transientContainerID = "containerId"
            case locale = "locale"
            case synonym = "synonym"
            case order = "order"
        }
    }

    struct EntityPropertyLocalizationRow: Codable {
        let persistentEntityID: String
        let persistentPropertyID: String
        let locale: String
        let displayName: String

        enum CodingKeys: String, CodingKey {
            case persistentEntityID = "typeId"
            case persistentPropertyID = "propertyId"
            case locale = "locale"
            case displayName = "displayName"
        }
    }

    struct EntityPropertyRow: Codable {
        let persistentPropertyID: String
        let persistentEntityID: String
        let typeInstanceBlob: String

        enum CodingKeys: String, CodingKey {
            case persistentPropertyID = "id"
            case persistentEntityID = "typeId"
            case typeInstanceBlob = "typeInstance"
        }
    }

    struct EnumerationCaseRow: Codable {
        let persistentEnumerationID: String
        let persistentCaseID: String
        
        let locale: String
        let title: String?
        let subtitle: String?
        let synonyms: String?

        enum CodingKeys: String, CodingKey {
            case persistentEnumerationID = "typeId"
            case persistentCaseID = "id"
            case locale = "locale"
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
        let transientToolID: Int

        enum CodingKeys: String, CodingKey {
            case identifier = "identifier"
            case transientToolID = "toolId"
        }
    }

    struct LinkStateRow: Codable {
        let persistentContainerID: String
        let installIdentifierBlob: String

        enum CodingKeys: String, CodingKey {
            case persistentContainerID = "containerId"
            case installIdentifierBlob = "installIdentifier"
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
        let transientToolID: Int
        let persistentParameterID: String
        let locale: String
        let name: String
        let description: String?
        let trueString: String?
        let falseString: String?

        enum CodingKeys: String, CodingKey {
            case transientToolID = "toolId"
            case persistentParameterID = "key"
            case locale = "locale"
            case name = "name"
            case description = "description"
            case trueString = "trueString"
            case falseString = "falseString"
        }
    }

    struct ParameterRow: Codable {
        let transientToolID: Int
        let persistentParameterID: String
        let typeInstanceBlob: String
        let sortOrder: Int
        let flags: Int
        let relationshipsBlob: String

        enum CodingKeys: String, CodingKey {
            case transientToolID = "toolId"
            case persistentParameterID = "key"
            case typeInstanceBlob = "typeInstance"
            case sortOrder = "sortOrder"
            case flags = "flags"
            case relationshipsBlob = "relationships"
        }
    }

    struct PredicateTemplateRow: Codable {
        let persistentTypeID: String
        let comparisonBlob: String

        enum CodingKeys: String, CodingKey {
            case persistentTypeID = "typeId"
            case comparisonBlob = "comparison"
        }
    }

    struct SearchKeywordRow: Codable {
        let transientToolID: Int
        let locale: String
        let keyword: String
        let sortOrder: Int

        enum CodingKeys: String, CodingKey {
            case transientToolID = "toolId"
            case locale = "locale"
            case keyword = "keyword"
            case sortOrder = "order"
        }
    }

    struct SystemToolProtocolRow: Codable {
        let transientToolID: Int
        let persistentProtocolID: String
        let protocolBlob: String

        enum CodingKeys: String, CodingKey {
            case transientToolID = "toolId"
            case persistentProtocolID = "identifier"
            case protocolBlob = "protocol"
        }
    }

    struct SystemTypeProtocolRow: Codable {
        let persistentTypeID: String
        let persistentProtocolID: String
        let protocolBlob: String

        enum CodingKeys: String, CodingKey {
            case persistentTypeID = "typeId"
            case persistentProtocolID = "identifier"
            case protocolBlob = "protocol"
        }
    }

    struct ToolLocalizationRow: Codable {
        let transientToolID: Int
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
            case transientToolID = "toolId"
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
        let transientToolID: Int
        let persistentTypeID: String

        enum CodingKeys: String, CodingKey {
            case transientToolID = "toolId"
            case persistentTypeID = "typeIdentifier"
        }
    }

    struct ToolParameterTypeRow: Codable {
        let transientToolID: Int
        let persistentParameterID: String
        let persistentTypeID: String

        enum CodingKeys: String, CodingKey {
            case transientToolID = "toolId"
            case persistentParameterID = "key"
            case persistentTypeID = "typeId"
        }
    }

    struct ToolRow: Codable {
        let transientToolID: Int
        let persistentToolID: String
        let toolType: String
        let flags: Int
        let visibilityFlags: Int
        let requirementsBlob: String
        let authenticationPolicy: String
        let customIconBlob: String?
        let deprecationReplacementID: String?
        let sourceActionProvider: String
        let outputTypeInstanceBlob: String
        let transientSourceContainerID: Int
        let transientAttributionContainerID: Int?

        enum CodingKeys: String, CodingKey {
            case transientToolID = "rowId"
            case persistentToolID = "id"
            case toolType = "toolType"
            case flags = "flags"
            case visibilityFlags = "visibilityFlags"
            case requirementsBlob = "requirements"
            case authenticationPolicy = "authenticationPolicy"
            case customIconBlob = "customIcon"
            case deprecationReplacementID = "deprecationReplacementId"
            case sourceActionProvider = "sourceActionProvider"
            case outputTypeInstanceBlob = "outputTypeInstance"
            case transientSourceContainerID = "sourceContainerId"
            case transientAttributionContainerID = "attributionContainerId"
        }
    }

    struct TriggerLocalizationRow: Codable {
        let transientTriggerID: Int
        let locale: String
        let name: String
        let outputResultName: String?
        let descriptionSummary: String

        enum CodingKeys: String, CodingKey {
            case transientTriggerID = "triggerId"
            case locale = "locale"
            case name = "name"
            case outputResultName = "outputResultName"
            case descriptionSummary = "descriptionSummary"
        }
    }

    struct TriggerOutputTypeRow: Codable {
        let transientTriggerID: Int
        let persistentTypeID: String

        enum CodingKeys: String, CodingKey {
            case transientTriggerID = "triggerId"
            case persistentTypeID = "typeIdentifier"
        }
    }

    struct TriggerParameterLocalizationRow: Codable {
        let transientTriggerID: Int
        let persistentTriggerParameterID: String
        let locale: String
        let name: String
        let description: String?

        enum CodingKeys: String, CodingKey {
            case transientTriggerID = "triggerId"
            case persistentTriggerParameterID = "key"
            case locale = "locale"
            case name = "name"
            case description = "description"
        }
    }

    struct TriggerParameterRow: Codable {
        let transientTriggerID: Int
        let persistentTriggerParameterID: String
        let persistentTypeID: String
        let sortOrder: Int
        let flags: Int
        let typeInstanceBlob: String
        let relationshipsBlob: String

        enum CodingKeys: String, CodingKey {
            case transientTriggerID = "triggerId"
            case persistentTriggerParameterID = "key"
            case persistentTypeID = "typeId"
            case sortOrder = "sortOrder"
            case flags = "flags"
            case typeInstanceBlob = "typeInstance"
            case relationshipsBlob = "relationships"
        }
    }

    struct TriggerRow: Codable {
        let transientTriggerID: Int
        let persistentTriggerID: String
        let flags: Int
        let requirementsBlob: String
        let outputTypeInstanceBlob: String

        enum CodingKeys: String, CodingKey {
            case transientTriggerID = "rowId"
            case persistentTriggerID = "id"
            case flags = "flags"
            case requirementsBlob = "requirements"
            case outputTypeInstanceBlob = "outputTypeInstance"
        }
    }

    struct TypeCoercionRow: Codable {
        let persistentTypeID: String
        let coercionDefinitionBlob: String

        enum CodingKeys: String, CodingKey {
            case persistentTypeID = "typeId"
            case coercionDefinitionBlob = "coercionDefinition"
        }
    }

    struct TypeDisplayRepresentationRow: Codable {
        let persistentTypeID: String
        let locale: String
        let name: String
        let numericFormat: String?
        let synonymsBlob: String

        enum CodingKeys: String, CodingKey {
            case persistentTypeID = "typeId"
            case locale = "locale"
            case name = "name"
            case numericFormat = "numericFormat"
            case synonymsBlob = "synonyms"
        }
    }

    struct TypeRow: Codable {
        let persistentTypeID: String
        let persistentTypeIDBlob: String
        let transientSourceContainerID: Int
        let kind: Int
        let runtimeFlags: Int?
        let runtimeRequirementsBlob: String?

        enum CodingKeys: String, CodingKey {
            case persistentTypeID = "rowId"
            case persistentTypeIDBlob = "id"
            case transientSourceContainerID = "sourceContainerId"
            case kind = "kind"
            case runtimeFlags = "runtimeFlags"
            case runtimeRequirementsBlob = "runtimeRequirements"
        }
    }

    struct UTTypeCoercionRow: Codable {
        let persistentTypeID: String
        let coercionUTI: String

        enum CodingKeys: String, CodingKey {
            case persistentTypeID = "typeId"
            case coercionUTI = "coercionIdentifier"
        }
    }
}
