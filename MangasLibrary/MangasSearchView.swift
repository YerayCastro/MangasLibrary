//
//  MangasSearchView.swift
//  MangasLibrary
//
//  Created by Yery Castro on 19/3/24.
//

import SwiftUI

//struct MangasSearchView: View {
//    @State var showThemes = false
//    @State var showGenres = false
//    @State var showDemographic = false
//    @Environment(\.dismiss) var dismiss
//   
//    
//    @ObservedObject var vm: MangasVM
//    var body: some View {
//        NavigationStack {
//            List {
//                ForEach(vm.mangas, id: \.self) { manga in
//                    MangasSearchCellView(mangas: manga,editVM: MangasEditVM(manga: manga))
//                        .onAppear {
//                            vm.siguientePagina(manga: manga)
//                        }
//                }
//            }
//            .sheet(isPresented: $showDemographic, content: {
//                MangasDemographicView(vm: vm)
//            })
//            .sheet(isPresented: $showThemes, content: {
//                MangasThemesView(vm: vm)
//            })
//            .sheet(isPresented: $showGenres, content: {
//                MangasGenresView(vm: vm)
//            })
//            .toolbar {
//                ToolbarItem(placement: .topBarTrailing) {
//                    Menu {
//                        Button {
//                            showThemes.toggle()
//                        } label: {
//                            Label("Themes", systemImage: "book.pages.fill")
//                        }
//                        Button {
//                            showGenres.toggle()
//                        } label: {
//                            Label("Genres", systemImage: "book.fill")
//                        }
//                        Button {
//                            showDemographic.toggle()
//                        } label: {
//                            Label("Demographics", systemImage: "book.circle.fill")
//                        }
//                    } label: {
//                        Label("Filtrar por", systemImage: "line.3.horizontal.decrease.circle.fill")
//                    }
//                }
//            }
//            
//            
//                                
//            }
//            .navigationTitle("Search")
//            .navigationBarTitleDisplayMode(.inline)
//            .searchable(text: $vm.search, placement: .toolbar, prompt: "Busca un manga")
//            .onChange(of: vm.search, {
//                Task {
//                     await vm.buscarMangas()
//                }
//            })
//            .alert("System Alert", isPresented: $vm.showAlert) { } message: {
//                Text(vm.msg)
//            }
//            .deleteAlert(isPresented: $vm.deleteAlert,
//                         msg: vm.msg,
//                         delete: vm.deleteManga)
//            
//        }
//    
//    }
//    
//
//#Preview {
//    NavigationStack {
//        MangasSearchView(vm: .preview)
//    }
//}



//ForEach(Genres.allCases) { genre in
//    Label("\(genre.id)", systemImage: "book")
//}
//ForEach(vm.mangas, id: \.self) { genre in
//    Label("\(genre.title)", systemImage: "book")
//}

//Label("Demographics", systemImage: "book.pages.fill")
//Label("Gendes", systemImage: "folder.fill")
//Label("Themes", systemImage: "folder.fill.badge.person.crop")

//NavigationLink(value: manga) {
//    <#code#>
//}


//Menu {
//    Button {
//        showDemographic.toggle()
//    } label: {
//        Label("Demographics", systemImage: "book.pages.fill")
//    }
//} label: {
//    Label("Demographics", systemImage: "book.pages.fill")
//}
//Menu {
//    Button {
//        showDemographic.toggle()
//    } label: {
//        Label("Gendes", systemImage: "folder.fill")
//    }
//} label: {
//    Label("Gendes", systemImage: "folder.fill")
//}
//Menu {
//    Button {
//        showDemographic.toggle()
//    } label: {
//        Label("Themes", systemImage: "folder.fill.badge.person.crop")
//    }
//} label: {
//    Label("Themes", systemImage: "folder.fill.badge.person.crop")
//}

//ForEach(Genres.allCases){ genre in
//    HStack{
//        Image(systemName: "book")
//        Text(genre.rawValue)
//    }
//        .onTapGesture {
//            vm.genreSelected = genre.rawValue
//            dismiss()
//        }
//}

//List {
//    VStack(alignment: .leading) {
//        Picker("Theme", selection: $selectedTheme) {
//            ForEach(Themes.allCases) { theme in
//                Text(theme.rawValue.capitalized)
//                    
//            }
//        }
//        Picker("Genre", selection: $selectedGenre) {
//            ForEach(Genres.allCases) { genre in
//                Text(genre.rawValue.capitalized)
//                    
//            }
//        }
//        Picker("Demographic", selection: $selectedDemograpgic) {
//            ForEach(Demographics.allCases) { demographic in
//                Text(demographic.rawValue.capitalized)
//                    
//            }
//        }
//
//    }
//    
//}


//ForEach(vm.mangas, id: \.self) { manga in
//    MangasSearchCellView(mangas: manga,editVM: MangasEditVM(manga: manga))
//        .onAppear {
//            vm.siguientePagina(manga: manga)
//        }
//}


struct MangasSearchView: View {
    @EnvironmentObject var vm: MangasVM
    @State var showThemes = false
    @State var showGenres = false
    @State var showDemographic = false
    @State var showBest = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.mangas, id: \.self) { manga in
                    
                    MangasSearchCellView(mangas: manga,editVM: MangasEditVM(manga: manga))
                            .onAppear {
                                vm.siguientePagina(manga: manga)
                            }
                    
                }
            }
            .sheet(isPresented: $showDemographic, content: {
                MangasBestView()
            })
            .sheet(isPresented: $showDemographic, content: {
                MangasDemographicView(vm: vm)
            })
            .sheet(isPresented: $showThemes, content: {
                MangasThemesView(vm: vm)
            })
            .sheet(isPresented: $showGenres, content: {
                MangasGenresView(vm: vm)
            })
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Button {
                            showThemes.toggle()
                        } label: {
                            Label("Themes", systemImage: "book.pages.fill")
                        }
                        Button {
                            showGenres.toggle()
                        } label: {
                            Label("Genres", systemImage: "book.fill")
                        }
                        Button {
                            showDemographic.toggle()
                        } label: {
                            Label("Demographics", systemImage: "book.circle.fill")
                        }
                        Button {
                            showBest.toggle()
                        } label: {
                            Label("Best", systemImage: "book.pages.fill")
                        }
                    } label: {
                        Label("Filtrar por", systemImage: "line.3.horizontal.decrease.circle.fill")
                    }
                }
            }
            .navigationTitle("Mangas")
            .navigationBarTitleDisplayMode(.inline)

            .searchable(text: $vm.search, placement: .toolbar, prompt: "Busca un manga")
            .onChange(of: vm.search) { oldValue, newValue in
                Task {
                     await vm.buscarMangas()
                }
            }
            .alert("System Alert", isPresented: $vm.showAlert) { } message: {
                Text(vm.msg)
            }
            .deleteAlert(isPresented: $vm.deleteAlert,
                         msg: vm.msg,
                         delete: vm.deleteManga)
        }
    }
}


#Preview {
    MangasSearchView()
        .environmentObject(MangasVM.preview)
}



