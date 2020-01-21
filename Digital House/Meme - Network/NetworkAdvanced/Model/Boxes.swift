//
//  Boxes.swift
//  NetworkAdvanced
//
//  Created by Giuliano Accorsi on 16/07/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import Foundation

struct Box: Codable {
    var text: String
}


struct JSON {
    static let encoder = JSONEncoder()
}

extension Encodable {
    subscript(key: String) -> Any? {
        return dictionary[key]
    }
    var dictionary: [String: Any] {
        return (try? JSONSerialization.jsonObject(with: JSON.encoder.encode(self))) as? [String: Any] ?? [:]
    }
}
