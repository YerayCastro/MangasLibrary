//
//  DataTest.swift
//  MangasLibrary
//
//  Created by Yery Castro on 19/3/24.
//

import Foundation

extension MangasVM {
    static let preview = MangasVM(network: DataTest())
}

struct DataTest: DataInteractor {
    
    func bestMangas(url: URL) async throws -> [Mangas] {
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode(DTOMangas.self, from: data).items.map(\.toPresentation)
    }
    
    let docURL = URL.documentsDirectory.appending(path: "mismangas.json")
    
    func demographicMangas(demographic: Demographics) async throws -> [Mangas] {
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode(DTOMangas.self, from: data).items.map(\.toPresentation)
    }
    
    func updateManga(manga: Mangas) async throws {
        
    }
    
    func updateManga(manga: Mangas) async throws -> [Mangas] {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(.dateFormat)
        return try decoder.decode(DTOMangas.self, from: data).items.map(\.toPresentation)
    }
    
    func genresMangas(genre: Genres) async throws -> [Mangas] {
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode(DTOMangas.self, from: data).items.map(\.toPresentation)
    }
    
    func getMangas(page: Int) async throws -> [Mangas] {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(.dateFormat)
        return try decoder.decode(DTOMangas.self, from: data).items.map(\.toPresentation)
    }
    
    func searchMangas(page: Int, contain: String) async throws -> [Mangas] {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(.dateFormat)
        return try decoder.decode(DTOMangas.self, from: data).items.map(\.toPresentation)
    }
    
    func themesMangas(theme: Themes) async throws -> [Mangas] {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(.dateFormat)
        return try decoder.decode(DTOMangas.self, from: data).items.map(\.toPresentation)
    }
    
    let url = Bundle.main.url(forResource: "testmangas-2", withExtension: "json")!
    
}

extension Mangas {
    static let test = Mangas(chapters: 15,
                             score: 6.87,
                             mainPicture: "\"https://cdn.myanimelist.net/images/manga/2/127145l.jpg\"",
                             background: "",
                             url: "\"https://myanimelist.net/manga/5210/Stigmata__Sekiren_no_Seija\"",
                             endDate: Date.now,
                             genres: [Genre(id: "4312867C-1359-494A-AC46-BADFD2E1D4CD", genre: .drama)],
                             title: "Stigmata: Sekiren no Seija",
                             titleEnglish: "",
                             authors: [Author(firstName: "Ya Seong", lastName: "Ko", id: "978C46B6-EABB-4924-BFE0-A341AFFAF46C", role: .art)],
                             sypnosis: "The end of the Holy War.\n\nThe Pope, in an effort to suppress the remaining eye-witnesses who oppose his power, demands that a gag order be enforced regarding “the miracle” that brought the war to an end: the appearance of the five who bore the stigmata - the Holy Marks - the marks of God.\n\n10 years later...\n\nThe diabolic faction that opposed the Vatican’s power and brought about the Holy War has awakened again and has begun assassinating the once-admired heroes of the Holy War. The Vatican has refused to acknowledge the situation, treating each incident as nothing more than simple coincidence, but in the years that have passed since the Holy War ended, the Pope has been rumored to have created an occult organization called RADEM, whose orders are to fight demons though they seem to have another mission - a much more obscure mission...\n\nThe Cardinal calls for an assembly of the region’s clergymen in the name of the Pope to discuss the situation, and to that end, an ambitious nun named Sister Rose is sent to the Teatela Province on a mission to locate Father Gabriel Iota - a priest suspected of possessing a very strong Holy Power...\n\n(Source: Cireus-Scanlations)",
                             startDate: Date.now,
                             themes: [],
                             demographics: [Demographic(demographic: .shounen, id: "5E05BBF1-A72E-4231-9487-71CFE508F9F9")],
                             volumes: 3,
                             id: 5210,
                             status: .finished,
                             titleJapanese: "STIGMATA 〜赤煉の聖者〜", completeCollection: true, volumesC: [2])
}

