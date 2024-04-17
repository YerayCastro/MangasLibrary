//
//  ContentView.swift
//  MangasLibrary
//
//  Created by Yery Castro on 19/3/24.
//

import SwiftUI

struct MangasView: View {
    @EnvironmentObject var vm: MangasVM
    let item = GridItem(.adaptive(minimum: 150))
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [item]) {
                    ForEach(vm.mangas, id: \.self) { manga in
                        NavigationLink(value: manga){
                            CardView(mangas: manga, delete: vm.deleteMangaAlert)
                        }
                        .onAppear {
                            vm.siguientePagina(manga: manga)
                        }
                    }
                    
                }
                .navigationDestination(for: Mangas.self, destination: { manga in
                    MangasEditView(editVM: MangasEditVM(manga: manga))
                })
            }
        }
        .navigationTitle("Mangas")
        .navigationBarTitleDisplayMode(.inline)
        
        .alert("System Alert", isPresented: $vm.showAlert) { } message: {
            Text(vm.msg)
        }
        .deleteAlert(isPresented: $vm.deleteAlert,
                     msg: vm.msg,
                     delete: vm.deleteManga)
        
    }
}

#Preview {
    NavigationStack {
        MangasView()
            .environmentObject(MangasVM.preview)
    }
}
