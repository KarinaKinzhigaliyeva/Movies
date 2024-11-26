//
//  MovieItem.swift
//  Movies
//
//  Created by Karina Kinzhigaliyeva on 23.11.2024.
//

import Foundation
import SwiftyJSON

struct Movie {
    var title = ""
    var type = ""
    var year = ""
    var poster: String?
    
    init(json: JSON) {
           self.title = json["Title"].stringValue
           self.year = json["Year"].stringValue
           self.type = json["Type"].stringValue
           self.poster = json["Poster"].stringValue
       }
    
}
