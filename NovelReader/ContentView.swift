//
//  ContentView.swift
//  NovelReader
//
//  Created by Praveen Prabhakar on 24/09/22.
//  Copyright (c) 2022 Praveen P. All rights reserved.
//

import SwiftUI
import Theme

struct ContentView: View {
#if os(iOS)
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
#endif
    @State private var selection: Destinations = .home

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
