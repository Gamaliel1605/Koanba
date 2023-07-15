//
//  HomePresenter.swift
//  Koanba
//
//  Created by Carlos Gamaliel on 12/07/23.
//

import Foundation
import UIKit
import RxSwift

protocol HomePresenter {
    var movieData: [HomepageModel] {get set}
    var numOfMovie: Int {get}
    
    func getMovieNowPlaying()
    func goToDetailPage(movieID: Int)
    func filterData(text: String)
}

class HomeDefaultPresenter: HomePresenter {
    
    private var view: HomeViewController
    private var interactor: HomepageUseCase
    private var router = HomeRouter()
    
    var movieData: [HomepageModel] = []
    var numOfMovie: Int {
        get {
            return movieData.count
        }
    }
    var filteredMovie: [HomepageModel] = []
    private var disposeBag = DisposeBag()
    
    init(view: HomeViewController, interactor: HomepageUseCase) {
        self.view = view
        self.interactor = interactor
    }
    
    func getMovieNowPlaying() {
        interactor.getMovieData()
            .subscribe { data in
                self.filteredMovie = data
                self.movieData = self.filteredMovie
                DispatchQueue.main.async {
                    self.view.tableView.reloadData()
                }
            } onError: { error in
                print(error.localizedDescription)
            }.disposed(by: disposeBag)
    }
    
    func goToDetailPage(movieID: Int) {
        self.router.goToDetailPage(movieID: movieID, controller: view)
    }
    
    func filterData(text: String) {
        if text.isEmpty {
            self.movieData = self.filteredMovie
            return
        }
        movieData = filteredMovie.filter({ data in
            guard let name = data.title else {return false}
            return name.lowercased().contains(text.lowercased())
        })
    }
    
}
