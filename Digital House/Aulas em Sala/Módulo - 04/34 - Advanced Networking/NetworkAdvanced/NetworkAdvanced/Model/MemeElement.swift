//
//  MemeElement.swift
//  NetworkAdvanced
//
//  Created by Giuliano Accorsi on 13/07/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import Foundation

struct MemeElement: Codable {
    let id, name: String
    let url: URL
    let width, height, boxCount: Int
    
    enum CodingKeys: String, CodingKey {
        case id, name, url, width, height
        case boxCount = "box_count"
    }
}
