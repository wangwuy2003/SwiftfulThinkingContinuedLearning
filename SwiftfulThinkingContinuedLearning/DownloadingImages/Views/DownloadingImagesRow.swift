//
//  DownloadingImagesRow.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by MacMini A6 on 19/1/26.
//

import SwiftUI

struct DownloadingImagesRow: View {
    let model: PhotoModel
    
    var body: some View {
        HStack {
            DownloadingImageView(url: model.url, key: "\(model.id)")
//            Circle()
//                .frame(width: 75, height: 75)
            
            VStack(alignment: .leading) {
                Text(model.title)
                    .font(.headline)
                Text(model.url)
                    .foregroundStyle(.gray)
                    .italic()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    DownloadingImagesRow(model: PhotoModel(albumId: 1, id: 1, title: "Heloo", url: "https://dummyjson.com/image/150", thumbnailUrl: "thumbnailurl here"))
}
