//
//  HomeMapper.swift
//  Koanba
//
//  Created by Carlos Gamaliel on 14/07/23.
//

import Foundation

class HomeMapper {
    
    public static func mapMovieNowPlayingResponseToEntity(movieResponse: [HomepageDataResponse]) -> [HomepageEntity] {
        return movieResponse.map { movie in
            var entity = HomepageEntity()
            entity.id = movie.id
            entity.title = movie.title
            entity.releaseDate = movie.releaseDate
            entity.image = movie.image
            return entity
        }
    }
    
    public static func mapMovieNowPlayingEntityToDomainModel(movieEntity: [HomepageEntity]) -> [HomepageModel] {
        return movieEntity.map { movie in
            var model = HomepageModel()
            model.id = movie.id
            model.image = movie.image
            model.title = movie.title
            model.releaseDate = movie.releaseDate
            return model
        }
    }
}
