//
//  Destinations.swift
//  NovelReader
//
//  Created by Praveen Prabhakar on 30/10/22.
//

import SwiftUI

enum Destinations: CaseIterable, Identifiable {
    case search, profile

    var id: String { title }

    static func tabBarView(_ selection: Binding<Destinations>) -> some View {
        TabView(selection: selection) {
            ForEach(Destinations.allCases, id: \.self) { $0.navigationView }
        }
    }

    static func sideBarView(_ selection: Binding<Destinations>) -> some View {
        let _selection: Binding<Destinations?> = Binding(selection)
        return NavigationView {
            List {
                ForEach(Destinations.allCases, id: \.self) { $0.navigationLink(_selection) }
            }
        }
    }
}

private extension Destinations {
    var title: String {
        switch self {
        case .search: return "Search"
        case .profile: return "Profile"
        }
    }

    var segmentLabel: some View {
        let title = self.title
        switch self {
        case .search:
            return Label(title, systemImage: "magnifyingglass")
        case .profile:
            return Label(title, systemImage: "person")
        }
    }

    @ViewBuilder
    var contentView: some View {
        switch self {
        case .search:
            HomeView()
        case .profile:
            ProfileView()
        }
    }

    @ViewBuilder
    var navigationView: some View {
        NavigationView {
            contentView
        }
        .tabItem {
            segmentLabel
        }
        .tag(self)
    }

    @ViewBuilder
    func navigationLink(_ selection: Binding<Destinations?>) -> some View {
        NavigationLink(tag: self, selection: selection) {
            contentView
        } label: {
            segmentLabel
        }
        .tag(self)
    }
}
