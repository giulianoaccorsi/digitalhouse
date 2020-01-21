//
//  APIManager.swift
//  NetworkAdvanced
//
//  Created by Giuliano Accorsi on 13/07/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import Foundation
import Alamofire

class APIManager {
    
    typealias completion <T> = (_ result: T, _ failure: NSError?) -> Void
    
    //func getMeme(completion: @escaping ([MemeElement]?,NSError?) -> Void) -> Void{
    func getMeme(completion: @escaping completion<[MemeElement]?>) {
        let url = API.baseURL + API.getMemes
        Alamofire.request(url,
                          method: .get).responseJSON { (response) in
            if response.response?.statusCode == 200 {
                print("Deu certo APIManager --- getMeme  \(response.result.value ?? "nil")")
                
                guard let data = response.data else {
                    completion(nil,NSError())
                    return
                }
                
                let result = try? JSONDecoder().decode(Meme.self, from: data)
                completion(result?.data.memes, nil)
                                
            }
        }
    }
    
    func generateMeme(templateId: String, boxes: [Box], completion: @escaping completion<String?>) {
        
        
        var parameters: Parameters = ["template_id":templateId,
            "username":API.username,
            "password":API.password]
        
        var arrayTextosBox:[String] = []
        for value in boxes {
            arrayTextosBox.append(value.text)
        }
        
        for (index,value) in arrayTextosBox.enumerated() {
            parameters["boxes[\(index)][text]"] = value
        }
        
        
        let url = API.baseURL + API.captionImage
        Alamofire.request(url, method: .post, parameters: parameters).responseJSON { (response) in
            if response.response?.statusCode == 200 {
                print("Deu certo APIManager --- generateCaption  \(response.result.value ?? "nil")")
                
                guard let data = response.data else {
                    completion(nil,NSError())
                    return
                }
                let result = try? JSONDecoder().decode(APIResult.self, from: data)
                completion(result?.data.pageURL,nil)
            }
        }
        
    }
}
