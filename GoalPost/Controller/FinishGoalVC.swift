//
//  FinishGoalVC.swift
//  GoalPost
//
//  Created by Milan Bojic on 11/21/18.
//  Copyright © 2018 Milan Bojic. All rights reserved.
//

import UIKit

class FinishGoalVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var createGoalBtn: UIButton!
    @IBOutlet weak var daysTxtField: UITextField!
    var goalDescription: String!
    var goalType: GoalType!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         daysTxtField.delegate = self
        createGoalBtn.bindToKeyboard()

    }
    
    func passData(description: String, type: GoalType) {
        self.goalDescription = description
        self.goalType = type
    }
    
    @IBAction func createGoalBtnPressed(_ sender: Any) {
        // store objects in Core Data
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
    }
    
}
