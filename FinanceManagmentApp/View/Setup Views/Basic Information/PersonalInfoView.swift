//
//  PersonalInfoView.swift
//  FinanceManagmentApp
//
//  Created by raghad khalid alsaif on 20/05/1444 AH.
//

import SwiftUI

struct PersonalInfoView: View {
    //MARK: vars
    @EnvironmentObject var userData : User
    
    @State private var selectedDate: Date = Date.now
    @State private var showNextView: Bool = false
    
    @State private var showSheet : Bool = false
    @State private var shouldGo : Bool = false
    
    //MARK: body
    var body: some View {
        VStack(alignment: .leading){
            Spacer()
            ViewTitleDescription(viewTitle: "Personal Information", viewDescription: "Please fill the information ")
            VStack {
                CustomTextField(textFieldLabel: "Name", textFieldHint: "Enter Your name", isSwitch: false, isCurrancy: false, userInput: $userData.name)
                
                CustomTextFieldWithDate(textFieldLabel: "Date of Bitrh", datePickerTitle: "Date of birth", selectedDate: $selectedDate)
                
                CustomTextField(textFieldLabel: "National ID", textFieldHint: "1111111111", isSwitch: false, isCurrancy: false, userInput: $userData.nationalID)
            }
            
            LargeButton(text: "Continue", isfilled: true) {
                showNextView = true
            }
          
            Spacer()
            
        }
        NavigationLink(destination: SetupInfoView(), isActive: $showNextView) {
        }.labelsHidden()
    }
}

struct PersonalInfoView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalInfoView()
            .environmentObject(User())
    }
}