//
//  FuturedBotApp.swift
//  FuturedBot
//
//  Created by Patrik Potocek on 20.06.2023.
//

import SwiftUI

@main
struct FuturedBotApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                ChatView()
                    .tabItem {
                        Label("Chat", systemImage: "message")
                    }
                AnalyzeView()
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
            }
        
        }
    }
}
