//
//  HomePresenter.swift
//  Koanba
//
//  Created by Carlos Gamaliel on 12/07/23.
//

import Foundation
import UIKit

protocol HomePresenter {
    
    func goToDetailPage(movieID: Int)
}

class HomeDefaultPresenter: HomePresenter {
    
    private var view: HomeViewController
    private var router = HomeRouter()
    
    init(view: HomeViewController) {
        self.view = view
    }
    
    func goToDetailPage(movieID: Int) {
        self.router.goToDetailPage(movieID: movieID, controller: view)
    }
    
}
