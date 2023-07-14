//
//  AppDelegate.swift
//  Koanba
//
//  Created by Carlos Gamaliel on 12/07/23.
//

import UIKit
import RealmSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var mainNavigationController: UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.updateRealm()
        self.setupView()
        
        return true
    }
    
    private func updateRealm() {
        do {
            let config = Realm.Configuration(
              schemaVersion: 3,
              migrationBlock: { migration, oldSchemaVersion in
                if (oldSchemaVersion < 3) {
                    migration.enumerateObjects(ofType: HomepageEntity.className()) { oldObject, newObject in
                        
                    }
                }
              })
            Realm.Configuration.defaultConfiguration = config
            try Realm.performMigration()
            let newRealm = try Realm()
        } catch let error as NSError {
            print("error \(error.localizedDescription)")
        }
    }
    
    private func setupView() {
        let homeVC = HomeRouter.createModule()
        
        mainNavigationController = UINavigationController(rootViewController: homeVC)
        mainNavigationController?.isNavigationBarHidden = false
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        self.window?.rootViewController = mainNavigationController
    }

}
