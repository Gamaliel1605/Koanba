//
//  HomepageEntity.swift
//  Koanba
//
//  Created by Carlos Gamaliel on 14/07/23.
//

import Foundation
import RealmSwift

class HomepageEntity: Object {
    
    @Persisted(primaryKey: true) var id: Int
    @Persisted var releaseDate: String
    @Persisted var title: String
    @Persisted var image: String
    @Persisted var genreID = List<Int>()
}
