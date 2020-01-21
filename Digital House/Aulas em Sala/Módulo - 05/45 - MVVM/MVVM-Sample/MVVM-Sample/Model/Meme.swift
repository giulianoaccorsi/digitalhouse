//
//  Meme.swift
//  MVVM-Sample
//
//  Created by Giuliano Accorsi on 13/08/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import Foundation

// MARK: - Filmes
struct Meme: Codable {
    let success: Bool
    let data: DataMeme
}

// MARK: - DataClass
struct DataMeme: Codable {
    let memes: [MemeElement]
}

// MARK: - Meme
struct MemeElement: Codable {
    let id, name: String
    let url: String
    let width, height, boxCount: Int
    
    enum CodingKeys: String, CodingKey {
        case id, name, url, width, height
        case boxCount = "box_count"
    }
}
