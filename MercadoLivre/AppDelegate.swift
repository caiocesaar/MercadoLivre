//
//  AppDelegate.swift
//  MercadoLivre
//
//  Created by Caio Cesar on 19/03/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Variables
    internal var window: UIWindow?
    private var appCoordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setupRoot()
        setupNavbar()
        return true
    }
    
    func setupRoot() {
        let window = UIWindow(frame: UIScreen.main.bounds)

        //MARK: - Coordinator
        let appCoordinator = AppCoordinator(window: window)
        self.window = window
        self.appCoordinator = appCoordinator
        
        appCoordinator.start()
        
    }
    
    func setupNavbar(){
        UINavigationBar.appearance().backgroundColor = UIColor.appColor(.colorAccent)
        UINavigationBar.appearance().tintColor = .black
        UINavigationBar.appearance().barTintColor = UIColor.appColor(.colorAccent)
        UINavigationBar.appearance().shadowImage = UIImage()
    }

}

