//
//  CardSet.swift
//  SuperFlashcards
//
//  Created by Joshua Manuel on 4/12/18.
//  Copyright © 2018 Joshua Manuel. All rights reserved.
//

import Foundation

struct Card {
    var key = ""
    var value = ""
    
    var frontShowing = true
    
    init (key: String, value: String) {
        self.key = key
        self.value = value
    }
}
class CardSet {
    var name = ""
    
    var cards = [Card]()
    
    init(_ name: String) {
        self.name = name
    }
    
    func addCard(key: String, value: String) {
        cards.append(Card(key:key, value:value))
    }
}
