//
//  DetailPageResponse.swift
//  Koanba
//
//  Created by Carlos Gamaliel on 15/07/23.
//

import Foundation

struct DetailPageResponse: Codable {
    
    let id: Int
    let backgroundImage: String
    let genres: [GenreResponse]?
    let productions: [ProductionCompaniesResponse]?
    let title: String
    let descriptionMovie: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case backgroundImage = "backdrop_path"
        case genres
        case productions = "production_companies"
        case title = "original_title"
        case descriptionMovie = "overview"
    }
}

struct GenreResponse: Codable {
    let id: Int
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}

struct ProductionCompaniesResponse: Codable {
    let id: Int
    let logoPath: String?
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case logoPath = "logo_path"
        case name
    }
}
