//
//  DataProviderHomePage.swift
//  InstagramRevisao
//
//  Created by Giuliano Accorsi on 02/07/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import Foundation

protocol HomePageDataProviderDelegate: class {
    func success()
    func failure()
}

class HomePageDataProvider {
    weak var delegate: HomePageDataProviderDelegate?
    private var arrayMedia: [Media] = []
    
    func numberOfRows()-> Int {
        return arrayMedia.count
    }
    
    func addMedia(media: Media) {
        arrayMedia.append(media)
        self.delegate?.success()
    }
    
    func getMovie(index: IndexPath) -> Media {
        return arrayMedia[index.item]
    }
    
    
}
