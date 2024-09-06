//
//  PersistenceManager.swift
//  NovelReader
//
//  Created by Praveen Prabhakar on 24/09/22.
//  Copyright (c) 2022 Praveen P. All rights reserved.
//

import ContentManager
import SwiftData
import SwiftUI

@Observable
class PersistenceManager {
    static let dbName = "NovelReader.db"
    var contentManager: SwiftModelContainer?

    init() {
        self.contentManager = try? SwiftModelContainer(dbName: Self.dbName)
    }
}

extension View {
    func dbManagerKey(_ manager: PersistenceManager) -> some View {
        modifier(DBManagerModifier(manager: manager))
    }
}

private struct DBManagerModifier: ViewModifier {
    let manager: PersistenceManager

    func body(content: Content) -> some View {
        if let container = manager.contentManager?.container {
            content
                .modelContainer(container)
                .environment(manager)
        } else {
            content
                .environment(manager)
        }
    }
}
