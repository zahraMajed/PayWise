//
//  TransactionsView.swift
//  FinanceManagmentApp
//
//  Created by Zahra Majed Alzawad on 20/05/1444 AH.
//

import SwiftUI

struct TransactionsView: View {
    @ObservedObject var apiViewModel = APIContentViewModel()
    
    var body: some View {
        // if apiViewModel currentState is SUCCESS, i'll get the data
        if case .SUCCESS(let transactionsArr) = apiViewModel.currentState {
            LazyVStack {
                ForEach(transactionsArr, id: \.self) { item in
                    TransactionRow(transactionPayee: item.payee, transactionAmount: item.amount, transactionDate: item.date)
                }
            }
        }
        
        // if apiViewModel currentState is FAILURE, i'll show the error
        else if case .FAILURE(let error) = apiViewModel.currentState {
            VStack(alignment: .center) {
                Spacer()
                Text(error)
                    .font(.headline.bold())
                    .multilineTextAlignment(.center)
                Spacer()
            }
            .padding()
        }
        // if apiViewModel currentState is LOADING, i'll show loading animation
        else if case .LOADING = apiViewModel.currentState {
            Text("loader")
                .font(.headline)
                .padding()
                .position(x:200, y:350)
        }
    
    }
}

struct TransactionRow : View {
    //MARK: vars
    var transactionPayee : String
    var transactionAmount : String
    var transactionDate : String
    //MARK: body
    var body: some View {
        HStack {
            Image("visaLogo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .padding(17)
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text(transactionPayee)
                        .font(.headline)
                        .fontWeight(.semibold)
                    Spacer()
                    Text(transactionAmount)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(transactionAmount.contains("-") ?  Color("SemanticRed") : Color("SemanticGreen"))
                        .padding(.trailing, 17.0)
                }
                Text(transactionDate)
                    .font(.subheadline)
                    .fontWeight(.regular)
                    .foregroundColor(Color(.secondaryLabel))
            }
        }
        .padding(10)
    }
}



struct TransactionsView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsView()
    }
}
