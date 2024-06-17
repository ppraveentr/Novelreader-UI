//
//  LibaryView.swift
//  NovelReader
//
//  Created by Praveen Prabhakar on 05/11/22.
//  Copyright (c) 2022 Praveen P. All rights reserved.
//

import SwiftUI

struct LibaryView: View {
    @State
    var searchText: String = ""

    var body: some View {
        VStack {
            Text("Hello, Libary!")
                .style("Title")
        }
        .searchable(text: $searchText,
                    placement: .navigationBarDrawer(displayMode: .automatic),
                    prompt: "Title, Author")
    }
}

// MARK: Preview

#Preview {
    LibaryView()
}
