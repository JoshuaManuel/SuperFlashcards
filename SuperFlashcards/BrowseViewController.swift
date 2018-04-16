//
//  BrowseViewController.swift
//  SuperFlashcards
//
//  Created by Joshua Manuel on 3/31/18.
//  Copyright © 2018 Joshua Manuel. All rights reserved.
//

import UIKit
import CoreData

class BrowseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var tableView: UITableView!
    
    
    //Initial population
    var list: [CardSet] = []
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "browseCell")
        cell?.textLabel?.text = list[indexPath.row].name
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "BrowseToStudy", sender: list[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "BrowseToStudy"
        {
            if let destinationVC = segue.destination as? StudyViewController {
                destinationVC.cardSet = sender as! CardSet
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveCard(key: "Saved Key", value: "Saved Value")

        loadExampleCards()
        //loadExampleCards()
        
    }
    
    func saveCard(key: String, value: String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newCard = NSEntityDescription.insertNewObject(forEntityName: "Card", into: context)
        
        newCard.setValue(key, forKey: "key")
        newCard.setValue(value, forKey: "value")
        
        do {
            try context.save()
            print("Save")
        } catch {
            //error
        }
    }
    
    func loadExampleCards() {
        let entityName = ""
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        
        request.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(request)
            
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    
                }
            }
        } catch {
            //Some error
        }
    }
    
    func loadExampleCardsManually() {
        list.append(CardSet("Astronomy Final"))
        list[0].addCard(key: "Star", value: "Lol how do you not know what a star is?")
        list[0].addCard(key: "It's such a", value: "beautiful day")
        list.append(CardSet("iOS Programming"))
        list.append(CardSet("Biology Midterm"))
    }

    @IBAction func unwindToBrowseFinish(segue: UIStoryboardSegue) {
        if let origin = segue.source as? AddSetViewController {
            let setName = origin.setName

            print (setName!)
            list.append(CardSet(setName!))
            
            tableView.beginUpdates()
            tableView.insertRows(at: [IndexPath(row: list.count-1, section: 0)], with: .automatic)
            tableView.endUpdates()
            
            
        }
    }
    
    @IBAction func unwindToBrowseCancel(segue: UIStoryboardSegue) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
