//
//  MemesAPI.swift
//  MVVM-Sample
//
//  Created by Giuliano Accorsi on 13/08/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import Foundation
import Alamofire

class MemesAPI {
    func getMeme(completion: @escaping ([MemeElement]?,Bool) -> Void) {
        
        let url = "https://api.imgflip.com/get_memes"
        Alamofire.request(url, method: .get).responseJSON { (response) in
            if response.response?.statusCode == 200 {
                guard let data = response.data else {
                    completion(nil,false)
                    return
                }
                do {
                    let result = try JSONDecoder().decode(Meme.self, from: data)
                    completion(result.data.memes,true)
                    return
                }catch {
                    completion(nil,false)
                }
            }
        }
    }
}
