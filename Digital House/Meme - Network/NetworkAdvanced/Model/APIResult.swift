//
//  APIResult.swift
//  NetworkAdvanced
//
//  Created by Giuliano Accorsi on 15/07/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import Foundation

// MARK: - Meme
struct APIResult: Codable {
    let success: Bool
    let data: UrlResult
}


struct UrlResult: Codable {
    let url: String
    let pageURL: String
    
    enum CodingKeys: String, CodingKey {
        case url
        case pageURL = "page_url"
    }
}
