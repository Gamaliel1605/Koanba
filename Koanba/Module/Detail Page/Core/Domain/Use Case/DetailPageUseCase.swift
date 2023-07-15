//
//  DetailPageInteractor.swift
//  Koanba
//
//  Created by Carlos Gamaliel on 12/07/23.
//

import Foundation
import RxSwift

protocol DetailPageUseCase {
    func getMovieDetail(movieID: Int) -> Observable<DetailPageModel>
}

class DetailPageDefaultProtocol: DetailPageUseCase {
    
    let repository: DetailPageRepository
    init(repository: DetailPageRepository) {
        self.repository = repository
    }
    
    func getMovieDetail(movieID: Int) -> Observable<DetailPageModel> {
        return self.repository.getMovieDetailData(movieID: movieID)
    }
    
}
