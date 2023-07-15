//
//  DetailPagePresenter.swift
//  Koanba
//
//  Created by Carlos Gamaliel on 12/07/23.
//

import Foundation
import UIKit
import RxSwift

protocol DetailPagePresenter {
    var detailMovie: DetailPageModel? {get}
    var numOfCategories: Int {get}
    var numOfProduction: Int {get}
    func viewDidLoad()
}

class DetailPageDefaultPresenter: DetailPagePresenter {
    
    private var view: DetailPageViewController
    private var router = DetailPageRouter()
    private var interactor: DetailPageUseCase
    
    var detailMovie: DetailPageModel?
    let disposeBag = DisposeBag()
    var movieID = 0
    var numOfCategories: Int {
        get {
            return detailMovie?.genres.count ?? 0
        }
    }
    var numOfProduction: Int {
        get {
            return detailMovie?.productions.count ?? 0
        }
    }
    
    init(view: DetailPageViewController, router: DetailPageRouter = DetailPageRouter(), interactor: DetailPageUseCase) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    func viewDidLoad() {
        getDetailMovie()
    }
    
    func getDetailMovie() {
        interactor.getMovieDetail(movieID: self.movieID)
            .subscribe { movie in
                self.detailMovie = movie
                
                DispatchQueue.main.async {
                    self.view.colViewCategory.reloadData()
                    self.view.colViewProduction.reloadData()
                    self.view.renderData()
                }
            } onError: { error in
                print(error)
            }.disposed(by: disposeBag)
    }
}
