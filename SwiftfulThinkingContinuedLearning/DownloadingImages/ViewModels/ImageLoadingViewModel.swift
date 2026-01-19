//
//  ImageLoadingViewModel.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by MacMini A6 on 19/1/26.
//

import Foundation
import SwiftUI
internal import Combine

class ImageLoadingViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
//    let manager = PhotoModelCacheManager.instance
    let manager = PhotoModelFileManager.instance
    let urlString: String
    
    var cancellabels = Set<AnyCancellable>()
    let imageKey: String
    
    init(url: String, key: String) {
        urlString = url
        imageKey = key
        getImage()
    }
    
    func getImage() {
        if let savedImage = manager.get(key: imageKey) {
            image = savedImage
            print("Getting saved image!")
        } else {
            downloadImage()
            print("Downloading image now..")
        }
    }
    
    func downloadImage() {
        print("Downloading image now..")
        isLoading = true
        guard let url = URL(string: urlString) else {
            isLoading = false
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map {
                UIImage(data: $0.data)
            }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.isLoading = false
            } receiveValue: { [weak self] returnedImage in
                guard
                    let self,
                    let image = returnedImage else {
                    return
                }
                
                self.image = returnedImage
                self.manager.add(key: self.imageKey, value: image)
            }
            .store(in: &cancellabels)
    }
}
