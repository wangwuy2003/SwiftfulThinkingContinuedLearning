//
//  DownloadingImageView.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by MacMini A6 on 19/1/26.
//

import SwiftUI

struct DownloadingImageView: View {
    @StateObject var loader: ImageLoadingViewModel
    
    init(url: String, key: String) {
        _loader = StateObject(wrappedValue: ImageLoadingViewModel(url: url, key: key))
    }
    
    var body: some View {
        ZStack {
            if loader.isLoading {
                ProgressView()
            } else if let image = loader.image {
                Image(uiImage: image)
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 75, height: 75)
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    DownloadingImageView(url: "https://dummyjson.com/image/150", key: "1")
}
