//
//  NovelReaderApp.swift
//  NovelReader
//
//  Created by Praveen Prabhakar on 24/09/22.
//

import SwiftUI
import Theme

@main
struct NovelReaderApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .onAppear {
                    Task {
                        await loadThemeModel()
                    }
                }
        }
    }
}

private func loadThemeModel() async {
    guard let lightTheme = try? Data.contentOfFile("Theme.json") else { return }
    try? ThemesManager.loadThemeModel(lightTheme)
}
