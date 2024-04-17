//
//  Model.swift
//  MangasLibrary
//
//  Created by Yery Castro on 19/3/24.
//

import SwiftUI

struct DTOMangas: Codable {
    let metadata: Metadata
    let items: [Items]
}

struct Metadata: Codable {
    let per: Int
    let total: Int
    let page: Int
}

struct Items: Codable {
    let chapters: Int?
    let score: Double
    let mainPicture: String?
    let background: String?
    let url: String?
    let endDate: Date?
    let genres: [Genre]
    let title: String
    let titleEnglish: String?
    let authors: [Author]
    let sypnosis: String?
    let startDate: Date?
    let themes: [Theme]
    let demographics: [Demographic]
    let volumes: Int?
    let id: Int
    let status: Status
    let titleJapanese: String?
    var volumesC: Set<Int>?
    var readingVolume: Int?
}

struct Author: Codable, Hashable, Identifiable {
    var firstName: String
    var lastName: String
    let id: String
    var role: Role
}

struct Theme: Codable, Hashable {
    let id: String
    var theme: Themes
}

struct Demographic: Codable, Hashable {
    var demographic: Demographics
    let id: String
}

struct Genre: Codable, Hashable {
    let id: String
    let genre: Genres
}

extension Items {
    var toPresentation: Mangas {
        Mangas(chapters: chapters, score: score, mainPicture: mainPicture, background: background, url: url, endDate: endDate, genres: genres, title: title, titleEnglish: titleEnglish, authors: authors, sypnosis: sypnosis, startDate: startDate, themes: themes.map(\.toPresenttion), demographics: demographics, volumes: volumes, id: id, status: status, titleJapanese: titleJapanese, /*volumesOwned:[1],*/ readingVolume: readingVolume, completeCollection: true, volumesC: volumesC ?? [])
    }
}

extension Theme {
    var toPresenttion: ThemeP {
        ThemeP(id: id, theme: theme)
    }
}

struct MangasUpdate: Codable {
    let chapters: Int?
    let score: Double?
    let mainPicture: String?
    let background: String?
    let url: String?
    let endDate: Date?
    let genres: [Genre]
    let title: String?
    let titleEnglish: String?
    let authors: [Author]?
    let sypnosis: String?
    let startDate: Date?
    let themes: [ThemeP]?
    let demographics: [Demographic]?
    let volumes: Int?
    let id: Int
    let status: Status?
    let titleJapanese: String?
    var completeCollection: Bool?
    var readingVolume: Int?
    var volumesC: Set<Int>
}
