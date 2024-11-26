//
//  FirebaseFunctionsExampleApp.swift
//  FirebaseFunctionsExample
//
//  Created by Reed Gantz on 11/26/24.
//

import SwiftUI
import Firebase

@main
struct FirebaseFunctionsExampleApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
