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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textCreateGoal.delegate = self
        textCreateGoal.text = "What is your goal? Type here..."
        textCreateGoal.textColor = UIColor.lightGray
        textCreateGoal.isScrollEnabled = false

    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textCreateGoal.textColor == UIColor.lightGray {
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
    }
    
    @IBAction func longTermBtnPressed(_ sender: Any) {
    }
    
    @IBAction func nextBtnPressed(_ sender: Any) {
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismissVC()
    }
    
    
}
