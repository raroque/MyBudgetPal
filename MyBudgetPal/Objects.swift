//
//  Objects.swift
//  MyBudgetPal
//
//  Created by Christian Raroque on 3/26/17.
//  Copyright © 2017 AloaLabs. All rights reserved.
//

import Foundation
import RealmSwift
import SwiftDate

class Budget: Object {
    dynamic var name = "None"
    dynamic var amoumt = 0.0
    dynamic var type = 0
}

class Expense: Object {
    dynamic var name = "None"
    dynamic var amount = 0.0
    dynamic var date = NSDate()
    
    dynamic var budget: Budget?
}

class DataManager: Object {
    
    func getBudgets() -> [Budget] {
        let realm = try! Realm()
        var budgets = [Budget]()
        
        let budgets_temp = realm.objects(Budget.self)
        if budgets_temp.count != 0 {
            for budget in budgets_temp {
                budgets.append(budget)
            }
        }
        
        return budgets
    }
    
    func getExpenses() -> [Expense] {
        let realm = try! Realm()
        var expenses = [Expense]()
        
        let expenses_temp = realm.objects(Expense.self)
        if expenses_temp.count != 0 {
            for expense in expenses_temp {
                expenses.append(expense)
            }
        }
        
        return expenses
    }
    
    func getExpensesForDate(date: Date) -> [Expense] {
        let realm = try! Realm()
        var expenses = [Expense]()
        
        var beginningOf = date.startOf(component: .day)
        var endOf = date.endOf(component: .day)
        
        let expenses_temp = realm.objects(Expense.self).filter("date > '\(beginningOf)' && date < '\(endOf)'")
        if expenses_temp.count != 0 {
            for expense in expenses_temp {
                expenses.append(expense)
            }
        }
        
        return expenses
    }
    
    func FilterExpensesForBudget(expenses: [Expense], budget: Budget) -> [Expense] {
        var filtered_expenses = [Expense]()
        
        for expense in expenses {
            if(expense.budget == budget) {
                filtered_expenses.append(expense)
            }
        }
        
        return filtered_expenses
    }
    
    func addBudget(budget: Budget) {
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(budget)
        }
    }
    
    func deleteBudget(budget: Budget) {
        let realm = try! Realm()
        
        try! realm.write {
            realm.delete(budget)
        }
    }
    
    func addExpense(expense: Expense) {
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(expense)
        }
    }
    
    func deleteExpense(expense: Expense) {
        let realm = try! Realm()
        
        try! realm.write {
            realm.delete(expense)
        }
    }
}

