//
//  HomepageRemoteDataSource.swift
//  Koanba
//
//  Created by Carlos Gamaliel on 12/07/23.
//

import Foundation
import Network
import RxSwift
import Alamofire

protocol HomepageRemoteDataSource {
    func getDataMovieNowPlaying() -> Observable<[HomepageDataResponse]>
}

class HomepageDefaultRemoteDataSource {
    
    static let shared: HomepageRemoteDataSource = HomepageDefaultRemoteDataSource()
    
    private let token = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0OTU1YjAzZjBjMTg1NTBlOTc1YTYwNmU3NjU2ZDg5NCIsInN1YiI6IjYyMmUxMTgzOThmMWYxMDA3ODA1M2M3NCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Il7s-gf6oZcy3OMRso3nldaILPLkFILf_HXz7RHhonQ"
    private let GET_MOVIE_LIST_NOW_PLAYING = "https://api.themoviedb.org/3/movie/now_playing"
}

extension HomepageDefaultRemoteDataSource: HomepageRemoteDataSource {
    
    func getDataMovieNowPlaying() -> Observable<[HomepageDataResponse]> {
        let headers: HTTPHeaders = [.authorization(bearerToken: token)]
        return Observable<[HomepageDataResponse]>.create { homeDataObserver in
            if let url = URL(string: self.GET_MOVIE_LIST_NOW_PLAYING) {
                AF.request(url, headers: headers)
                    .validate()
                    .responseDecodable(of: HomepageResponse.self) { homeDataResponse in
                        switch homeDataResponse.result {
                        case .success(let homeResponse):
                            homeDataObserver.onNext(homeResponse.results)
                            homeDataObserver.onCompleted()
                            break
                        case .failure(let error):
                            homeDataObserver.onError(error)
                            break
                        }
                    }
            }
            return Disposables.create()
        }
    }
    
}
