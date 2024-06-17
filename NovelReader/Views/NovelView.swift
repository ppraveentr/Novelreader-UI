//
//  NovelView.swift
//  NovelReader
//
//  Created by Praveen Prabhakar on 26/10/22.
//  Copyright (c) 2022 Praveen P. All rights reserved.
//

import SwiftUI

struct NovelView: View {
    @State
    private var searchText: String = ""

    var body: some View {
        VStack {
            Text("Hello, HomeView!")
        }
        .searchable(text: $searchText,
                    placement: .navigationBarDrawer(displayMode: .automatic),
                    prompt: "Title, Author")
    }
}

// MARK: Preview

#Preview {
    NovelView()
}
