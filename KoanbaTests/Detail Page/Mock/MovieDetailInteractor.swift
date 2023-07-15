//
//  MovieDetailInteractor.swift
//  KoanbaTests
//
//  Created by Carlos Gamaliel on 15/07/23.
//

import Foundation
import RxSwift
@testable import Koanba

class MovieDetailEmptMockInteractor: DetailPageUseCase {
    
    func getMovieDetail(movieID: Int) -> Observable<DetailPageModel> {
        return Observable.empty()
    }
    
}

class MovieDetailHasDataMockInteractor: DetailPageUseCase {
    
    func getMovieDetail(movieID: Int) -> Observable<DetailPageModel> {
        return Observable.just(DetailPageModel())
    }
}
