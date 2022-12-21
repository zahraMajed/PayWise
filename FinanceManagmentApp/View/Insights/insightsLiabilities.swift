//
//  insightsLiabilities.swift
//  FinanceManagmentApp
//
//  Created by raghad khalid alsaif on 27/05/1444 AH.
//

import SwiftUI
import SwiftUICharts

struct insightsLiabilities: View {
    let chartStyle = ChartStyle(backgroundColor: .white, accentColor: Color("AccentGreenLight"), secondGradientColor: Color("AccentGreenLight"), textColor: .black, legendTextColor: .gray, dropShadowColor: .white)
    var body: some View {
        VStack(){
            Spacer()
            ViewTitleDescription(viewTitle: "Liabilities Account", viewDescription: "This insight responsible your Liabilities in PieChart.")
            Spacer()
            
            PieChartView(data: [8,23,54,32], title: "Liabilities",style: chartStyle, form: CGSize(width: 370, height: 350)).padding(.bottom, 45.0)
            Spacer()
        }
    }
}

struct insightsLiabilities_Previews: PreviewProvider {
    static var previews: some View {
        insightsLiabilities()
    }
}
