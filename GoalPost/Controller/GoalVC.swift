//
//  GoalVC.swift
//  GoalPost
//
//  Created by Milan Bojic on 11/19/18.
//  Copyright © 2018 Milan Bojic. All rights reserved.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as! AppDelegate

class GoalVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var goals = [Goal]()
    let contextManager = appDelegate.persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        fetchNew()
        tableView.reloadData()
    }
    
    @IBAction func addGoalButton(_ sender: Any) {
        guard let createGoalVC = storyboard?.instantiateViewController(withIdentifier: "CreateGoalVC") else {return}
        presentVC(createGoalVC)
    }
    
    func setProgress(atIndexPath indexPath: IndexPath) {
        let chosenGoal = goals[indexPath.row]
        if chosenGoal.goalProgress < chosenGoal.goalCompletionValue {
            chosenGoal.goalProgress += 1
        } else {
            return
        }
        do {
            try contextManager.save()
        } catch {
            debugPrint("Error setting progress: \(error.localizedDescription)")
        }
    }
    
    // MARK: - CoreData Methods
    func fetchData(completion: (_ success: Bool) -> ()) {
        let request = NSFetchRequest<Goal>(entityName: "Goal")
        do {
            goals = try contextManager.fetch(request)
            completion(true)
        } catch {
            debugPrint("Error fetching data \(error.localizedDescription)")
            completion(false)
        }
    }
    
    func fetchNew() {
        fetchData { (success) in
            if success {
                if goals.count >= 1 {
                    tableView.isHidden = false
                } else {
                    tableView.isHidden = true
                }
            }
        }
    }
    
    func removeData(atIndexPath indexPath: IndexPath) {
        contextManager.delete(goals[indexPath.row])
        do {
            try contextManager.save()
        } catch {
            debugPrint("Error removing object: \(error.localizedDescription)")
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
    // Implementing DELETE and ADD 1 DAY functionality on tableView row
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "DELETE") { (rowAction, indexPath) in
            self.removeData(atIndexPath: indexPath)
            self.fetchNew()
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        let addAction = UITableViewRowAction(style: .normal, title: "ADD 1 DAY") { (rowAction, indexPath) in
            self.setProgress(atIndexPath: indexPath)
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        
        deleteAction.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        addAction.backgroundColor = #colorLiteral(red: 0.9522624913, green: 0.5417531474, blue: 0.1679017905, alpha: 1)
        return [deleteAction, addAction]
    }
    
}

