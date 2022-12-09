//
//  MainView.swift
//  MoodApp
//
//  Created by Gavin's Old Mac on 12/6/22.
//

import SwiftUI


struct MainView: View {
    @Binding var mood : Mood
    @Binding var moodArray: [Mood]
    var body: some View {
        TabView {
            ContentView(mood: $mood)
                .tabItem {
                    Label("My Mood", systemImage: "face.smiling")
                }
            NewMoodView(mood: $mood, moodArray: $moodArray)
                .tabItem {
                    Label("Add Mood", systemImage: "plus.circle")
                }
            MoodHistoryView(moodArray: $moodArray)
                .tabItem {
                    Label("Mood Chart", systemImage: "calendar.circle")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(mood: .constant(Mood(mood: .smile, timestamp: Date())), moodArray: .constant([]))
    }
}
