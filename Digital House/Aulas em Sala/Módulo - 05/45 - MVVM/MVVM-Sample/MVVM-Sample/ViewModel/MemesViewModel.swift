//
//  MemesViewModel.swift
//  MVVM-Sample
//
//  Created by Giuliano Accorsi on 13/08/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import Foundation
class MemesViewModel {
    let memesApi: MemesAPI = MemesAPI()
    var arrayMeme: [MemeElement]?
    
    var titlePage: String {
        return "Meme Page"
    }
    
    var titleBtnPost: String {
        return "Post"
    }
    
    var titleBottomText: String {
        return "Tela Pagina Meme"
    }
    
    func getMeme(completion: @escaping (Bool) -> Void) {
        memesApi.getMeme { (listMeme, success) in
            if success {
                self.arrayMeme = listMeme
                completion(true)
                return
            }else {
                completion(false)
            }
        }
    }
    
    func getCurrentMeme(currentObject: Int) -> MemeElement {
        if let array = arrayMeme {
            return array[currentObject]
        }else {
            return MemeElement(id: "", name: "", url: "", width: 0, height: 0, boxCount: 0)
        }
    }
    
    func numberOfRow() -> Int {
        return arrayMeme?.count ?? 0
    }
}
