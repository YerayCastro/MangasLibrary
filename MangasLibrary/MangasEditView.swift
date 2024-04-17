//
//  MangasEditView.swift
//  MangasLibrary
//
//  Created by Yery Castro on 19/3/24.
//

import SwiftUI

struct MangasEditView: View {
    @EnvironmentObject var vm: MangasVM
    @ObservedObject var editVM: MangasEditVM
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
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
                Toggle("Colección completa: ", isOn: $editVM.manga.completeCollection)
                if let volumenes = editVM.manga.volumes, volumenes > 0 {
                    MultiplePicker(selection: $editVM.manga.volumesC, label: Text("Volumenes comprados"), values: Array(1...volumenes))
                    HStack{
                        Text("Leyendo el tomo")
                        Spacer()
                        Picker("Leyendo el tomo: ", selection: $editVM.manga.readingVolume) {
                            Text("Ninguno").tag(Int?.none)
                            ForEach(1...volumenes, id: \.self) { volumenR in
                                Text("\(volumenR)").tag(Optional(volumenR))
                            }
                        }
                    }
                    
                    .pickerStyle(.menu)
                }
            }
            .navigationTitle("Edit")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        vm.updateMangaArray(manga: editVM.manga)
                        vm.addToFavorites(manga: editVM.manga)
                        dismiss()
                    } label: {
                        Label("Guardar", systemImage: "plus.circle.fill")
                    }
                }
            }
        }
    }
}
#Preview {
    NavigationStack {
        MangasEditView(editVM: MangasEditVM(manga: .test))
            .environmentObject(MangasVM.preview)
    }
}

