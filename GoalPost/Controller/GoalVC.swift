//
//  GoalVC.swift
//  GoalPost
//
//  Created by Milan Bojic on 11/19/18.
//  Copyright © 2018 Milan Bojic. All rights reserved.
//

import UIKit
import CoreData

class GoalVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = false
    }
    
    @IBAction func addGoalButton(_ sender: Any) {
        guard let createGoalVC = storyboard?.instantiateViewController(withIdentifier: "CreateGoalVC") else {return}
        presentVC(createGoalVC)
    }
    

}

extension GoalVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell", for: indexPath) as? GoalCell
            else {return UITableViewCell()}
        cell.configureCell(description: "Exercise twice a week!", type: .longTerm, progress: 4)
        return cell
    }
  
}

