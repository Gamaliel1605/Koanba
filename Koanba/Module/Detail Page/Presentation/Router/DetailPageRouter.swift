//
//  DetailPageRouter.swift
//  Koanba
//
//  Created by Carlos Gamaliel on 12/07/23.
//

import Foundation
import UIKit

class DetailPageRouter {
    
    static func createModule(movieID: Int) -> DetailPageViewController {
        let controller = DetailPageViewController(nibName: "DetailPageViewController", bundle: nil)
        let interactor = DetailPageInjcetion.init().provideMovieDetail()
        let presenter = DetailPageDefaultPresenter(view: controller, interactor: interactor)
        
        controller.presenter = presenter
        presenter.movieID = movieID
        
        return controller
    }
}
