//
//  MainView.swift
//  MangasLibrary
//
//  Created by Yery Castro on 19/3/24.
//

import SwiftUI

struct MangasMainView: View {
    @EnvironmentObject var vm: MangasVM
    var body: some View {
        TabView {
            MangasView()
                .tabItem { Label("Mangas", systemImage: "book.fill") }
            MangasFavsView(mangas: .test, editVM: MangasEditVM(manga: .test))
                .tabItem { Label("Favorites", systemImage: "star.fill") }
            MangasSearchView()
                .tabItem { Label("Search", systemImage: "magnifyingglass") }
            MangasBestView()
                .tabItem { Label("Best", systemImage: "list.star") }
        }
    }
}

#Preview {
    MangasMainView()
        .environmentObject(MangasVM.preview)
}
