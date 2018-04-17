//
//  CardSet.swift
//  SuperFlashcards
//
//  Created by Joshua Manuel on 4/12/18.
//  Copyright © 2018 Joshua Manuel. All rights reserved.
//


import Foundation
import CoreData

class CardSet: NSManagedObject {
    @NSManaged var name: String
    @NSManaged var cards: NSSet

    /*
    func addCard(key: String, value: String) {
        cards.append(Card(key:key, value:value))
    }
     */
}


