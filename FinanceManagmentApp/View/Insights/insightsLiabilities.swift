//
//  insightsLiabilities.swift
//  FinanceManagmentApp
//
//  Created by raghad khalid alsaif on 27/05/1444 AH.
//

import SwiftUI
import SwiftUICharts

struct insightsLiabilities: View {
    var body: some View {
        VStack(spacing: 17){
            ViewTitleDescription(viewTitle: "Liabilities Account", viewDescription: "This insight responsible your Liabilities in PieChart.")
            Spacer()
            
            PieChartView(data: [(3.0), (5.0),(4.0),(2)], title: "Liabilities", form: CGSize(width: 370, height: 350)).padding(.bottom, 45.0)
            Spacer()
        }
    }
}

struct insightsLiabilities_Previews: PreviewProvider {
    static var previews: some View {
        insightsLiabilities()
    }
}
