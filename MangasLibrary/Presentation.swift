//
//  Presentation.swift
//  MangasLibrary
//
//  Created by Yery Castro on 19/3/24.
//

import SwiftUI


struct Mangas: Codable, Identifiable, Hashable {
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
    let themes: [ThemeP]
    let demographics: [Demographic]
    let volumes: Int?
    let id: Int
    let status: Status
    let titleJapanese: String?
    var readingVolume: Int?
    var completeCollection: Bool
    var volumesC: Set<Int>
    
    var endDateFormatted: String {
        if let endDate {
            return endDate.formatted(date: .numeric, time: .omitted)
        }
        return "No disponible"
    }
    
    var startDateFormatted: String {
        if let startDate {
            return startDate.formatted(date: .numeric, time: .omitted)
        }
        return "No disponible"
    }
    
    var formattedMP: URL? {
        let formattedPURL = mainPicture?.trimmingCharacters(in: CharacterSet(charactersIn: "\""))
        return URL(string: "\(formattedPURL ?? "")")
    }
    
    var formattedURL: URL? {
        let formattedUrl = url?.trimmingCharacters(in: CharacterSet(charactersIn: "\""))
        return URL(string: "\(formattedUrl ?? "")")
    }
    
    var scoreD: String {
        score.formatted(.number.precision(.fractionLength(2)))
    }
    
    var formattedVolumesC: String {
        if !volumesC.isEmpty {
            volumesC.sorted().map(\.description
            ).formatted(.list(type: .and))
        } else {
            "Ninguno"
        }
    }
}
struct ThemeP: Codable, Identifiable, Hashable {
    let id: String
    var theme: Themes
}

extension Mangas {
    var toUpdate: MangasUpdate {
        MangasUpdate(chapters: chapters,
                     score: score,
                     mainPicture: mainPicture,
                     background: background,
                     url: url,
                     endDate: endDate,
                     genres: genres,
                     title: title,
                     titleEnglish: titleEnglish,
                     authors: authors,
                     sypnosis: sypnosis,
                     startDate: startDate,
                     themes: themes,
                     demographics: demographics,
                     volumes: volumes,
                     id: id,
                     status: status,
                     titleJapanese: titleJapanese,
                     completeCollection: completeCollection,
                     readingVolume: readingVolume,
                     volumesC: volumesC)
    }
}
