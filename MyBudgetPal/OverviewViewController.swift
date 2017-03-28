//
//  OverviewViewController.swift
//  MyBudgetPal
//
//  Created by Christian Raroque on 3/26/17.
//  Copyright © 2017 AloaLabs. All rights reserved.
//

import UIKit
import RealmSwift

class OverviewViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let dataManager = DataManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        loadData()
    }
    
    func loadData() {
        dataManager.expenses = dataManager.getExpensesForDate(date: NSDate() as Date)
        dataManager.budgets = dataManager.getBudgets()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let budget = dataManager.budgets[section]
        return dataManager.FilterExpensesForBudget(expenses: dataManager.expenses, budget: budget).count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataManager.budgets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "budgetCell", for: indexPath) as! BudgetCell
        
        let budget = dataManager.budgets[indexPath.section]
        let expenses = dataManager.FilterExpensesForBudget(expenses: dataManager.expenses, budget: budget)
        let expense = expenses[indexPath.row]
        
        return cell
    }
    
    
}
