//
//  DetailPageTests.swift
//  KoanbaTests
//
//  Created by Carlos Gamaliel on 15/07/23.
//

import XCTest
@testable import Koanba

final class DetailPageTests: XCTestCase {

    func testMovieDetailEmpty() throws {
        let interactor = MovieDetailEmptMockInteractor()
        let controller = DetailPageViewController(nibName: "DetailPageViewController", bundle: nil)
        let presenter = DetailPageDefaultPresenter(view: controller, interactor: interactor)
        
        controller.loadView()
        presenter.getDetailMovie()
        
        XCTAssertNil(presenter.detailMovie)
    }
    
    func testMovieDetailHasData() throws {
        let interactor = MovieDetailHasDataMockInteractor()
        let controller = DetailPageViewController(nibName: "DetailPageViewController", bundle: nil)
        let presenter = DetailPageDefaultPresenter(view: controller, interactor: interactor)
        
        controller.loadView()
        presenter.getDetailMovie()
        
        XCTAssertNotNil(presenter.detailMovie)
    }

}
