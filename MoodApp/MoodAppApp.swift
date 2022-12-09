//
//  MoodAppApp.swift
//  MoodApp
//
//  Created by Gavin's Old Mac on 12/6/22.
//

import SwiftUI

@main
struct MoodAppApp: App {
    @State private var mood: Mood = Mood()
    @State private var moodArray: [Mood] = []
    
    

    var body: some Scene {
        WindowGroup {
            MainView(mood: $mood, moodArray: $moodArray)
        }
    }
}
