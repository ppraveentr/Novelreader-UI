//
//  NovelView.swift
//  NovelReader
//
//  Created by Praveen Prabhakar on 26/10/22.
//  Copyright (c) 2022 Praveen P. All rights reserved.
//

import ContentManager
import SwiftData
import SwiftUI

struct NovelView: View {
    @Environment(\.modelContext) var modelContext
    @Query var destinations: [VisualContent]

    @State
    private var searchText: String = ""

    var body: some View {
        VStack {
            Text("Hello, NovelView!")
            ForEach(destinations) { destination in
                VStack(alignment: .leading) {
                    Text(destination.name)
                        .font(.headline)
                    Text(destination.content)
                        .font(.subheadline)
                }
            }
        }
        .toolbar {
            Button("Add Samples", action: addSamples)
        }
        .searchable(text: $searchText,
                    placement: .navigationBarDrawer(displayMode: .automatic),
                    prompt: "Title, Author")
    }

    func addSamples() {
        let model = VisualContent(name: "dsd", lang: "Sds", content: "sds", version: 1.0)
        modelContext.insert(model)
        try? modelContext.save()
    }
}

// MARK: Preview

#Preview {
    NovelView()
}
