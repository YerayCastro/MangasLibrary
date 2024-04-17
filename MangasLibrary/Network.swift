//
//  Network.swift
//  MangasLibrary
//
//  Created by Yery Castro on 19/3/24.
//

import Foundation

protocol DataInteractor {
    func getMangas(page: Int) async throws -> [Mangas]
    func searchMangas(page: Int, contain: String) async throws -> [Mangas]
    func genresMangas(genre: Genres) async throws -> [Mangas]
    func updateManga(manga: Mangas) async throws
    func demographicMangas(demographic: Demographics) async throws -> [Mangas]
    func themesMangas(theme: Themes) async throws -> [Mangas]
    var docURL: URL { get }
    func saveData<T>(json: T) throws where T: Codable
    func bestMangas(url: URL) async throws -> [Mangas]
    
}

struct Network: DataInteractor {
    let docURL = URL.documentsDirectory.appending(path: "mismangas.json")
    func updateManga(manga: Mangas) async throws {
        try await postJSON(request: .post(url: .manga, data: manga.toUpdate, method: "PUT"))
    }

    func postJSON(request: URLRequest, status: Int = 200) async throws {
        let (_, response) = try await URLSession.shared.getData(request: request)
        if response.statusCode != status {
            throw NetworkError.statusCode(response.statusCode)
        }
    }
    
    func getMangas(page: Int) async throws -> [Mangas] {
        try await getJSON(request: .getC(url: .urlManga, page: page), type: DTOMangas.self).items.map(\.toPresentation)
    }
    
    func searchMangas(page: Int, contain: String) async throws -> [Mangas] {
        try await getJSON(request: .getC(url: .containsManga, page: page, per: 10, contain: contain), type: DTOMangas.self).items.map(\.toPresentation)
    }

    func genresMangas(genre: Genres) async throws -> [Mangas] {
        try await getJSON(request: .getGenres(url: .urlGenres, genre: genre), type: DTOMangas.self).items.map(\.toPresentation)
    }
    
    func demographicMangas(demographic: Demographics) async throws -> [Mangas] {
        try await getJSON(request: .getDemographics(url: .urlDemographic, demographic: demographic), type: DTOMangas.self).items.map(\.toPresentation)
    }
    
    func themesMangas(theme: Themes) async throws -> [Mangas] {
        try await getJSON(request: .getThemes(url: .urlTheme, theme: theme), type: DTOMangas.self).items.map(\.toPresentation)
    }
    func bestMangas(url: URL) async throws -> [Mangas] {
        try await getJSON(request: .getBestMangas(url: .bestMangas), type: DTOMangas.self).items.map(\.toPresentation)
    }
    
}

extension DataInteractor {
    func saveData<T>(json: T) throws where T: Codable {
        let data = try JSONEncoder().encode(json)
        try data.write(to: docURL, options: .atomic)
    }
}
