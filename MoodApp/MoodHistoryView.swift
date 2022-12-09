//
//  MoodHistoryView.swift
//  MoodApp
//
//  Created by Gavin's Old Mac on 12/7/22.
//

import SwiftUI

struct MoodHistoryView: View {
    @Binding var moodArray: [Mood]
    var body: some View {
        NavigationView {
            List(0..<moodArray.count, id: \.self) { index in
                if !moodArray.isEmpty {
                    //ForEach(0..<moodArray.count, id: \.self) { index in
                    if Calendar.current.isDateInToday(moodArray[index].timestamp) {
                        HStack {
                            Text(moodArray[index].mood.rawValue)
                            Text(moodArray[index].timestamp, style: .time)
                        }
                        
                    } else {
                        Text("Add a mood to start tracking your day")
                    }
                    //  }
                } else {
                    Text("No moods added yet!")
                }
                
            }.navigationTitle("Top Mood: \(getTopMood(from: moodArray))")
        }
    }
        
}

func getTopMood(from array: [Mood]) -> String {
    //iterate through array, count number of each mood, return mood with highest count
    var moodCount: [Moods: Int] = [.frown: 0, .smile: 0, .normal: 0, .sleepy: 0, .panic: 0, .angry: 0]
    
    for mood in array {
        switch mood.mood {
        case .frown: moodCount[.frown]! += 1
        case .smile: moodCount[.smile]! += 1
        case .normal: moodCount[.normal]! += 1
        case .sleepy: moodCount[.sleepy]! += 1
        case .panic: moodCount[.panic]! += 1
        case .angry: moodCount[.angry]! += 1
        }
    }
    
    let maxMood = moodCount.max {$0.value < $1.value}
    
    if maxMood?.value == 0 {
        return ""
    }
    
    return maxMood?.key.rawValue ?? ""
    
}

struct MoodHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        MoodHistoryView(moodArray: .constant([Mood(mood: .smile, timestamp: Date()), Mood(mood: .frown, timestamp: Date()),Mood(mood: .frown, timestamp: Date())]))
    }
}
