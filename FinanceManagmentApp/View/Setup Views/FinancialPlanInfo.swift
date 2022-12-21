
//

import SwiftUI

struct FinancialPlanInfo: View {
    @State private var showNextView: Bool = false
    var body: some View {
        
        VStack(alignment: .leading, spacing: 15){
        
            Image("cards")
                .resizable()
            
            ViewTitleDescription(viewTitle: "We are preparing a financial plan", viewDescription: "")
                .padding(.leading)

        HStack{
            Text("1")
                .foregroundColor(.white)
                .padding(9)
                .background(Color("AccentPurpleLight"))
                .clipShape(Circle())
                .padding(.leading)

            
            Text("Personal card to enjoy your time")
                .frame(maxWidth: .infinity, alignment: .leading)

            }
            
 
//          .frame(height: 85)
            HStack{
                
                Text("2")
                    .foregroundColor(.white)
                    .padding(9)
                    .background(Color("AccentPurpleLight"))
                    .clipShape(Circle())
                    .padding(.leading)
            
                Text("Liabilities card to pay recurring expenses")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            HStack{
                
                Text("3")
                    .foregroundColor(.white)
                    .padding(9)
                    .background(Color("AccentPurpleLight"))
                    .clipShape(Circle())
                    .padding(.leading)
            
                Text("Business card to achieve your gouls")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
           
            LargeButton(text: "Start", isfilled: true) {
               showNextView = true
            }
            
            .padding(5)
            .padding(.leading)
            Spacer()
            
            NavigationLink(destination: FinancialInfoView(), isActive: $showNextView) {
            }.labelsHidden()
        }
        
    }
}

struct FinancialPlanInfo_Previews: PreviewProvider {
    static var previews: some View {
        FinancialPlanInfo()
    }
}
