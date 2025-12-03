//
//  Container+Localization.swift
//  SESCA
//
//  Created by Kenna Blackburn on 11/27/25.
//

extension Master.Container {
    struct Localization: Codable, Hashable {
        let localeID: String
        
        let name: String
    }
}

extension Master.Container.Localization {
    init(
        containerRow: RawSQLite.Tables.ContainerMetadata.Row,
        sqlite: RawSQLite,
    ) throws {
        let containerLocalizationRow = try sqlite[RawSQLite.Tables.ContainerMetadataLocalizations.self]
            .rows
            .first(where: { $0.transientContainerID == containerRow.transientContainerID })
            .unwrap(throwing: LocativeError())
        
        self.localeID = containerLocalizationRow.locale
        
        self.name = containerLocalizationRow.name
    }
}
