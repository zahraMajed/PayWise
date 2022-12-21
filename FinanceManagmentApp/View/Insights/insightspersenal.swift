//
//  insightspersenal.swift
//  FinanceManagmentApp
//
//  Created by raghad khalid alsaif on 27/05/1444 AH.
//

import SwiftUI
import SwiftUICharts

struct insightspersenal: View {
    var body: some View {
        VStack(spacing: 17){
            
            ViewTitleDescription(viewTitle: "Personal Account", viewDescription: "This insight responsible for tracking your monthly spending, and gave you a feedback.")
            
                .padding(17)
                .font(.headline)
            
            

            BarChartView(data: ChartData(values: [("January", 100), ("February",400), ("March", 200), ("April", 300),("May",3),("June",40)]), title: "", form: CGSize(width: 370, height: 350), animatedToBack: true).padding(.bottom, 45.0)
                
            ZStack{
               Rectangle()
                    .fill(Color("Gray4"))
                    .frame(width: 370, height: 65)
                    .cornerRadius(10)
                
                HStack{
                                Image(systemName: "arrow.up.forward.app")
                        .font(.system(size: 25))
                        .foregroundColor(Color("AccentGreenLight"))
                    
                        //.frame(width: 20,height: 34)
                    Spacer().frame(width: 1)
                                Text("You're on track to save more money this month Good Job!")
                        .padding(.all, 15.0)
                                 //   .background(Color("Gray4"))
                                  //  .cornerRadius(23)
                                    
                            }
            }
            
            
            
        }
            
        
    }
}

struct insightspersenal_Previews: PreviewProvider {
    static var previews: some View {
        insightspersenal()
    }
}
