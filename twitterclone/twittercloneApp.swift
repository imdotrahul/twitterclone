//
//  twittercloneApp.swift
//  twitterclone
//
//  Created by Rahul Yadav on 13/04/22.
//

import SwiftUI
import Firebase

@main
struct twittercloneApp: App {
    
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .environmentObject(viewModel)
        }
    }
}
