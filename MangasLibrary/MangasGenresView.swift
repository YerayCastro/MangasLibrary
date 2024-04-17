//
//  MangasGenresView.swift
//  MangasLibrary
//
//  Created by Yery Castro on 21/3/24.
//

import SwiftUI

struct MangasGenresView: View {
    @ObservedObject var vm: MangasVM
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        List {
            ForEach(Genres.allCases){ genre in
                Text(genre.rawValue)
                    .onTapGesture {
                        vm.genreSelected = genre.rawValue
                        dismiss()
                    }
            }
        }
    }
}

#Preview {
    MangasGenresView(vm: .preview)
}
