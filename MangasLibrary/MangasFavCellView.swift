//
//  MangasFavCellView.swift
//  MangasLibrary
//
//  Created by Yery Castro on 19/3/24.
//

import SwiftUI

struct MangasFavCellView: View {
    @EnvironmentObject var vm: MangasVM
    let mangas: Mangas
    @Environment(\.dismiss) var dismiss
    @ObservedObject var editVM: MangasEditVM
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(mangas.title)
                    .font(.headline)
                    .bold()
                Image(systemName: "star.fill")
                    .font(.headline)
                    .foregroundStyle(.yellow)
                
            }
            Text(mangas.titleJapanese ?? "")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .swipeActions {
            Button {
                Task {
                    vm.removeFromFavorites(mangaToRemove: mangas)
                }
            } label: {
                Image(systemName: "xmark")
                    .font(.headline)
                    .symbolVariant(.fill)
                    .symbolVariant(.circle)
                    .foregroundStyle(.red)
                    .tint(.red)
            }
        }
    }
}

#Preview {
    MangasFavCellView(mangas: .test, editVM: MangasEditVM(manga: .test))
        .environmentObject(MangasVM.preview)
}



