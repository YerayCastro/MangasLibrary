//
//  MangasThemesView.swift
//  MangasLibrary
//
//  Created by Yery Castro on 21/3/24.
//

import SwiftUI

struct MangasThemesView: View {
    @ObservedObject var vm: MangasVM
    @Environment(\.dismiss) var dismiss
    var body: some View {
        List {
            ForEach(Themes.allCases){ theme in
                Text(theme.rawValue)
                    .onTapGesture {
                        vm.selectedTheme = theme.rawValue
                        dismiss()
                    }
            }
        }
    }
}

#Preview {
    MangasThemesView(vm: .preview)
}
