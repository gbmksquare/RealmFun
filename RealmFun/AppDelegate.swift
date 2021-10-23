//
//  AppDelegate.swift
//  RealmFun
//
//  Created by BumMo Koo on 2021/10/09.
//

import UIKit
import RealmSwift
import SnapKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        print("🧑🏻‍💻 \(NSTemporaryDirectory())")
        
        let configuration = Realm.Configuration(schemaVersion: 8)
        { migration, oldSchemaVersion in
            if oldSchemaVersion < 6 {
//                migration.renameProperty(onType: Memo.className(), from: "id", to: "identifier")
            }
        }
        Realm.Configuration.defaultConfiguration = configuration
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        
    }


}

