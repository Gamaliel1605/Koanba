//
//  HomepageLocalDataSource.swift
//  Koanba
//
//  Created by Carlos Gamaliel on 12/07/23.
//

import Foundation
import RxSwift
import RealmSwift

enum RealmError: Error {
    case readError
}

protocol HomepageLocalDataSource {
    func addDataNowPlaying(from movieData: [HomepageEntity]) -> Observable<Bool>
    func getDataNowPlaying() -> Observable<[HomepageEntity]>
}

class HomepageDefaultLocalDataSource {
    
    private let realm: Realm?
    
    private init(realm: Realm?) {
        self.realm = realm
    }
    
    static let sharedInstance: (Realm?) -> HomepageLocalDataSource = { realmDatabase in
        return HomepageDefaultLocalDataSource(realm: realmDatabase)
    }
}

extension HomepageDefaultLocalDataSource: HomepageLocalDataSource {
    
    func addDataNowPlaying(from movieData: [HomepageEntity]) -> Observable<Bool> {
        return Observable<Bool>.create { observer in
            if let realm = self.realm {
                do {
                    if !movieData.isEmpty {
                        try realm.write({
                            for movie in movieData {
                                realm.add(movie, update: .all)
                            }
                        })
                    }
                    observer.onNext(true)
                    observer.onCompleted()
                } catch let error {
                    observer.onError(error)
                }
            }
            return Disposables.create()
        }
    }
    
    func getDataNowPlaying() -> Observable<[HomepageEntity]> {
        return Observable<[HomepageEntity]>.create { observer in
            if let realm = self.realm {
                let movieData: Results<HomepageEntity> = {
                    realm.objects(HomepageEntity.self)
                }()
                observer.onNext(movieData.toArray(ofType: HomepageEntity.self))
                observer.onCompleted()
            } else {
                observer.onError(RealmError.readError)
            }
            return Disposables.create()
        }
    }
    
}

extension Results {
    
    func toArray<T>(ofType: T.Type) -> [T] {
      var array = [T]()
      for index in 0 ..< count {
        if let result = self[index] as? T {
          array.append(result)
        }
      }
      return array
    }
    
}
