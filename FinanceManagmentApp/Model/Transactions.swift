//
//  Transactions.swift
//  FinanceManagmentApp
//
//  Created by Zahra Majed Alzawad on 20/05/1444 AH.
//

import Foundation

struct Transaction: Codable, Hashable {
    let date, payee, amount : String
}

struct Transactions: Codable {
    let transactions : [Transaction]
}
