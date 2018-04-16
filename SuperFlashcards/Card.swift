//
//  Card.swift
//  SuperFlashcards
//
//  Created by Joshua Manuel on 4/15/18.
//  Copyright © 2018 Joshua Manuel. All rights reserved.
//

import Foundation

class Card {
    var key = ""
    var value = ""
    
    var frontShowing = true
    
    init (key: String, value: String) {
        self.key = key
        self.value = value
    }
}
