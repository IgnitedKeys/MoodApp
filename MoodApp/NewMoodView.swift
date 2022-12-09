//
//  NewMoodView.swift
//  MoodApp
//
//  Created by Gavin's Old Mac on 12/6/22.
//

import SwiftUI

struct NewMoodView: View {
    @State var isDisabled = true
    
    @Binding var mood : Mood
    @Binding var moodArray: [Mood]
    @State var newMood: Mood?
    
    var moodEnumArray: [Moods] = [.normal, .smile, .angry, .frown, .sleepy, .panic]
    var body: some View {
        NavigationView {
                
            VStack {

                Text(newMood != nil ? newMood?.mood.rawValue as! String : mood.mood.rawValue)
                    .font(.system(size: 50))
                ForEach(0..<3) { row in
                    HStack {
                        ForEach(0..<2) { col in
                            Button(action: {
                                newMood = Mood(mood: moodEnumArray[row * 2 + col], timestamp: Date())
                                isDisabled = false
                            }) {
                                Text(moodEnumArray[row * 2 + col].rawValue)
                                    .padding()
                                    .font(.system(size: 100))
                            }
                            
                        }
                    }
                }
            }.navigationTitle("How are you feeling?")
                .toolbar {
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Update") {
                            mood = newMood ?? mood
                            moodArray.append(mood)
                        }
                        .disabled(isDisabled)

                        
                    }
                    ToolbarItem(placement: .cancellationAction){
                        Button("Cancel") {
                            newMood = nil
                            isDisabled = true
                        }
                    }
                    
                }
            //done button that add's new mood to moodArray
            //cancel button that puts previous mood from array back to mood
            //don't change mood until confirmation made - can you disable tabview?
            
            //temp newMood?, if exists, allow cancel and update button
            // also, if newMood exists, show that on top mood text
            
            //nav bar-change view and isDisabled back to true
            //tab bar changes view, isDisabled back to true
            
        }
        
    }
        
}

struct NewMoodView_Previews: PreviewProvider {
    static var previews: some View {
        NewMoodView(mood: .constant(Mood(mood: .angry, timestamp: Date())), moodArray: .constant([]))
    }
}
