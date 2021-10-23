//
//  Tag.swift
//  RealmFun
//
//  Created by BumMo Koo on 2021/10/23.
//

import Foundation
import RealmSwift
import UIKit

class Tag: Object {
    @Persisted(primaryKey: true) var name: String
    @Persisted var colorValue: Int
    
    @Persisted(originProperty: "tags") var memos: LinkingObjects<Memo>
    
    var color: UIColor {
        TagColor(rawValue: colorValue)?.color ?? .gray
    }
}

enum TagColor: Int {
    case red
    case orange
    case yellow
    
    var color: UIColor {
        switch self {
            case .red: return .red
            case .orange: return .orange
            case .yellow: return .yellow
        }
    }
}
