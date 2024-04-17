//
//  CardView.swift
//  MangasLibrary
//
//  Created by Yery Castro on 19/3/24.
//

import SwiftUI

struct CardView: View {
    let mangas: Mangas
    let delete: (Mangas) -> ()
    
    var body: some View {
                AsyncImage(url: mangas.formattedMP) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white.opacity(0.7))
                            .frame(width: 150, height: 40)
                            .padding(.bottom, 190)
                        Text(mangas.title)
                            .font(.subheadline)
                            .bold()
                            .padding(.bottom, 185)
                            
                    }
                } placeholder: {
                    Image(systemName: "book")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white.opacity(0.7))
                            .frame(width: 150, height: 40)
                            .padding(.bottom, 190)
                        Text(mangas.title)
                            .font(.subheadline)
                            .bold()
                            .padding(.bottom, 185)
                    }
                }
            
    }
}

#Preview {
    CardView(mangas: .test, delete: { _ in })
}
