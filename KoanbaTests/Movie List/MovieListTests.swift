//
//  KoanbaTests.swift
//  KoanbaTests
//
//  Created by Carlos Gamaliel on 12/07/23.
//

import XCTest
@testable import Koanba

final class MovieListTests: XCTestCase {
    
    func testMovieListEmpty() throws {
        let interactor = MovieNowPlayingEmptyDataMockInteractor()
        let controller = HomeViewController(nibName: "HomeViewController", bundle: nil)
        let presenter = HomeDefaultPresenter(view: controller, interactor: interactor)
        
        controller.loadView()
        presenter.getMovieNowPlaying()
        
        XCTAssertEqual(presenter.movieData.count, 0)
    }
    
    func testMovieListHasData() throws {
        let interactor = MovieNowPlayingHasDataMockInteractor()
        let controller = HomeViewController(nibName: "HomeViewController", bundle: nil)
        let presenter = HomeDefaultPresenter(view: controller, interactor: interactor)
        
        controller.loadView()
        presenter.getMovieNowPlaying()
        
        XCTAssertNotEqual(presenter.movieData.count, 0)
    }

}
