//
//  TabMainView.swift
//  FinanceManagmentApp
//
//  Created by Reema Alsheddi on 15/12/2022.
//

import SwiftUI

struct TabMainView: View {
    var body: some View {
        TabView {
            WalletMain()
                .tabItem{Label("Wallet", systemImage: "creditcard")}
            InsightsView()
                .tabItem { Label("Insight", systemImage: "chart.bar") }
            VStack {}
                .tabItem { Label("Account", systemImage: "person") }
        }

    }
}

struct TabMainView_Previews: PreviewProvider {
    static var previews: some View {
        TabMainView()
            .environmentObject(User())
    }
}
