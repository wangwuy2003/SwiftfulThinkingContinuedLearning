//
//  DownloadingImagesBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by MacMini A6 on 19/1/26.
//

import SwiftUI

// Codable
// background threads
// weak self
// combine
// Publishers & Subscribers
// FileManager
// NSCache

struct DownloadingImagesBootcamp: View {
    @StateObject var vm = DownloadingImagesViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.dataArray) { model in
                    DownloadingImagesRow(model: model)
                }
            }
            .navigationTitle("Downloading Images!")
        }
    }
}

#Preview {
    DownloadingImagesBootcamp()
}
