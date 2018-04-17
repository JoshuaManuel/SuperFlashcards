//
//  Card.swift
//  SuperFlashcards
//
//  Created by Joshua Manuel on 4/15/18.
//  Copyright © 2018 Joshua Manuel. All rights reserved.
//


import Foundation
import CoreData

class Card: NSManagedObject {
    @NSManaged var key: String
    @NSManaged var value: String
    @NSManaged var owningSet: CardSet
    
    var frontShowing = true
}

