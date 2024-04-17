//
//  MangasDetailView.swift
//  MangasLibrary
//
//  Created by Yery Castro on 19/3/24.
//

import SwiftUI

struct MangasDetailView: View {
    @EnvironmentObject var vm: MangasVM
    @ObservedObject var editVM: MangasEditVM
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        let themeNames = editVM.manga.themes.map { $0.theme.rawValue }.joined(separator: ", ")
        let genreNames = editVM.manga.genres.map { $0.genre.rawValue }.joined(separator: ", ")
        
        ScrollView {
            VStack {
                AsyncImage(url: editVM.manga.formattedMP) { image  in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                } placeholder: {
                    Image(systemName: "book")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300)
                }
                MangasDetailCellView(image: "books.vertical.fill", label: "Complete colection", value: "\(editVM.manga.completeCollection)")
                MangasDetailCellView(image: "book.fill", label: "Seals volumes", value: editVM.manga.formattedVolumesC)
                MangasDetailCellView(image: "book.closed.fill", label: "Volumes", value: "\(editVM.manga.volumes ?? 0)")
                MangasDetailCellView(image: "bookmark.fill", label: "Reading volumes", value: "\(editVM.manga.readingVolume ?? 0)")
                MangasDetailCellView(image: "character.book.closed.fill", label: "Title", value: editVM.manga.title)
                MangasDetailCellView(image: "character.book.closed.fill.ja", label: "Japanese title", value: editVM.manga.titleJapanese ?? "")
                MangasDetailCellView(image: "text.book.closed.fill", label: "English title", value: editVM.manga.titleEnglish ?? "")
                ForEach(editVM.manga.authors, id: \.id) { author in
                    MangasDetailCellView(image: "person.fill", label: "Authors",value: "\(author.firstName) \(author.lastName)")
                    MangasDetailCellView(image: "figure.arms.open", label: "Role",value: "\(author.role)")
                }
                ForEach(editVM.manga.demographics, id: \.id) { demographic in
                    MangasDetailCellView(image: "book.pages.fill", label: "Demographics",value: "\(demographic.demographic)")
                }
                MangasDetailCellView(image: "folder.fill", label: "Gender",value: genreNames)
                MangasDetailCellView(image: "folder.fill.badge.person.crop", label: "Theme",value: themeNames)
                MangasDetailCellView(image: "list.number.rtl", label: "Chapters",value: "\(editVM.manga.chapters ?? 0)")
                MangasDetailCellView(image: "questionmark.folder.fill", label: "Status",value: "\(editVM.manga.status)")
                MangasDetailCellView(image: "calendar.badge.clock", label: "Start date",value: editVM.manga.startDateFormatted)
                MangasDetailCellView(image: "calendar.badge.clock.rtl", label: "End date",value: editVM.manga.endDateFormatted)
                MangasDetailCell2View(image: "books.vertical.circle.fill", label: "Synopsis",value: editVM.manga.sypnosis ?? "No hay Background")
                MangasDetailCell2View(image: "book.circle.fill", label: "Background",value: editVM.manga.background ?? "No hay Background")
            }
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        MangasDetailView(editVM: MangasEditVM(manga: .test))
            .environmentObject(MangasVM.preview)
    }
}



//.onChange(of: vm.search, {
//    Task {
//         await vm.buscarMangas()
//    }
