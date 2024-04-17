//
//  URLRequest.swift
//  MangasLibrary
//
//  Created by Yery Castro on 19/3/24.
//

import SwiftUI

extension URLRequest {
    static func getC(url: URL, page: Int, per: Int = 50, contain: String? = nil) -> URLRequest {
        let page = URLQueryItem(name: "page", value: String(page))
        let per = URLQueryItem(name: "per", value: String(per))
        var request = URLRequest(url: url.appending(path: contain ?? ""))
        request.url?.append(queryItems: [page, per])
        request.httpMethod = "GET"
        request.timeoutInterval = 60
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        return request
    }
    
    static func getGenres(url: URL, genre: Genres) -> URLRequest {
        var request = URLRequest(url: url.appending(path: String(genre.rawValue)))
        request.httpMethod = "GET"
        request.timeoutInterval = 60
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        return request
    }
    
    static func getDemographics(url: URL, demographic: Demographics) -> URLRequest {
        var request = URLRequest(url: url.appending(path: String(demographic.rawValue)))
        request.httpMethod = "GET"
        request.timeoutInterval = 60
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        return request
    }
    
    static func getThemes(url: URL, theme: Themes) -> URLRequest {
        var request = URLRequest(url: url.appending(path: String(theme.rawValue)))
        request.httpMethod = "GET"
        request.timeoutInterval = 60
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        return request
    }
    
    static func getBestMangas(url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.timeoutInterval = 60
        request.timeoutInterval = 60
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        return request
    }
    
    static func getMangasByAuthor(url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.timeoutInterval = 60
        request.timeoutInterval = 60
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        return request
    }
    
    
    static func post<JSON>(url: URL, data: JSON, method: String = "POST") -> URLRequest where JSON: Codable {
        var request = URLRequest(url: url)
        request.timeoutInterval = 60
        request.httpMethod = method
        request.setValue("application/json; charset=utf8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try? JSONEncoder().encode(data)
        return request
    }
}
