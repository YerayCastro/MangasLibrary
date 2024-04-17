//
//  MangasDetailCell.swift
//  MangasLibrary
//
//  Created by Yery Castro on 20/3/24.
//

import SwiftUI

struct MangasDetailCellView: View {
    let image: String
    let label: String
    let value: String
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            Image(systemName: image)
            LabeledContent(label, value: value)
        }
        .padding()
    }
}

#Preview {
    MangasDetailCellView(image: "book", label: "Tomos Comprados", value: "2")
}
