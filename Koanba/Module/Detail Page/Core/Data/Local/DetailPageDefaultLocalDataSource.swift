//
//  DetailPageLocalDataSource.swift
//  Koanba
//
//  Created by Carlos Gamaliel on 12/07/23.
//

import Foundation
import RxSwift
import RealmSwift

protocol DetailPageLocalDataSource {
    func getMovieDetailData(movieID: Int) -> Observable<DetailPageEntity>
    func setMovieDetailData(movieDetail: DetailPageEntity) -> Observable<Bool>
}

class DetailPageDefaultLocalDataSource {
    
    private let realm: Realm?
    
    private init(realm: Realm?) {
        self.realm = realm
    }
    
    static let sharedInstance: (Realm?) -> DetailPageLocalDataSource = { realmDatabase in
        return DetailPageDefaultLocalDataSource(realm: realmDatabase)
    }
}

extension DetailPageDefaultLocalDataSource: DetailPageLocalDataSource {
    
    func getMovieDetailData(movieID: Int) -> Observable<DetailPageEntity> {
        return Observable<DetailPageEntity>.create { observer in
            if let realm = self.realm {
                
                if let movie = realm.object(ofType: DetailPageEntity.self, forPrimaryKey: movieID) {
                    
                    observer.onNext(movie)
                    observer.onCompleted()
                } else {
                    observer.onError(RealmError.readError)
                }
            }
            return Disposables.create()
        }
    }
    
    func setMovieDetailData(movieDetail: DetailPageEntity) -> Observable<Bool> {
        return Observable<Bool>.create { observer in
            if let realm = self.realm {
                do {
                    try realm.write({
                        realm.add(movieDetail, update: .all)
                    })
                    observer.onNext(true)
                    observer.onCompleted()
                } catch {
                    observer.onError(RealmError.readError)
                }
            }
            return Disposables.create()
        }
    }
    
}
