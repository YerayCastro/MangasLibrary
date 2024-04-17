//
//  MangasSearchCellView.swift
//  MangasLibrary
//
//  Created by Yery Castro on 20/3/24.
//

import SwiftUI

struct MangasSearchCellView: View {
    @EnvironmentObject var vm: MangasVM
    let mangas: Mangas
    @Environment(\.dismiss) var dismiss
    @ObservedObject var editVM: MangasEditVM
    
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                AsyncImage(url: editVM.manga.formattedMP) { image  in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80)
                        .clipShape(Circle())
                } placeholder: {
                    Image(systemName: "book")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80)
                        .clipShape(Circle())
                }
                VStack(alignment: .leading) {
                    Text(mangas.title)
                        .font(.headline)
                        .bold()
                    ForEach(editVM.manga.authors, id: \.id) { author in
                        Text("\(author.firstName) \(author.lastName)")
                            .foregroundStyle(.secondary)
                    
                    }
                }
            }
        }

    }
}
#Preview {
    MangasSearchCellView(mangas: .test, editVM: MangasEditVM(manga: .test))
        .environmentObject(MangasVM.preview)
}
