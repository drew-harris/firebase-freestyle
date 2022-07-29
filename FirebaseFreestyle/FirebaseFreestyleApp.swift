//
//  FirebaseFreestyleApp.swift
//  FirebaseFreestyle
//
//  Created by Drew Harris on 7/29/22.
//

import SwiftUI
import Firebase

@main
struct FirebaseFreestyleApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
