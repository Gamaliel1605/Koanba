//
//  DetailPageMapper.swift
//  Koanba
//
//  Created by Carlos Gamaliel on 15/07/23.
//

import Foundation

class DetailPageMapper {
    
    static func mapMovieDetailResponseToEntity(movieResponse: DetailPageResponse) -> DetailPageEntity {
        let entity = DetailPageEntity()
        entity.id = movieResponse.id
        entity.backgroundImage = movieResponse.backgroundImage
        movieResponse.genres?.forEach { genres in
            let genreEntity = GenreEntity()
            genreEntity.id = genres.id
            genreEntity.name = genres.name
            entity.genres.append(genreEntity)
        }
        movieResponse.productions?.forEach { productionCompanies in
            let productionsEntity = ProductionCompaniesEntity()
            productionsEntity.id = productionCompanies.id
            productionsEntity.logo_path = productionCompanies.logoPath ?? ""
            productionsEntity.name = productionCompanies.name
            entity.productions.append(productionsEntity)
        }
        entity.title = movieResponse.title
        entity.descriptionMovie = movieResponse.descriptionMovie
        
        return entity
    }
    
    static func mapMovieDetailEntityToDomainModel(movieEntity: DetailPageEntity) -> DetailPageModel {
        var model = DetailPageModel()
        model.id = movieEntity.id
        model.backgroundImage = movieEntity.backgroundImage
        movieEntity.genres.forEach { genres in
            var genreModel = GenreModel()
            genreModel.id = genres.id
            genreModel.name = genres.name
            model.genres.append(genreModel)
        }
        movieEntity.productions.forEach { productionCompanies in
            var productionsModel = ProductionCompaniesModel()
            productionsModel.id = productionCompanies.id
            productionsModel.logo_path = productionCompanies.logo_path
            productionsModel.name = productionCompanies.name
            model.productions.append(productionsModel)
        }
        model.title = movieEntity.title
        model.descriptionMovie = movieEntity.descriptionMovie
        
        return model
    }
}
