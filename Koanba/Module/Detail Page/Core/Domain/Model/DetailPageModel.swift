//
//  DetailPageModel.swift
//  Koanba
//
//  Created by Carlos Gamaliel on 12/07/23.
//

import Foundation

struct DetailPageModel {
    
    var id: Int?
    var backgroundImage: String?
    var genres: [GenreModel] = []
    var productions: [ProductionCompaniesModel] = []
    var title: String?
    var descriptionMovie: String?
}
