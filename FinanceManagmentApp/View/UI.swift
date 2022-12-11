//
//  UI.swift
//  FinanceManagmentApp
//
//  Created by Zahra Majed Alzawad on 14/05/1444 AH.
//

import Foundation
import SwiftUI

//MARK: Buttons
struct LargeButton: View {
    var text: String
    var isfilled: Bool
    var clicked: (() -> Void)
    
    var body: some View {
        Button(action: clicked) {
            Text(text)
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(isfilled ? Color.white : Color("AccentGreenLight"))
                .background(Color( isfilled ? "AccentGreenLight" : "AccentGreenVariantLight")
                    .cornerRadius(14)
                    .frame(width: 355, height: 43))
        }
    }
}

struct MediumButton: View {
    var text: String
    var isfilled: Bool
    var clicked: (() -> Void)
    
    var body: some View {
        Button(action: clicked) {
            Text(text)
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(isfilled ? Color.white : Color("AccentGreenLight"))
                .background(Color( isfilled ? "AccentGreenLight" : "AccentGreenVariantLight")
                    .cornerRadius(14)
                    .frame(width: 200, height: 43))
        }
    }
}

struct PlainButton: View {
    var text: String
    var clicked: (() -> Void)
    
    var body: some View {
        Button(action: clicked) {
            Text(text)
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(Color("AccentGreenLight"))
                .padding(20)
        }
    }
}

//MARK: Text Field
struct CustomTextField: View {
    var textFieldLabel: String
    var textFieldHint: String
    var isSwitch: Bool
    var isCurrancy: Bool
    @Binding var userInput: String
    
    var body: some View {
        VStack(alignment: .leading){
            Text(textFieldLabel)
                .font(.subheadline)
                .foregroundColor(Color("Gray2"))
                .padding([.top, .leading, .trailing], 12)
                .padding(.bottom, 5)
            TextField(textFieldHint, text: $userInput)
                .disableAutocorrection(true)
                .foregroundColor(Color.black)
                .padding([.leading, .bottom, .trailing], 12)
        }
        .background(Color("Gray4"))
        .cornerRadius(14)
        .frame(width: 355, height: 65)
    }
}
// CustomTextField Refrence
//https://medium.com/@khageshp/floatingtextfield-in-swiftui-b46b86298825

struct CustomPhoneTextField: View {
    var countryPhoneCode: String
    @Binding var userInput: String
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Phone number")
                .font(.subheadline)
                .foregroundColor(Color("Gray2"))
                .padding([.top, .leading, .trailing], 12)
                .padding(.bottom, 5)
            HStack {
                Text("+ \(countryPhoneCode)")
                TextField("650-555-1234", text: $userInput)
                    .keyboardType(.numberPad)
                    .foregroundColor(Color.black)
            }
            .padding([.leading, .bottom, .trailing], 12)
        }
        .background(Color("Gray4"))
        .cornerRadius(14)
        .frame(width: 355, height: 65)
    }
}

//TODO: Either in the same struct or seprate struct
struct CustomTextFieldWithSwitch {
    
}

struct CustomTextFieldWithCurrancy {
    
}

struct CustomTextFieldWithDate: View {
    let textFieldLabel: String
    let datePickerTitle: String
    //data picker
    @Binding var selectedDate : Date
    @State private var isHidden = true
    let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter
      }()
    
    var body: some View {
        HStack {
            VStack(alignment: .leading){
                Text(textFieldLabel)
                    .font(.subheadline)
                    .foregroundColor(Color("Gray2"))
                    .padding([.top, .leading, .trailing], 12)
                    .padding(.bottom, 5)
                TextField("MM/DD/YYYY", value: $selectedDate, formatter: formatter)
                    .disableAutocorrection(true)
                    .foregroundColor(Color.black)
                    .padding([.leading, .bottom, .trailing], 12)
            }
            Image(systemName: "calendar")
                .resizable()
                .frame(width: 30, height: 30)
                .padding(.trailing)
                .foregroundColor(Color("AccentGreenLight"))
        }
        .background(Color("Gray4"))
        .cornerRadius(14)
        .frame(width: 355, height: 65)
        .onTapGesture {
            self.onExpandTapped()
        }
        
        if !isHidden {
            VStack {
                Spacer()
                HStack{
                    //icon
                    Text(datePickerTitle)
                        .font(.headline)
                        .fontWeight(.bold)
                }
                //.padding(.vertical, 17.0)
                Spacer()
                DatePicker("", selection: $selectedDate, displayedComponents: .date)
                    .frame(width: 390)
                    //.padding(.bottom, 17.0)
                    .datePickerStyle(.wheel)
                    .labelsHidden()
                Spacer()
                MediumButton(text: "Done", isfilled: false) {
                    isHidden.toggle()
                }
                .padding(.bottom, 17.0)
                Spacer()
            }
            .frame(width: 390, height: 350, alignment: .bottom)
            .background(
                Rectangle()
                    .fill(Color.white)
                    .cornerRadius(12, corners: [.topLeft, .topRight])
                    .shadow(color: Color.gray.opacity(0.25), radius: 8, x: 0,y: -10))
            
        }
    }
    private func onExpandTapped() {
       isHidden.toggle()
       UIApplication.shared.endEditing()
    }
}

//MARK: Extensions
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

