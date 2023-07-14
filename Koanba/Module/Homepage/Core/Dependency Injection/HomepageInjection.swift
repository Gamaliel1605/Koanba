//
//  HomepageInjection.swift
//  Koanba
//
//  Created by Carlos Gamaliel on 12/07/23.
//

import RealmSwift

final class HomepageInjection {
    
    private func provideHomepageRepository() -> HomepageRepository {
        let realm = try! Realm()
        
        let local = HomepageDefaultLocalDataSource.sharedInstance(realm)
        let remote = HomepageDefaultRemoteDataSource.shared
        
        return HomepageDefaultRepository.sharedInstance(local as! HomepageLocalDataSource , remote as! HomepageRemoteDataSource )
    }
    
    func provideHomepageMovie() -> HomepageUseCase {
        let repository = provideHomepageRepository()
        return HomepageDefaultProtocol(repository: repository)
    }
}
