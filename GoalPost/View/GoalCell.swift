//
//  GoalCell.swift
//  GoalPost
//
//  Created by Milan Bojic on 11/19/18.
//  Copyright © 2018 Milan Bojic. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {

    @IBOutlet weak var labelGoalDescription: UILabel!
    @IBOutlet weak var labelGoalType: UILabel!
    @IBOutlet weak var labelGoalProgress: UILabel!
    
    func configureCell(description: String, type: String, progress: Int) {
        self.labelGoalDescription.text = description
        self.labelGoalType.text = type
        self.labelGoalProgress.text = String(describing: progress)
    }
    

}
