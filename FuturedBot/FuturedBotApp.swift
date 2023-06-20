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
                        Label("Actions", systemImage: "paperplane")
                    }
                AnalyzeView()
                    .tabItem {
                        Label("Analysis", systemImage: "sparkle.magnifyingglass")
                    }
            }
        
        }
    }
}
