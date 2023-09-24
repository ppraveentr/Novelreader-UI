//
//  Destinations.swift
//  NovelReader
//
//  Created by Praveen Prabhakar on 30/10/22.
//

import SwiftUI

enum Destinations: CaseIterable, Identifiable {
    case home, libary, profile

    var id: String { title }

    // For horizontalSizeClass == .compact
    static func tabBarView(_ selection: Binding<Destinations>) -> some View {
        TabView(selection: selection) {
            ForEach(Destinations.allCases, id: \.self) { $0.navigationView }
        }
    }

    // For all others
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
        case .home: return "Home"
        case .profile: return "Profile"
        case .libary: return "Libary"
        }
    }

    var segmentLabel: some View {
        let title = self.title
        switch self {
        case .home:
            return Label(title, systemImage: "house.fill")
        case .profile:
            return Label(title, systemImage: "person")
        case .libary:
            return Label(title, systemImage: "books.vertical.fill")
        }
    }

    @ViewBuilder
    var contentView: some View {
        switch self {
        case .home:
            HomeView()
        case .profile:
            ProfileView()
        case .libary:
            LibaryView()
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
    }
}
