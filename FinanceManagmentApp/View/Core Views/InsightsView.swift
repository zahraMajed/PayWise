//
//  InsightsView.swift
//  FinanceManagmentApp
//
//  Created by Zahra Majed Alzawad on 24/05/1444 AH.
//

import SwiftUI

struct InsightsView: View {
    var body: some View {
        TabView{
            insightspersenal()
            insightsLiabilities()
            insightsBusiness()
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
            .indexViewStyle(.page(backgroundDisplayMode: .always)
                )
            
    }
}

struct InsightsView_Previews: PreviewProvider {
    static var previews: some View {
        InsightsView()
    }
}
