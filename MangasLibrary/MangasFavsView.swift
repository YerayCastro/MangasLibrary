//
//  MangasFavsView.swift
//  MangasLibrary
//
//  Created by Yery Castro on 19/3/24.
//

import SwiftUI

struct MangasFavsView: View {
    let mangas: Mangas
    @EnvironmentObject var vm: MangasVM
    @ObservedObject var editVM: MangasEditVM
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(vm.favoritos) { manga in
                    NavigationLink(value: manga) {
                        MangasFavCellView(mangas: manga, editVM: MangasEditVM(manga: manga))
                    }
                }
            }
            .navigationDestination(for: Mangas.self) { manga in
                MangasDetailView(editVM: MangasEditVM(manga: manga))
            }
            .navigationTitle("Favorites")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                vm.loadFavoritesFromFile()
            }
        }
        
        
    }
}

#Preview {
    NavigationStack {
        MangasFavsView(mangas: .test, editVM: MangasEditVM(manga: .test))
            .environmentObject(MangasVM.preview)
    }
}

