//
//  DeleteAlert.swift
//  MangasLibrary
//
//  Created by Yery Castro on 19/3/24.
//

import SwiftUI

struct DeleteAlert: ViewModifier {
    @Binding var isPresented: Bool
    let msg: String
    let delete: () -> Void
    
    func body(content: Content) -> some View {
        content
            .alert("Validation Alert", isPresented: $isPresented) {
                Button(role: .destructive) {
                    delete()
                } label: {
                    Text("Borrar")
                }
                Button(role: .cancel) {} label: {
                    Text("Cancelar")
                }
            } message: {
                Text(msg)
            }
    }
}

extension View {
    func deleteAlert(isPresented: Binding<Bool>, msg: String, delete: @escaping () -> Void) -> some View {
        modifier(DeleteAlert(isPresented: isPresented, msg: msg, delete: delete))
    }
}
