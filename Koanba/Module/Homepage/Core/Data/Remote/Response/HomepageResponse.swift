//
//  HomepageResponse.swift
//  Koanba
//
//  Created by Carlos Gamaliel on 14/07/23.
//

import Foundation

struct HomepageResponse: Codable {
    var page: Int?
    let results: [HomepageDataResponse]
}

struct HomepageDataResponse: Codable {
    let id: Int
    let releaseDate: String
    let title: String
    let image: String
    let genreID: [Int]
    
    enum CodingKeys: String, CodingKey {
        case id,title
        case releaseDate = "release_date"
        case image = "poster_path"
        case genreID = "genre_ids"
    }
}
