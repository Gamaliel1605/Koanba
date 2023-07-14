//
//  HomepageInteractor.swift
//  Koanba
//
//  Created by Carlos Gamaliel on 12/07/23.
//

import Foundation
import RxSwift

protocol HomepageUseCase {
    func getMovieData() -> Observable<[HomepageModel]>
}

class HomepageDefaultProtocol: HomepageUseCase {
    
    private let repository: HomepageRepository
    
    init(repository: HomepageRepository) {
        self.repository = repository
    }
    
    func getMovieData() -> Observable<[HomepageModel]> {
        return repository.getDataNowPlaying()
    }
}
