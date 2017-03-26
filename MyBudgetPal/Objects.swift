//
//  Objects.swift
//  MyBudgetPal
//
//  Created by Christian Raroque on 3/26/17.
//  Copyright © 2017 AloaLabs. All rights reserved.
//

import Foundation
import RealmSwift

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


