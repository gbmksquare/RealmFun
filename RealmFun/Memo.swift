//
//  Memo.swift
//  RealmFun
//
//  Created by BumMo Koo on 2021/10/09.
//

import Foundation
import Realm
import RealmSwift

class Memo: Object {
    @Persisted(primaryKey: true) var id = UUID().uuidString
    @Persisted(indexed: true) var adID = UUID().uuidString
    @Persisted var title = ""
    @Persisted var content: String?
    @Persisted var created = Date()
    @Persisted var modified: Date?
//    @Persisted var deleted: Date?
    
    @Persisted var tags: List<Tag>
}
