//
//  User.swift
//  FinanceManagmentApp
//
//  Created by Zahra Majed Alzawad on 19/05/1444 AH.
//

import Foundation

class User: ObservableObject {
    @Published var name = ""
    @Published var countryPhoneCode = ""
    @Published var phoneNumber = ""
    @Published var dateOfBirth = Date.now
    @Published var nationalID = ""
    var personalAccount : PersonalAccount
    var liabilitiesAccount : LiabilitiesAccount
    
    init(personalAccount: PersonalAccount, liabilitiesAccount: LiabilitiesAccount) {
        self.personalAccount = personalAccount
        self.liabilitiesAccount = liabilitiesAccount
    }
}
