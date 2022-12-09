//
//  ContentView.swift
//  MoodApp
//
//  Created by Gavin's Old Mac on 12/6/22.
//

import SwiftUI

struct ContentView: View {
    
    @Binding var mood: Mood
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Image(systemName: "circle")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                    Text(mood.mood.rawValue)
                        .font(.system(size: 230))
                        .scaledToFit()
                        .minimumScaleFactor(0.01)
                        .lineLimit(1)
                }
                Text("Your latest Mood")
                    .font(.headline)
            }.navigationTitle("Mood Tracker")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(mood: .constant(Mood(mood: .normal, timestamp: Date())))
    }
}
