//
//  HomepageModel.swift
//  Koanba
//
//  Created by Carlos Gamaliel on 12/07/23.
//

import Foundation

struct HomepageModel {
    
    var id: Int?
    var releaseDate: String?
    var title: String?
    var image: String?
    var genreID: [GenreID] = []
    
}

struct GenreID {
    var id: Int?
}
