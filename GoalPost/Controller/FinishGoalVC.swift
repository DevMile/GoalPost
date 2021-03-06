//
//  FinishGoalVC.swift
//  GoalPost
//
//  Created by Milan Bojic on 11/21/18.
//  Copyright © 2018 Milan Bojic. All rights reserved.
//

import UIKit
import CoreData

class FinishGoalVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var createGoalBtn: UIButton!
    @IBOutlet weak var daysTxtField: UITextField!
    var goalDescription: String!
    var goalType: GoalType!
    let contextManager = appDelegate.persistentContainer.viewContext
    
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
        if daysTxtField.text != "" {
            save { (success) in
                dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismissVC()
    }
    
    // MARK: - CoreData Methods
    func save(completion: (_ finished: Bool) -> ()) {
        let goal = Goal(context: contextManager)
        goal.goalDescription = goalDescription
        goal.goalType = goalType.rawValue
        goal.goalCompletionValue = Int32(daysTxtField.text!)!
        goal.goalProgress = Int32(0)
        goal.date = Date()
        do {
            try contextManager.save()
            completion(true)
        } catch {
            print("Error saving context: \(error.localizedDescription)")
            completion(false)
        }
    }
}
