//
//  Model.swift
//  MangasLibrary
//
//  Created by Yery Castro on 19/3/24.
//

import Foundation

enum Demographics: String, Codable, CaseIterable, Identifiable {
    case seinen = "Seinen"
    case shounen = "Shounen"
    case shoujo = "Shoujo"
    case josei = "Josei"
    case kids = "Kids"
    
    var id: Self { self }
}

enum Genres: String, Codable, CaseIterable, Identifiable {
    case action = "Action"
    case adventure = "Adventure"
    case awardWinning = "Award Winning"
    case drama = "Drama"
    case fantasy = "Fantasy"
    case horror = "Horror"
    case supernatural = "Supernatural"
    case mystery = "Mystery"
    case sliceOfLive = "Slice of Life"
    case comedy = "Comedy"
    case sciFi = "Sci-Fi"
    case suspense = "Suspense"
    case sports = "Sports"
    case ecchi = "Ecchi"
    case romance = "Romance"
    case girlsLove = "Girls Love"
    case boysLove = "Boys Love"
    case gourmet = "Gourmet"
    case erotica = "Erotica"
    case hentai = "Hentai"
    case avantGarde = "Avant Garde"
    
    var id: Self { self }
}

enum Themes: String, Codable, CaseIterable, Identifiable {
        case gore = "Gore"
        case military = "Military"
        case mythology = "Mythology"
        case psychological = "Psychological"
        case historical = "Historical"
        case samurai = "Samurai"
        case romanticSubtext = "Romantic Subtext"
        case school = "School"
        case adultCast = "Adult Cast"
        case parody = "Parody"
        case superPower = "Super Power"
        case teamSports = "Team Sports"
        case delinquents = "Delinquents"
        case workplace = "Workplace"
        case survival = "Survival"
        case childcare = "Childcare"
        case iyashikei = "Iyashikei"
        case reincarnation = "Reincarnation"
        case showbiz = "Showbiz"
        case anthropomorphic = "Anthropomorphic"
        case lovePolygon = "Love Polygon"
        case music = "Music"
        case mecha = "Mecha"
        case combatSports = "Combat Sports"
        case isekai = "Isekai"
        case gagHumor = "Gag Humor"
        case crossdressing = "Crossdressing"
        case reverseHarem = "Reverse Harem"
        case martialArts = "Martial Arts"
        case visualArts = "Visual Arts"
        case harem = "Harem"
        case otakuCulture = "Otaku Culture"
        case timeTravel = "Time Travel"
        case videGame = "Video Game"
        case strategyGame = "Strategy Game"
        case vampire = "Vampire"
        case mahouShoujo = "Mahou Shoujo"
        case highStakesGame = "High Stakes Game"
        case cgdct = "CGDCT"
        case organizedCrime = "Organized Crime"
        case detective = "Detective"
        case performingArts = "Performing Arts"
        case medical = "Medical"
        case space = "Space"
        case memoir = "Memoir"
        case villainess = "Villainess"
        case racing = "Racing"
        case pets = "Pets"
        case magicalSexShift = "Magical Sex Shift"
        case educational = "Educational"
        case idolsFemale = "Idols (Female)"
        case idolsMale = "Idols (Male)"
    
    var id: Self { self }
}

enum Role: String, Codable, CaseIterable, Identifiable {
    case art = "Art"
    case story = "Story"
    case storyArt = "Story & Art"
    
    var id: Self { self }
}

enum Status: String, Codable, CaseIterable, Identifiable {
    case currentlyPublishing = "currently_publishing"
    case finished = "finished"
    case onHiatus = "on_hiatus"
    case discontinued = "discontinued"

    var id: Self { self }
}




