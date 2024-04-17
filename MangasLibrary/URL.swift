//
//  URL.swift
//  MangasLibrary
//
//  Created by Yery Castro on 19/3/24.
//

import SwiftUI

let url = URL(string: "https://mymanga-acacademy-5607149ebe3d.herokuapp.com/")!

extension URL {
    static let urlManga = url.appending(path: "list/mangas")
    static let containsManga = url.appending(path: "search/mangasContains")
    static let urlGenres = url.appending(path: "list/mangaByGenre")
    static let urlDemographic = url.appending(path: "list/mangaByDemographic")
    static let urlTheme = url.appending(path: "list/mangaByTheme")
    static let manga = url.appending(path: "/mangas")
    static let bestMangas = url.appending(path: "bestMangas")
    
}
