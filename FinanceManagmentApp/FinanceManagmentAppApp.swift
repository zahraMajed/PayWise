//
//  FinanceManagmentAppApp.swift
//  FinanceManagmentApp
//
//  Created by Zahra Majed Alzawad on 14/05/1444 AH.
//

import SwiftUI
import Firebase

@main
struct FinanceManagmentAppApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            SplashView()
            
        }
    }
}

//MARK: Setting up Firebase
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
    
    //OTP Requires Remote Notification
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) async -> UIBackgroundFetchResult {
        return .noData
    }

}
