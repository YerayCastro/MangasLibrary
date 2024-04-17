//
//  MangasLibraryApp.swift
//  MangasLibrary
//
//  Created by Yery Castro on 19/3/24.
//

import SwiftUI

@main
struct MangasLibraryApp: App {
    @StateObject var vm =  MangasVM()
    
    var body: some Scene {
        WindowGroup {
            MangasMainView()
        }
        .environmentObject(vm)
    }
}
