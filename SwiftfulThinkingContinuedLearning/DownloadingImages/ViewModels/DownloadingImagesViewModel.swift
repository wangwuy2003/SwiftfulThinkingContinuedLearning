//
//  DownloadingImagesViewModel.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by MacMini A6 on 19/1/26.
//

import Foundation
internal import Combine

class DownloadingImagesViewModel: ObservableObject {
    @Published var dataArray: [PhotoModel] = []
    
    let dataService = PhotoModelDataService.instance
    
    var cancellabels = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        dataService.$photoModels
            .sink { [weak self] returnedPhotoModels in
                self?.dataArray = returnedPhotoModels
            }
            .store(in: &cancellabels)
    }
}
