//
//  MangasVM.swift
//  MangasLibrary
//
//  Created by Yery Castro on 19/3/24.
//

import SwiftUI

final class MangasVM: ObservableObject {
    let network: DataInteractor
    @Published var mangas: [Mangas] = []
    @Published var showAlert = false
    @Published var msg = ""
    @Published var deleteAlert = false
    var mangaDelete: Mangas?
    @Published var favoritos: [Mangas] = []
    @Published var currentPage = 1
    @Published var search: String = ""
    @Published var authors: [Author] = []
    @Published var selectedTheme: String = "" {
        didSet {
            if let theme = Themes(rawValue: selectedTheme) {
                Task {
                    await themesMangas(theme: theme)
                }
            }
        }
    }
    
    @Published var genreSelected: String = "" {
        didSet {
            if let genre = Genres(rawValue: genreSelected) {
                Task {
                    await genresMangas(genre: genre)
                }
            }
        }
    }
    
    @Published var demographicSelected: String = "" {
        didSet {
            if let demographic = Demographics(rawValue: demographicSelected) {
                Task {
                    await demographicMangas(demographic: demographic)
                }
            }
        }
    }
    
    init(network: DataInteractor = Network()) {
        
        self.network = network
        
        Task { await getMangas() }
    }
    
    func sortMangasByScore(mangas: [Mangas]) -> [Mangas] {
        return mangas.sorted { $0.score > $1.score }
    }
    
    func getMangas() async {
        do {
            let mangs = try await network.getMangas(page: currentPage)
            await MainActor.run {
                mangas += mangs
            }
        } catch {
            await MainActor.run {
                self.msg = "\(error)"
                self.showAlert.toggle()
            }
        }
    }
    
    func ultimoItem(manga: Mangas) -> Bool {
        mangas.last?.id == manga.id
    }
    
    func siguientePagina(manga: Mangas) {
        if ultimoItem(manga: manga) {
            currentPage += 1
            Task {
                search.isEmpty ? await getMangas() : await buscarMangas()
            }
        }
    }
    
    func buscarMangas() async {
        guard !search.isEmpty else {
            await MainActor.run {
                mangas.removeAll()
            }
            currentPage = 1
            await getMangas()
            return
        }
        
        do {
            let manga = try await network.searchMangas(page: currentPage, contain: search)
            await MainActor.run {
                if currentPage == 1 {
                    mangas.removeAll()
                }
                mangas += manga
            }
        } catch {
            print(error)
        }
    }
    
    func updateSearch(_ newSearch: String) {
        currentPage = 1
        search = newSearch
    }
    
    func themesMangas(theme: Themes) async -> [Mangas] {
        guard !selectedTheme.isEmpty else {
            await getMangasAndReset()
            return []
        }
        
        do {
            let manga = try await network.themesMangas(theme: theme)
            await MainActor.run {
                if currentPage == 1 {
                    mangas.removeAll()
                }
                mangas += manga
            }
        } catch {
            print(error)
        }
        
        return []
    }
    
    func genresMangas(genre: Genres) async -> [Mangas] {
        guard !genreSelected.isEmpty else {
            await getMangasAndReset()
            return []
        }
        
        do {
            let manga = try await network.genresMangas(genre: genre)
            await MainActor.run {
                if currentPage == 1 {
                    mangas.removeAll()
                }
                mangas += manga
            }
        } catch {
            print(error)
        }
        
        return []
    }
    
    func demographicMangas(demographic: Demographics) async -> [Mangas] {
        guard !demographicSelected.isEmpty else {
            await getMangasAndReset()
            return []
        }
        
        do {
            let manga = try await network.demographicMangas(demographic: demographic)
            await MainActor.run {
                if currentPage == 1 {
                    mangas.removeAll()
                }
                mangas += manga
            }
        } catch {
            print(error)
        }
        
        return []
    }
    
    private func getMangasAndReset() async {
        await MainActor.run {
            mangas.removeAll()
        }
        currentPage = 1
        demographicSelected = ""
        genreSelected = ""
        selectedTheme = ""
        await getMangas()
    }
    
    func deleteMangaAlert(manga: Mangas) {
        msg = "Estás seguro de borrar el manga \(manga.title)"
        deleteAlert.toggle()
        mangaDelete = manga
    }
    
    func removeFromFavorites(mangaToRemove: Mangas) {
        withAnimation {
            if let index = favoritos.firstIndex(where: { $0.id == mangaToRemove.id }) {
                favoritos.remove(at: index)
                Task {await saveFavoritesToFile()}
            }
        }
    }
    
    func deleteManga() {
        if let mangaDelete {
            withAnimation {
                mangas.removeAll(where: { $0.id == mangaDelete.id })
            }
        }
    }
    
    func updateMangaArray(manga: Mangas)  {
        if let first = mangas.firstIndex(where: { $0.id == manga.id }) {
            mangas[first] = manga
        }
    }
    
    private func saveMangasToFileAsync() async {
        do {
            let data = try JSONEncoder().encode(mangas)
            try await withCheckedThrowingContinuation { continuation in
                do {
                    let fileURL = getDocumentsDirectory().appendingPathComponent("mismangas.json")
                    try data.write(to: fileURL, options: .atomic)
                    continuation.resume()
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        } catch {
            print("Error al guardar los mangas: \(error)")
        }
    }
    
    func saveFavoritesToFile() async {
        do {
            let data = try JSONEncoder().encode(favoritos)
            let fileURL = getDocumentsDirectory().appendingPathComponent("mismangas.json")
            try data.write(to: fileURL, options: .atomic)
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
                Task {
                    await saveFavoritesToFile()
                }
            }
        }
    }
    
    func loadFavoritesFromFile() {
        let fileURL = getDocumentsDirectory().appendingPathComponent("mismangas.json")
        if let data = try? Data(contentsOf: fileURL) {
            favoritos = (try? JSONDecoder().decode([Mangas].self, from: data)) ?? []
        }
    }
    
    private func saveMangasToFile() async {
        do {
            let data = try JSONEncoder().encode(mangas)
            let fileURL = getDocumentsDirectory().appendingPathComponent("mangas.json")
            try data.write(to: fileURL, options: .atomic)
        } catch {
            print("Error al guardar los mangas: \(error)")
        }
    }
}
    





