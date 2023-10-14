//
//  AlbumView.swift
//  Lorem Picsum
//
//  Created by Vito Borghi on 14/10/2023.
//
import SwiftData
import SwiftUI

struct AlbumView: View {
    @Query var gallery: [RandyRandyPic]
    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        LazyVGrid(columns: columns, content: {
            ForEach (gallery, id: \.self) {randyrandom in
                if let uiImage = UIImage(data: randyrandom.image) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFill()
                }
            }
        })
    }
}

#Preview {
    AlbumView()
        .modelContainer(for: RandyRandyPic.self)
}
