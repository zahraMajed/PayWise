//
//  APIService.swift
//  FinanceManagmentApp
//
//  Created by Zahra Majed Alzawad on 20/05/1444 AH.
//

import Foundation
import Combine

class APIService {
    
    static let shared = APIService()
    
    //MARK: GET All Transactions
    func getAllTransactions() -> AnyPublisher<[Transaction], Error> {
        let endPoint = "transactions"
        
        guard let url = URL(string: "\(API.baseURL)\(endPoint)\(API.token)") else {
            return Fail(error: "Unable to generate url" as! Error).eraseToAnyPublisher()
        }
        
        let request = URLRequest(url: url)
        
        return Future {
            promise in
            URLSession.shared.dataTask(with: request) { (data, _, _) in
                DispatchQueue.main.async {
                    do {
                        guard let data = data else {
                            print("we've returend promise with failure why? we couldn't featch data APIService")
                            return promise(.failure("Something went wrong" as! Error))
                        }
                        print("JSON String: \(String(data: data, encoding: .utf8))")
                        let transactionsArr = try JSONDecoder().decode(Transactions.self, from: data)
                        print("We've returend promise with success why? we decode the data into Transactions APIService")
                        return promise(.success(transactionsArr.transactions))
                    } catch let error {
                        print("We've caouth an error \(error) in APIService")
                        return promise(.failure(error))
                    }
                }
            }.resume()
        }.eraseToAnyPublisher()
    }
}
