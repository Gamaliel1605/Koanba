//
//  DetailPageRemoteDataSource.swift
//  Koanba
//
//  Created by Carlos Gamaliel on 12/07/23.
//

import Foundation
import Network
import RxSwift
import Alamofire

protocol DetailPageRemoteDataSource {
    func movieDetail(id: Int) -> Observable<DetailPageResponse>
}

class DetailPageDefaultRemoteDataSource {
    static let shared: DetailPageRemoteDataSource = DetailPageDefaultRemoteDataSource()
    
    private let token = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0OTU1YjAzZjBjMTg1NTBlOTc1YTYwNmU3NjU2ZDg5NCIsInN1YiI6IjYyMmUxMTgzOThmMWYxMDA3ODA1M2M3NCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Il7s-gf6oZcy3OMRso3nldaILPLkFILf_HXz7RHhonQ"
    private let GET_MOVIE_DETAIL = "https://api.themoviedb.org/3/movie/%d"
}

extension DetailPageDefaultRemoteDataSource: DetailPageRemoteDataSource {
    
    func movieDetail(id: Int) -> Observable<DetailPageResponse> {
        let headers: HTTPHeaders = [.authorization(bearerToken: token)]
        return Observable<DetailPageResponse>.create { observer in
            if let url = URL(string: String(format: self.GET_MOVIE_DETAIL, id)) {
                AF.request(url, headers: headers)
                    .validate()
                    .responseDecodable(of: DetailPageResponse.self) { response in
                        switch response.result {
                        case .success(let movieDetailResponse):
                            observer.onNext(movieDetailResponse)
                            observer.onCompleted()
                            break
                        case .failure(let error):
                            observer.onError(error)
                        }
                    }
            }
            return Disposables.create()
        }
    }
    
}
