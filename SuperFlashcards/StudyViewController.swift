//
//  StudyViewController.swift
//  SuperFlashcards
//
//  Created by Joshua Manuel on 4/13/18.
//  Copyright © 2018 Joshua Manuel. All rights reserved.
//

import UIKit

class StudyViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var studyCollectionView: UICollectionView!

    var cardSet: CardSet!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Clicked on \(cardSet.name)")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardSet.cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StudyCell", for: indexPath) as! StudyCollectionViewCell
        
        //Configure cell if you want
        cell.backgroundColor = UIColor.lightGray
        cell.cardName.text = cardSet.cards[indexPath.row].key
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("tapped!")

        flip(indexPath: indexPath)
    }
    
    func flip (indexPath: IndexPath) {
        print("In flip!")
        
        var flipped = cardSet.cards[indexPath.row].frontShowing
        print("The card is \(cardSet.cards[indexPath.row].key) and is the front showing? \(flipped)")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
