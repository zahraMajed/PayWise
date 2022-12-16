//
//  WalletMain.swift
//  FinanceManagmentApp
//
//  Created by Zahra Majed Alzawad on 22/05/1444 AH.
//

import SwiftUI

struct WalletMain: View {
    
    //MARK: vars
    @EnvironmentObject var userData : User
    //MARK: Animation vars
    @State var expandCards: Bool = false
    //MARK: Details vars
    @State var currentCard: CardInfo?
    @State var showDetailCard: Bool = false
    
    //MARK: body
    var body: some View {
        NavigationView{
            VStack (alignment: .leading){
                Text("Wallet")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 0) {
                        //MARK: Card
                        ForEach(getCardsArr()) { card in
                            CardView(card: card)
                                .onTapGesture {
                                    withAnimation(.easeInOut(duration: 0.35)){
                                    currentCard = card
                                    showDetailCard = true
                                }
                            }
                        }
                    }
                    .overlay {
                        //To avoid Scrolling
                        Rectangle()
                            .fill(.black.opacity(expandCards ? 0 : 0.01))
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 0.35)){
                                    expandCards = true
                                }
                            }
                    }
                    //.padding(.top,expandCards ? 30 : 0)
                }//end scrole
                .coordinateSpace(name: "SCROLL")
                //you should delete the navigation view then
                if currentCard?.accountType == .Personal {
                    NavigationLink(destination: PersonalAccountView(currentCard: currentCard ?? CardInfo(accountType: .Personal, cardName: "", cardNumber: "", cardCVV: "", cardColor: "", cardExpDate: ""), userData: _userData), isActive: $showDetailCard) {}.labelsHidden()
                }else if currentCard?.accountType == .Liabilities {
                    Text("should go to Liabilities")
                } else if currentCard?.accountType == .Business {
                    Text("should go to Business")
                }
            }
            .padding([.horizontal, .top])
        }
    }
    
    //MARK: functions
    
    func getCardsArr() -> [CardInfo] {
        let cards = [userData.personalAccount.cardInfo, userData.liabilitiesAccount.cardInfo, userData.liabilitiesAccount2.cardInfo]
        return cards
    }
    
    //MARK: Card View
    @ViewBuilder
    func CardView(card: CardInfo) -> some View {
        GeometryReader { proxy in
            let rect = proxy.frame(in: .named("SCROLL"))
            let offset = CGFloat(getIndex(Card: card) * (expandCards ? 10 : 70))
            ZStack {
                Rectangle()
                    .fill(Color(card.cardColor))
                    .cornerRadius(12)
                
                VStack(spacing: 35) {
                    HStack {
                        Text(card.cardName)
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding(15)
                    Text(customisedCardNumber(number: card.cardNumber))
                        .font(.title)
                        .fontWeight(.regular)
                        .foregroundColor(.white)
                        //.padding(15)
                    HStack {
                        Text("Exp: \(card.cardExpDate)")
                            .font(.headline)
                            .fontWeight(.regular)
                            .foregroundColor(.white)
                            
                        Spacer()
                        Text("CVV: \(card.cardCVV)")
                            .font(.headline)
                            .fontWeight(.regular)
                            .foregroundColor(.white)
                    }
                    .padding(15)
                }
            }
            //making it as stack
            .offset(y: expandCards ? offset : -rect.minY + offset)
        }
        //MAX size (same as card size)
        .frame(height: 224)
    }
    
    //MARK: Retereiving Index
    func getIndex(Card: CardInfo)->Int{
        return getCardsArr().firstIndex { currentCard in
            return currentCard.id == Card.id
        } ?? 0
    }
    
    //MARK: Hiddin all number except the last 4
    func customisedCardNumber(number: String)->String{
        var newValue: String = ""
        let maxCount = number.count - 4
        number.enumerated().forEach { value in
            if value.offset >= maxCount{
                //Displaying Text
                let string = String(value.element)
                newValue.append(contentsOf: string)
            }
            else{
                //Simply Displaying star
                let string = String(value.element)
                if string == " "{
                    //Avoiding Spaces
                    newValue.append(contentsOf: " ")
                }
                else{
                    newValue.append(contentsOf: "*")
                }
            }
        }
        
        return newValue
    }
    
    
}

struct WalletMain_Previews: PreviewProvider {
    static var previews: some View {
        WalletMain()
            .environmentObject(User())
    }
}

/*var cards: [CardInfo] = [
    CardInfo(cardType: "Personal Card", cardNumber: "1111 2222 3333 4444", cardCVV: "333", cardColor: "Gray1", cardExpDate: "12/10"),
    CardInfo(cardType: "Business Card", cardNumber: "2222 3333 4444 1111", cardCVV: "444", cardColor: "AccentPurpleLight", cardExpDate: "12/10"),
    CardInfo(cardType: "Liabilites Card", cardNumber: "2222 4444 3333 1111", cardCVV: "333", cardColor: "PrimaryBlueLight", cardExpDate: "12/10")
]*/
