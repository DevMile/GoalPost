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
    
    func configureCell(goal: Goal) {
        self.labelGoalDescription.text = goal.goalDescription
        self.labelGoalType.text = goal.goalType
        self.labelGoalProgress.text = String(describing: goal.goalProgress)
    }
    

}
