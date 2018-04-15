//
//  StudyViewController.swift
//  SuperFlashcards
//
//  Created by Joshua Manuel on 4/14/18.
//  Copyright © 2018 Joshua Manuel. All rights reserved.
//

import UIKit
class StudyViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var cardSet: CardSet!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let reuseIdentifier = "StudyCell" // also enter this string as the cell identifier in the storyboard
    //var items = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48"]
    
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("numberOfItemsInSection")
        //return self.items.count
        return self.cardSet.cards.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        print("cellForItemAt")
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! StudyCollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.key.text = self.cardSet.cards[indexPath.item].key
        cell.backgroundColor = UIColor.cyan // make cell more visible in our example project
        
        return cell
    }
    
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.item)!")
        
        flip(card: self.cardSet.cards[indexPath.item], indexPath: indexPath)
        
        
    }
    
    func flip(card: Card, indexPath: IndexPath) {
        if card.frontShowing {
            print("Front is showing. Just flipped it to false")
            card.frontShowing = false
            
            let cell = collectionView.cellForItem(at: indexPath) as! StudyCollectionViewCell

            cell.key.text = self.cardSet.cards[indexPath.item].value
            
            UIView.transition(with: cell, duration: 0.3 , options: .transitionFlipFromLeft, animations: nil, completion: nil)
            
        } else {
            print("Back is showing. Just flipped it to true")
            card.frontShowing = true
            
            let cell = collectionView.cellForItem(at: indexPath) as! StudyCollectionViewCell
            
            cell.key.text = self.cardSet.cards[indexPath.item].key
            
            UIView.transition(with: cell, duration: 0.3 , options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
    }
    
    @IBAction func unwindToStudyFinish(segue: UIStoryboardSegue) {
        if let origin = segue.source as? AddCardViewController {
            print("in the unwind function")
            let cardKey = origin.cardKey
            let cardValue = origin.cardValue
            
            print("key: \(String(describing: cardKey)) value: \(String(describing: cardValue))")
        }
    }
    
    @IBAction func unwindToStudyCancel(segue: UIStoryboardSegue) {
        
    }
    
}
