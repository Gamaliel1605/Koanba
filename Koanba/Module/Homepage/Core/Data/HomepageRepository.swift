//
//  HomepageRepository.swift
//  Koanba
//
//  Created by Carlos Gamaliel on 12/07/23.
//

import Foundation
import RxSwift

protocol HomepageRepository {
    func getDataNowPlaying() -> Observable<[HomepageModel]>
}

class HomepageDefaultRepository {
    
    typealias instance = (HomepageLocalDataSource, HomepageRemoteDataSource) -> HomepageDefaultRepository
    
    private var remote: HomepageRemoteDataSource
    private var local: HomepageLocalDataSource
    
    private init(remote: HomepageRemoteDataSource, local: HomepageLocalDataSource) {
        self.remote = remote
        self.local = local
    }
    
    static let sharedInstance: instance = { localRepo, remoteRepo in
        return HomepageDefaultRepository(remote: remoteRepo, local: localRepo)
    }
}

extension HomepageDefaultRepository: HomepageRepository {
    func getDataNowPlaying() -> Observable<[HomepageModel]> {
        return self.remote.getDataMovieNowPlaying()
            .map({ response in
                HomeMapper.mapMovieNowPlayingResponseToEntity(movieResponse: response)
            })
            .flatMap { entities in
                self.local.addDataNowPlaying(from: entities)
            }
            .flatMap { _ in
                self.local.getDataNowPlaying()
                    .map { entities in
                        HomeMapper.mapMovieNowPlayingEntityToDomainModel(movieEntity: entities)
                    }
            }
    }
    
}
