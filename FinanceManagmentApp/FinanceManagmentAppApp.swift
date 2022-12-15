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
    //MARK: vars
    @ObservedObject var userData = User()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    //MARK: body
    var body: some Scene {
        WindowGroup {
            SplashView()
                .environmentObject(userData)
            
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
