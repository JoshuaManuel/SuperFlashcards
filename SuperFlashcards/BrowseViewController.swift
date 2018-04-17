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
        print("list count: \(list.count)")
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("crash in cellforRowat")
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
        
        //deleteAll(entityName: "CardSet")
        //deleteAll(entityName: "Card")

        loadExampleCards()
        //saveCardSet(name: "Hello World!")
        
    }
    
    func saveCardSet(name: String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "CardSet", in: context)!
        
        let cardSetToAdd = CardSet(entity: entity, insertInto: context)
        
        cardSetToAdd.name = name
        cardSetToAdd.cards = []

        
        do {
            try context.save()
            print("Saved!")
            list.append(cardSetToAdd)
        } catch {
            //error
        }
    }
    
    func loadExampleCards() {
        let entityName = "CardSet"
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext

        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        
        request.returnsObjectsAsFaults = false
        
        do {
            list = try context.fetch(request) as! [CardSet]
            print(list)
            
            /*
            if results.count > 0 {
                for result in results as! [CardSet] {
                    
                }
            }
            */
        } catch {
            //Some error
        }
    }
    /*
    
    func loadExampleCardsManually() {
        list.append(CardSet("Astronomy Final"))
        list[0].addCard(key: "Star", value: "Lol how do you not know what a star is?")
        list[0].addCard(key: "It's such a", value: "beautiful day")
        list.append(CardSet("iOS Programming"))
        list.append(CardSet("Biology Midterm"))
    }
 */

    @IBAction func unwindToBrowseFinish(segue: UIStoryboardSegue) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        if let origin = segue.source as? AddSetViewController {
            let setName = origin.setName

            print (setName!)
            
            saveCardSet(name: setName!)
            
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
    
    func deleteAll(entityName: String) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        
        // Configure Fetch Request
        fetchRequest.includesPropertyValues = false
        
        do {
            let items = try context.fetch(fetchRequest) as! [NSManagedObject]
            
            for item in items {
                context.delete(item)
            }
            
            // Save Changes
            try context.save()
            
        } catch {
            
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {

            //Delete from CoreData
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
            let context = appDelegate.persistentContainer.viewContext

            context.delete(list[indexPath.row])
            
            do {
                try context.save()
            } catch {
                
            }
            
            
            //delete from list
            list.remove(at: indexPath.row)
            
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
                
            
        }
    }


}
