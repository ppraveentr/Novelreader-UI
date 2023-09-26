//
//  LibaryView.swift
//  NovelReader
//
//  Created by Praveen Prabhakar on 05/11/22.
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

private struct LibaryView_Previews: PreviewProvider {
    static var previews: some View {
        LibaryView()
    }
}
