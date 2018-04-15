//
//  BrowseViewController.swift
//  SuperFlashcards
//
//  Created by Joshua Manuel on 3/31/18.
//  Copyright © 2018 Joshua Manuel. All rights reserved.
//

import UIKit

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

        // Do any additional setup after loading the view.
        list.append(CardSet("Astronomy Final"))
        list[0].addCard(key: "Hello", value: "My Dudes")
        list[0].addCard(key: "It's such a", value: "beautiful day")
        list.append(CardSet("iOS Programming"))
        list.append(CardSet("Biology Midterm"))
    }

    @IBAction func unwindToBrowseFinish(segue: UIStoryboardSegue) {
        if let origin = segue.source as? AddSetViewController {
            print("in the unwind function")
            let setName = origin.setName
            // Do something with the data
            print (setName!)
        }
    }
    
    @IBAction func unwindToBrowseCancel(segue: UIStoryboardSegue) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
