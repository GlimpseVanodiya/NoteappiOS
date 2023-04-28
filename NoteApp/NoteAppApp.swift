//
//  NoteAppApp.swift
//  NoteApp
//
//  Created by Zalak Vanodiya on 2022-04-11.
//

import SwiftUI
import Firebase

@main
struct NoteAppApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate{
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
         
        FirebaseApp.configure()
        return true
    }
}
