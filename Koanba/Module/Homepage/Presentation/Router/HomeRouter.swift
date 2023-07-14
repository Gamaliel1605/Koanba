//
//  HomeRouter.swift
//  Koanba
//
//  Created by Carlos Gamaliel on 12/07/23.
//

import Foundation
import UIKit

class HomeRouter {
    
    static func createModule() -> HomeViewController {
        let controller = HomeViewController(nibName: "HomeViewController", bundle: nil)
        let interactor = HomepageInjection.init().provideHomepageMovie()
        let presenter = HomeDefaultPresenter(view: controller, interactor: interactor)
        
        controller.presenter = presenter
        
        return controller
    }
    
    func goToDetailPage(movieID: Int, controller: UIViewController) {
        let detailController = DetailPageRouter.createModule(movieID: movieID)
        controller.navigationController?.pushViewController(detailController, animated: true)
    }
}
