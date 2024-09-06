//
//  NovelReaderApp.swift
//  NovelReader
//
//  Created by Praveen Prabhakar on 24/09/22.
//  Copyright (c) 2022 Praveen P. All rights reserved.
//

import SwiftData
import SwiftUI
import Theme

@main
struct NovelReaderApp: App {
    let dbManger = PersistenceManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    Task {
                        await loadThemeModel()
                    }
                }
                .dbManagerKey(dbManger)
//                .modelContext(persistenceController)
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

private func loadThemeModel() async {
    guard let lightTheme = try? Data.contentOfFile("Theme.json") else { return }
    try? ThemesManager.setupApplicationTheme(lightTheme)
}
