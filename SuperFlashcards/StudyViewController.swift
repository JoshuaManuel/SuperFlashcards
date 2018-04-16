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
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.cardSet.cards.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! StudyCollectionViewCell
        
        cell.key.text = self.cardSet.cards[indexPath.item].key
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 3.0
        cell.layer.cornerRadius = 3.0
        
        return cell
    }
    
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
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
            let cardKey = origin.cardKey!
            let cardValue = origin.cardValue!
            
            cardSet.addCard(key: cardKey, value: cardValue)
            
            collectionView.insertItems(at: [IndexPath(row: cardSet.cards.count-1, section: 0)])
            
            //print("key: \(String(describing: cardKey)) value: \(String(describing: cardValue))")
        }
    }
    
    @IBAction func unwindToStudyCancel(segue: UIStoryboardSegue) {
        
    }
    
}
