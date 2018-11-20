//
//  CreateGoalVC.swift
//  GoalPost
//
//  Created by Milan Bojic on 11/20/18.
//  Copyright © 2018 Milan Bojic. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController, UITextViewDelegate {

    @IBOutlet weak var textCreateGoal: UITextView!
    @IBOutlet weak var shortTermBtn: UIButton!
    @IBOutlet weak var longTermBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    var goalType: GoalType = .shortTerm
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textCreateGoal.delegate = self
        textCreateGoal.isScrollEnabled = true
        nextBtn.bindToKeyboard()
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeselectedColor()
        
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textCreateGoal.text != nil {
            textCreateGoal.text = nil
            textCreateGoal.textColor = UIColor.black
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if textCreateGoal.text.isEmpty {
            textCreateGoal.text = "What is your goal? Type here..."
            textCreateGoal.textColor = UIColor.lightGray
        }
    }
    
    @IBAction func shortTermBtnPressed(_ sender: Any) {
        goalType = .shortTerm
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeselectedColor()
    }
    
    @IBAction func longTermBtnPressed(_ sender: Any) {
        goalType = .longTerm
        shortTermBtn.setDeselectedColor()
        longTermBtn.setSelectedColor()
    }
    
    @IBAction func nextBtnPressed(_ sender: Any) {
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismissVC()
    }
    
    
}
