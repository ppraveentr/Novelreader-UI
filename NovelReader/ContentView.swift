//
//  ContentView.swift
//  NovelReader
//
//  Created by Praveen Prabhakar on 24/09/22.
//

import SwiftUI
import CoreData
import Theme

struct ContentView: View {
#if os(iOS)
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
#endif
    @State private var selection: Destinations = .search

    var body: some View {
        ZStack {
#if os(iOS)
            if horizontalSizeClass == .compact {
                Destinations.tabBarView($selection)
            } else {
                Destinations.sideBarView($selection)
            }
#else
            Destinations.sideBarView($selection)
#endif
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
