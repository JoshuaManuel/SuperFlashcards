//
//  StudyCollectionViewCell.swift
//  SuperFlashcards
//
//  Created by Joshua Manuel on 4/14/18.
//  Copyright © 2018 Joshua Manuel. All rights reserved.
//

import UIKit

protocol StudyCollectionViewCellDelegate: class  {
    func deleteCell( cell: StudyCollectionViewCell)
}

class StudyCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: StudyCollectionViewCellDelegate?
    
    @IBOutlet weak var key: UILabel!
    @IBAction func deleteThisCell(_ sender: Any) {
        delegate?.deleteCell(cell: self)
    }
}
