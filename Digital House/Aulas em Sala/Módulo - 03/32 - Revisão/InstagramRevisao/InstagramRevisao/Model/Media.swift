//
//  Media.swift
//  InstagramRevisao
//
//  Created by Giuliano Accorsi on 02/07/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import Foundation
class Media {
    var title: String?
    var comments: String?
    var image: String?
    
    init(title: String?, comments: String?, image: String?) {
        self.title = title
        self.comments = comments
        self.image = image
    }
}
