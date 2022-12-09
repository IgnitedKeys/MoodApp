//
//  Mood.swift
//  MoodApp
//
//  Created by Gavin's Old Mac on 12/6/22.
//

import Foundation

enum Moods: String, Hashable {
    case smile = "🙂"
    case frown = "☹️"
    case sleepy = "🥱"
    case angry = "😠"
    case normal = "😐"
    case panic = "😩"
    
}

struct Mood {
    var mood : Moods = .normal
    var timestamp : Date = Date()
    
}



