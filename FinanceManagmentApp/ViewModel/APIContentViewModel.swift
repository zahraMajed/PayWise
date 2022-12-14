//
//  APIContentViewModel.swift
//  FinanceManagmentApp
//
//  Created by Zahra Majed Alzawad on 20/05/1444 AH.
//

import Foundation
import Combine

class APIContentViewModel: ObservableObject {
    //MARK: vars
    @Published var currentState: ViewState = .START
    private var cancelables = Set<AnyCancellable>()
    //MARK: enum
    enum ViewState {
        case START
        case LOADING
        case SUCCESS(transactions: [Transaction])
        case FAILURE(error: String)
    }
    
    //MARK: init
    init() {
        getTransactions()
    }
    
    //MARK: functions
    func getTransactions() {
        self.currentState = .LOADING
        APIService.shared.getAllTransactions()
            .sink { completion in
                switch completion {
                case .finished:
                    print("Execution Finihsed.")
                case .failure(let error):
                    self.currentState = .FAILURE(error: error.localizedDescription)
                    print(" .FAILURE line 35 error APIContentViewModel")
                }
            } receiveValue : { transactions in
                self.currentState = .SUCCESS(transactions: transactions)
            }.store(in: &cancelables)
    }

}
