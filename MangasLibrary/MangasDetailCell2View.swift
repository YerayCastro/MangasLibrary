//
//  MangasDetailCell2View.swift
//  MangasLibrary
//
//  Created by Yery Castro on 20/3/24.
//

import SwiftUI

struct MangasDetailCell2View: View {
    let image: String
    let label: String
    let value: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .firstTextBaseline){
                Image(systemName: image)
                Text(label)
                Spacer()
                Text(value)
                    .foregroundStyle(.secondary)
            }
            .padding()
        }
    }
}

#Preview {
    MangasDetailCell2View(image: "book", label: "Title", value: "One piece")
}
