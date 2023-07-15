//
//  MovieListInteractor.swift
//  KoanbaTests
//
//  Created by Carlos Gamaliel on 15/07/23.
//

import Foundation
import RxSwift
@testable import Koanba

class MovieNowPlayingEmptyDataMockInteractor: HomepageUseCase {
    func getMovieData() -> Observable<[HomepageModel]> {
        return Observable.empty()
    }
}

class MovieNowPlayingHasDataMockInteractor: HomepageUseCase {
    func getMovieData() -> Observable<[HomepageModel]> {
        return Observable.just([HomepageModel()])
    }
}
