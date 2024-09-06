//
//  SwiftModelContainer.swift
//  ContentManager
//
//  Created by Praveen Prabhakar on 9/2/24.
//  Copyright (c) 2024 Praveen P. All rights reserved.
//

import Foundation
import SwiftData

public class SwiftModelContainer {
    public let dbName: String
    public let storeURL: URL
    public let container: ModelContainer

    public init(dbName: String) throws {
        self.dbName = dbName
        self.storeURL = try ContentLoader.preloadDBData(dbName)
        self.container = try Self.modelContainer(storeURL: self.storeURL)
    }
}

// MARK: SwiftData ModelContainer

private extension SwiftModelContainer {
    static func modelContainer(storeURL: URL) throws -> ModelContainer {
        let config = ModelConfiguration(url: storeURL)
        do {
            let schema = Schema([VisualContent.self])
            let config = ModelConfiguration(schema: schema, url: storeURL, cloudKitDatabase: .none)
            return try ModelContainer(for: schema, configurations: config)
        } catch {
            debugPrint(error.localizedDescription)
            throw NSError(domain: "Failed to configure SwiftData container.", code: 500)
        }
    }
}
