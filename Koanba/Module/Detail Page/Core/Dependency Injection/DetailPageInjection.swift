//
//  DetailPageInjection.swift
//  Koanba
//
//  Created by Carlos Gamaliel on 12/07/23.
//

import Foundation
import RealmSwift

class DetailPageInjcetion {
    
    private func provideDetailPageRepository() -> DetailPageRepository {
        let realm = try! Realm()
        
        let local = DetailPageDefaultLocalDataSource.sharedInstance(realm)
        let remote = DetailPageDefaultRemoteDataSource.shared
        
        return DetailPageDefaultRepository.sharedInstance(local, remote)
    }
    
    func provideMovieDetail() -> DetailPageUseCase {
        let repository = provideDetailPageRepository()
        return DetailPageDefaultProtocol(repository: repository)
    }
}
