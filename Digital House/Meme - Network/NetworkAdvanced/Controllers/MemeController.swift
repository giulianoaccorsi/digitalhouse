//
//  MemeController.swift
//  NetworkAdvanced
//
//  Created by Giuliano Accorsi on 13/07/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

protocol MemeControllerDelegate: class {
    func success()
    func failure()
}

class MemeController {
    
    weak var delegate: MemeControllerDelegate?
    private var arrayMemes:[MemeElement] = []
    
    func arrayMemesCount() -> Int {
        return self.arrayMemes.count
    }
    
    func loadMeme(index: IndexPath) -> MemeElement? {
        if arrayMemes.count <= 0 {
            return nil
        }
        return arrayMemes[index.item]
        
    }
    
    func getMemes() {
        APIManager().getMeme { (arrayMeme, failed) in
            if failed != nil {
                print("Deu ruim ao carregar o arrayMeme -- getMemes()")
            }else {
                print("Array Memes Carregados !!")
                if let jsonMeme =  arrayMeme {
                    self.arrayMemes.append(contentsOf: jsonMeme)
                    self.delegate?.success()
                }
            }
        }
    }
    
    
    func generateMeme(templateId: String, arrayBox: [Box], completion: @escaping (Bool)->Void) {

        APIManager().generateMeme(templateId: templateId, boxes: arrayBox) { (pageUrl, error) in
            if error == nil {
                print("deu bom !!! ao criar -- generateMeme")
                print(pageUrl)
                completion(true)
            }else {
                print("Deu ruim -- generateMeme")
                completion(false)
            }
        }
    }
    
    func getAllTextFields(textfields: [UITextField]) -> [Box] {
        var arrayText:[Box] = []
        for value in textfields {
            
            arrayText.append(Box(text: value.text ?? ""))
            
        }
        return arrayText
    }
}
