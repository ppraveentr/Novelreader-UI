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
    static let themeJson = "Theme.json"
    @State var dbManger = ContentStore.contentManager

    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    Task {
                        await loadThemeModel(theme: Self.themeJson)
                    }
                }
                .persistenceManager(dbManger)
        }
    }
}

private func loadThemeModel(theme: String) async {
    guard let lightTheme = try? Data.contentOfFile(theme) else { return }
    try? ThemesManager.setupApplicationTheme(lightTheme)
}
