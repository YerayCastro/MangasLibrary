//
//  MangasEditVM.swift
//  MangasLibrary
//
//  Created by Yery Castro on 19/3/24.
//

import SwiftUI


final class MangasEditVM: ObservableObject {
    @Published var manga: Mangas
    @Published var favoritos: [Mangas] = []
    
    init(manga: Mangas) {
        self.manga = manga
    }
    
    func saveFavoritesToFile() {
        do {
            let data = try JSONEncoder().encode(favoritos)
            let fileURL = getDocumentsDirectory().appendingPathComponent("mismangas.json")
            try data.write(to: fileURL, options: .atomicWrite)
        } catch {
            print("Error al guardar los favoritos: \(error)")
        }
    }
    
    private func getDocumentsDirectory() -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    func addToFavorites(manga: Mangas) {
        withAnimation {
            if !favoritos.contains(where: { $0.id == manga.id }) {
                favoritos.append(manga)
                saveFavoritesToFile()
            }
        }
    }

    func removeFromFavorites(mangaToRemove: Mangas) {
        withAnimation {
            if let index = favoritos.firstIndex(where: { $0.id == mangaToRemove.id }) {
                favoritos.remove(at: index)
                saveFavoritesToFile()
            }
        }
    }
    
    func loadFavoritesFromFile() {
        let fileURL = getDocumentsDirectory().appendingPathComponent("mismangas.json")
        if let data = try? Data(contentsOf: fileURL) {
            favoritos = (try? JSONDecoder().decode([Mangas].self, from: data)) ?? []
        }
    }
}
