//
//  AddSetViewController.swift
//  SuperFlashcards
//
//  Created by Joshua Manuel on 4/15/18.
//  Copyright © 2018 Joshua Manuel. All rights reserved.
//

import UIKit

class AddSetViewController: UIViewController {
    
    @IBOutlet weak var addSetTextField: UITextField!
    
    var setName: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        setName = addSetTextField.text!
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
