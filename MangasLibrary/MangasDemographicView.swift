//
//  MangasDemographicView.swift
//  MangasLibrary
//
//  Created by Yery Castro on 21/3/24.
//

import SwiftUI

struct MangasDemographicView: View {
    @ObservedObject var vm: MangasVM
    @Environment(\.dismiss) var dismiss
    var body: some View {
        List {
            ForEach(Demographics.allCases) { demographic in
                Text(demographic.rawValue)
                    .onTapGesture {
                        vm.demographicSelected = demographic.rawValue
                        dismiss()
                    }
            }
        }
    }
}

#Preview {
    MangasDemographicView(vm: .preview)
}
