//
//  Mingo_ITApp.swift
//  Mingo-IT
//
//  Created by Zai on 31/05/23.
//

import SwiftUI

@main
struct Mingo_ITApp: App {
    @StateObject private var userManager  = UserManager()
    @StateObject private var scoreManager  = ScoreManager()
    @StateObject private var gateViewModel  = GateViewModel()
    @StateObject private var lessonViewModel  = LessonViewModel()
    
    var body: some Scene {
        WindowGroup {
         SplashScreen()
                .environmentObject(userManager)
                .environmentObject(gateViewModel)
                .environmentObject(scoreManager)
                .environmentObject(lessonViewModel)
        }
    }
}
