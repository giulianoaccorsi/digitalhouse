//
//  MovieAPIStore.swift
//  MovieAlamoFire
//
//  Created by Giuliano Accorsi on 24/06/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import Foundation
import Alamofire

class MovieAPIStore {
    
    typealias completion <T> = (_ result: T, _ failure: NSError?) -> Void
    
    
    
    private func dicParameter(dic: [String:Any]? ) -> Parameters {
        let defaultParameters: Parameters = ["api_key": API.apiKey, "language":"pt-BR"]
        if var parameters = dic {
            parameters["api_key"] = API.apiKey
            return parameters
        }
        return  defaultParameters
    }
    
    
    func searchMovie(searchValue: String, completion: @escaping completion<[Movie]?>) {
        let searchParameters:[String:Any] = ["query":searchValue]
        let url = API.baseURL + API.search + API.movie
        
        Alamofire.request(url,
                          method: .get,
                          parameters: dicParameter(dic: searchParameters),
                          encoding: URLEncoding(destination: .queryString)).responseJSON { (response) in
                            if response.response?.statusCode == 200 {
                                print("Deu certo MovieAPIStore --- searchMovies  \(response.result.value ?? "nil")")
                                
                                guard let json = response.result.value as? NSDictionary else {
                                    completion(nil, NSError())
                                    return
                                }
                                
                                let arrayObtido:[[String:Any]] = json.object(forKey: "results") as! [[String:Any]]
                                var arrayMovies:[Movie] = []
                                for value in arrayObtido {
                                    let movieObtido = Movie(dic: value)
                                    arrayMovies.append(movieObtido)
                                }
                                
                                completion(arrayMovies, nil)
                                
                                
                            }
        }
        
        
    }
    
    
    
    func getMovies(completion: @escaping completion< [Movie]? >) {
        
        let url = API.baseURL + API.movie + API.popular
        
        
        Alamofire.request(url,
                          method: .get,
                          parameters: dicParameter(dic: nil),
                          encoding: URLEncoding(destination: .queryString)).responseJSON { (response) in
                            
                            
                            
                            if response.response?.statusCode == 200 {
                                
                                print("Deu certo MovieAPIStore --- getMovies  \(response.result.value ?? "nil")")
                                
                                
                                guard let json = response.result.value as? NSDictionary else {
                                    
                                    completion(nil,NSError())
                                    
                                    return
                                }
                                
                                let _modelArray: [[String:Any]] = json.object(forKey: "results") as! [[String:Any]]
                                
                                var arrayMovies: [Movie] = []
                                
                                for value in _modelArray {
                                    
                                    let _movie = Movie(dic: value)
                                    
                                    arrayMovies.append(_movie)
                                }
                                
                                completion(arrayMovies, nil)
                                
                                
                            }
                            
        }
        
        
        
        
    }
}
