//
//  FirebaseFunctionsExampleApp.swift
//  FirebaseFunctionsExample
//
//  Created by Reed Gantz on 11/26/24.
//

import SwiftUI
import Firebase
import FirebaseAuth

@main
struct FirebaseFunctionsExampleApp: App {
    init() {
        FirebaseConfiguration.shared.setLoggerLevel(.debug)
        
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
