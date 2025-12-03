//
//  _Unsorted.swift
//  SESCA
//
//  Created by Kenna Blackburn on 11/29/25.
//

import Foundation

extension RawSQLite.Tables {
    struct AdditionalToolAttributionContainers: RawSQLiteTable {
        static let name: String = "AdditionalToolAttributionContainers"
        
        let rows: Set<Row>
        
        struct Row: RawSQLiteTableRow {
            let transientToolID: Int
            let transientContainerID: String
            
            enum CodingKeys: String, CodingKey {
                case transientToolID = "toolId"
                case transientContainerID = "containerId"
            }
        }
    }

    struct Categories: RawSQLiteTable {
        static let name: String = "Categories"
        
        let rows: Set<Row>
        
        struct Row: RawSQLiteTableRow {
            let transientToolID: Int
            let locale: String
            let category: String
            
            enum CodingKeys: String, CodingKey {
                case transientToolID = "toolId"
                case locale = "locale"
                case category = "category"
            }
        }
    }

    struct ContainerMetadata: RawSQLiteTable {
        static let name: String = "ContainerMetadata"
        
        let rows: Set<Row>
        
        struct Row: RawSQLiteTableRow {
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
    }

    struct ContainerMetadataLocalizations: RawSQLiteTable {
        static let name: String = "ContainerMetadataLocalizations"
        
        let rows: Set<Row>
        
        struct Row: RawSQLiteTableRow {
            let transientContainerID: Int
            let locale: String
            let name: String
            
            enum CodingKeys: String, CodingKey {
                case transientContainerID = "containerId"
                case locale = "locale"
                case name = "name"
            }
        }
    }

    struct ContainerMetadataSynonyms: RawSQLiteTable {
        static let name: String = "ContainerMetadataSynonyms"
        
        let rows: Set<Row>
        
        struct Row: RawSQLiteTableRow {
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
    }

    struct EntityProperties: RawSQLiteTable {
        static let name: String = "EntityProperties"
        
        let rows: Set<Row>
        
        struct Row: RawSQLiteTableRow {
            let persistentPropertyID: String
            let persistentEntityID: String
            let typeInstanceBlob: String
            
            enum CodingKeys: String, CodingKey {
                case persistentPropertyID = "id"
                case persistentEntityID = "typeId"
                case typeInstanceBlob = "typeInstance"
            }
        }
    }

    struct EntityPropertyLocalizations: RawSQLiteTable {
        static let name: String = "EntityPropertyLocalizations"
        
        let rows: Set<Row>
        
        struct Row: RawSQLiteTableRow {
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
    }

    struct EnumerationCases: RawSQLiteTable {
        static let name: String = "EnumerationCases"
        
        let rows: Set<Row>
        
        struct Row: RawSQLiteTableRow {
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
    }

    struct LaunchServiceState: RawSQLiteTable {
        static let name: String = "LaunchServiceState"
        
        let rows: Set<Row>
        
        struct Row: RawSQLiteTableRow {
            let bundleID: String
            let persistentIdentifier: String
            
            enum CodingKeys: String, CodingKey {
                case bundleID = "bundleId"
                case persistentIdentifier = "persistentIdentifier"
            }
        }
    }

    struct LinkActionIdentifiers: RawSQLiteTable {
        static let name: String = "LinkActionIdentifiers"
        
        let rows: Set<Row>
        
        struct Row: RawSQLiteTableRow {
            let identifier: String
            let transientToolID: Int
            
            enum CodingKeys: String, CodingKey {
                case identifier = "identifier"
                case transientToolID = "toolId"
            }
        }
    }

    struct LinkState: RawSQLiteTable {
        static let name: String = "LinkState"
        
        let rows: Set<Row>
        
        struct Row: RawSQLiteTableRow {
            let persistentContainerID: String
            let installIdentifierBlob: String
            
            enum CodingKeys: String, CodingKey {
                case persistentContainerID = "containerId"
                case installIdentifierBlob = "installIdentifier"
            }
        }
    }

    struct Metadata: RawSQLiteTable {
        static let name: String = "Metadata"
        
        let rows: Set<Row>
        
        struct Row: RawSQLiteTableRow {
            let key: String
            let value: String
            
            enum CodingKeys: String, CodingKey {
                case key = "key"
                case value = "value"
            }
        }
    }

    struct ParameterLocalizations: RawSQLiteTable {
        static let name: String = "ParameterLocalizations"
        
        let rows: Set<Row>
        
        struct Row: RawSQLiteTableRow {
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
    }

    struct Parameters: RawSQLiteTable {
        static let name: String = "Parameters"
        
        let rows: Set<Row>
        
        struct Row: RawSQLiteTableRow {
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
    }

    struct PredicateTemplates: RawSQLiteTable {
        static let name: String = "PredicateTemplates"
        
        let rows: Set<Row>
        
        struct Row: RawSQLiteTableRow {
            let persistentTypeID: String
            let comparisonBlob: String
            
            enum CodingKeys: String, CodingKey {
                case persistentTypeID = "typeId"
                case comparisonBlob = "comparison"
            }
        }
    }

    struct SearchKeywords: RawSQLiteTable {
        static let name: String = "SearchKeywords"
        
        let rows: Set<Row>
        
        struct Row: RawSQLiteTableRow {
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
    }

    struct SystemToolProtocols: RawSQLiteTable {
        static let name: String = "SystemToolProtocols"
        
        let rows: Set<Row>
        
        struct Row: RawSQLiteTableRow {
            let transientToolID: Int
            let persistentProtocolID: String
            let protocolBlob: String
            
            enum CodingKeys: String, CodingKey {
                case transientToolID = "toolId"
                case persistentProtocolID = "identifier"
                case protocolBlob = "protocol"
            }
        }
    }

    struct SystemTypeProtocols: RawSQLiteTable {
        static let name: String = "SystemTypeProtocols"
        
        let rows: Set<Row>
        
        struct Row: RawSQLiteTableRow {
            let persistentTypeID: String
            let persistentProtocolID: String
            let protocolBlob: String
            
            enum CodingKeys: String, CodingKey {
                case persistentTypeID = "typeId"
                case persistentProtocolID = "identifier"
                case protocolBlob = "protocol"
            }
        }
    }

    struct ToolLocalizations: RawSQLiteTable {
        static let name: String = "ToolLocalizations"
        
        let rows: Set<Row>
        
        struct Row: RawSQLiteTableRow {
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
    }

    struct ToolOutputTypes: RawSQLiteTable {
        static let name: String = "ToolOutputTypes"
        
        let rows: Set<Row>
        
        struct Row: RawSQLiteTableRow {
            let transientToolID: Int
            let persistentTypeID: String
            
            enum CodingKeys: String, CodingKey {
                case transientToolID = "toolId"
                case persistentTypeID = "typeIdentifier"
            }
        }
    }

    struct ToolParameterTypes: RawSQLiteTable {
        static let name: String = "ToolParameterTypes"
        
        let rows: Set<Row>
        
        struct Row: RawSQLiteTableRow {
            let transientToolID: Int
            let persistentParameterID: String
            let persistentTypeID: String
            
            enum CodingKeys: String, CodingKey {
                case transientToolID = "toolId"
                case persistentParameterID = "key"
                case persistentTypeID = "typeId"
            }
        }
    }

    struct Tools: RawSQLiteTable {
        static let name: String = "Tools"
        
        let rows: Set<Row>
        
        struct Row: RawSQLiteTableRow {
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
    }

    struct TriggerLocalizations: RawSQLiteTable {
        static let name: String = "TriggerLocalizations"
        
        let rows: Set<Row>
        
        struct Row: RawSQLiteTableRow {
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
    }

    struct TriggerOutputTypes: RawSQLiteTable {
        static let name: String = "TriggerOutputTypes"
        
        let rows: Set<Row>
        
        struct Row: RawSQLiteTableRow {
            let transientTriggerID: Int
            let persistentTypeID: String
            
            enum CodingKeys: String, CodingKey {
                case transientTriggerID = "triggerId"
                case persistentTypeID = "typeIdentifier"
            }
        }
    }

    struct TriggerParameterLocalizations: RawSQLiteTable {
        static let name: String = "TriggerParameterLocalizations"
        
        let rows: Set<Row>
        
        struct Row: RawSQLiteTableRow {
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
    }

    struct TriggerParameters: RawSQLiteTable {
        static let name: String = "TriggerParameters"
        
        let rows: Set<Row>
        
        struct Row: RawSQLiteTableRow {
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
    }

    struct Triggers: RawSQLiteTable {
        static let name: String = "Triggers"
        
        let rows: Set<Row>
        
        struct Row: RawSQLiteTableRow {
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
    }

    struct TypeCoercions: RawSQLiteTable {
        static let name: String = "TypeCoercions"
        
        let rows: Set<Row>
        
        struct Row: RawSQLiteTableRow {
            let persistentTypeID: String
            let coercionDefinitionBlob: String
            
            enum CodingKeys: String, CodingKey {
                case persistentTypeID = "typeId"
                case coercionDefinitionBlob = "coercionDefinition"
            }
        }
    }

    struct TypeDisplayRepresentations: RawSQLiteTable {
        static let name: String = "TypeDisplayRepresentations"
        
        let rows: Set<Row>
        
        struct Row: RawSQLiteTableRow {
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
    }

    struct Types: RawSQLiteTable {
        static let name: String = "Types"
        
        let rows: Set<Row>
        
        struct Row: RawSQLiteTableRow {
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
    }

    struct UTTypeCoercions: RawSQLiteTable {
        static let name: String = "UTTypeCoercions"
        
        let rows: Set<Row>
        
        struct Row: RawSQLiteTableRow {
            let persistentTypeID: String
            let coercionUTI: String
            
            enum CodingKeys: String, CodingKey {
                case persistentTypeID = "typeId"
                case coercionUTI = "coercionIdentifier"
            }
        }
    }
}
