//
//  MangasBestView.swift
//  MangasLibrary
//
//  Created by Yery Castro on 22/3/24.
//

import SwiftUI

struct MangasBestView: View {
    @EnvironmentObject var vm: MangasVM

    var body: some View {
        List {
            ForEach(vm.sortMangasByScore(mangas: vm.mangas)) { best in
                HStack{
                    Text(best.title)
                        .font(.subheadline)
                        .bold()
                    Spacer()
                    Text(best.scoreD)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    Image(systemName: "star.fill")
                        .foregroundStyle(.yellow)
                }
                    
            }
        }
    }
}

#Preview {
    MangasBestView()
        .environmentObject(MangasVM.preview)
}
