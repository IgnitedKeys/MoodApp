//
//  Mood.swift
//  MoodApp
//
//  Created by Gavin's Old Mac on 12/6/22.
//

import Foundation

enum Moods: String, Hashable {
    case smile = "đ"
    case frown = "âšī¸"
    case sleepy = "đĨą"
    case angry = "đ "
    case normal = "đ"
    case panic = "đŠ"
    
}

struct Mood {
    var mood : Moods = .normal
    var timestamp : Date = Date()
    
}



