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
    var goals = [Goal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        fetchData { (success) in
            if success {
                if goals.count >= 1 {
                    tableView.isHidden = false
                } else {
                    tableView.isHidden = true
                }
            }
        }
        tableView.reloadData()
    }
    
    @IBAction func addGoalButton(_ sender: Any) {
        guard let createGoalVC = storyboard?.instantiateViewController(withIdentifier: "CreateGoalVC") else {return}
        presentVC(createGoalVC)
    }
    
    // MARK: - CoreData Methods
    func fetchData(completion: (_ success: Bool) -> ()) {
        guard let contextManager = appDelegate?.persistentContainer.viewContext else {return}
        let request = NSFetchRequest<Goal>(entityName: "Goal")
        do {
            goals = try contextManager.fetch(request)
            completion(true)
        } catch {
            debugPrint("Error fetching data \(error.localizedDescription)")
            completion(false)
        }
    }
    
    
}

extension GoalVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell", for: indexPath) as? GoalCell
            else {return UITableViewCell()}
        let goal = goals[indexPath.row]
        cell.configureCell(goal: goal)
        return cell
    }
    
}

