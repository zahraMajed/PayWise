//
//  UI.swift
//  FinanceManagmentApp
//
//  Created by Zahra Majed Alzawad on 14/05/1444 AH.
//

import Foundation
import SwiftUI
import LocalAuthentication

//MARK: Title and Description
struct ViewTitleDescription : View {
    var viewTitle: String
    var viewDescription: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            Text(viewTitle)
                .font(.title)
                .fontWeight(.bold)
            Text(viewDescription)
                .font(.callout)
                .fontWeight(.regular)
        }
    }
}

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
                .frame(width: 355, height: 43)
                .background(Color( isfilled ? "AccentGreenLight" : "AccentGreenVariantLight"))
                .cornerRadius(14)
        }
    }
}

struct LargeButton2: View {
    var text: String
    var isfilled: Bool
   // var clicked: (() -> Void)
    
    var body: some View {
      //  Button(action: clicked) {
            Text(text)
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(isfilled ? Color.white : Color("AccentGreenLight"))
                .background(Color( isfilled ? "AccentGreenLight" : "AccentGreenVariantLight")
                    .cornerRadius(14)
                    .frame(width: 355, height: 43))
       // }
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
                .frame(width: 200, height: 43)
                .background(Color( isfilled ? "AccentGreenLight" : "AccentGreenVariantLight"))
                .cornerRadius(14)
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
        .frame(width: 355, height: 65)
        .background(Color("Gray4"))
        .cornerRadius(14)
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
        .frame(width: 355, height: 65)
        .background(Color("Gray4"))
        .cornerRadius(14)
    }
}

struct OTPTextField: View {
    @ObservedObject var loginData : LoginViewModel
    @FocusState var activeOtpField : OTPField?
    
    var body: some View {
        HStack(spacing: 10){
            ForEach(0..<6, id: \.self) { index in
                ZStack() {
                    Rectangle()
                        .fill(activeOtpField == fieldActiveStateForIndex(index: index) ?   Color("Gray3") : Color("Gray4"))
                    .cornerRadius(12)
                    
                    TextField("", text: $loginData.otpFields[index])
                        .keyboardType(.numberPad)
                        .textContentType(.oneTimeCode)
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.center)
                        .focused($activeOtpField, equals: fieldActiveStateForIndex(index: index))
                }.frame(width: 50, height: 65)
            }
            .onChange(of: loginData.otpFields) { newValue in
                OTPFieldsCondition(newOTPFieldValue: newValue)
            }
        }
    }
    
    //MARK: functions
    func OTPFieldsCondition(newOTPFieldValue: [String]){
        
        // checking if OTP is pressed
        for index in 0..<6{
            if newOTPFieldValue[index].count == 6 {
                DispatchQueue.main.async {
                    loginData.enteredOTPText = newOTPFieldValue[index]
                    loginData.otpFields[index] = ""
                    
                    // updating all textfields with value
                    for item in loginData.enteredOTPText.enumerated() {
                        loginData.otpFields[item.offset] = String(item.element)
                    }
                }
                return
            }
        }
        // moving next field if current field typed
        for index in 0..<5{
            if newOTPFieldValue[index].count == 1 && fieldActiveStateForIndex(index: index) == activeOtpField {
                activeOtpField = fieldActiveStateForIndex(index: index + 1)
            }
        }
        // moving back if current is empty and previous is not empty
        for index in 1...5{
            if newOTPFieldValue[index].isEmpty && !newOTPFieldValue[index - 1].isEmpty {
                activeOtpField = fieldActiveStateForIndex(index: index - 1)
            }
        }
        
        // in case user type more than 1 number in a feild -> we will take the last one
        // force the arrey to have one number in each index
        for index in 0..<6 {
            if newOTPFieldValue[index].count > 1 {
                loginData.otpFields[index] = String(newOTPFieldValue[index].last!)
            }
        }
    }
    func fieldActiveStateForIndex(index: Int) -> OTPField {
        switch index {
        case 0: return .field1
        case 1: return .field2
        case 2: return .field3
        case 3: return .field4
        case 4: return .field5
        default: return .field6
        }
    }
}

//MARK: FocusState Enum
enum OTPField{
    case field1
    case field2
    case field3
    case field4
    case field5
    case field6
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


struct CheckView: View {
    @State var isChecked:Bool = false
    var title:String
    func toggle(){isChecked = !isChecked}
    var body: some View {
        Button(action: toggle){
            
            HStack{
                Image(systemName: isChecked ? "checkmark.square.fill": "square")
                    .foregroundColor(.green)
                Text(title)
            }
        }.foregroundColor(.black)
          
    }
}


struct CardDesign : View {
    //MARK: vars
    /*var cardType: String
    var cardNumber: String
    var cardCVV: String
    var cardColor: String
    var cardExpDate: String*/
    var cardInfo: CardInfo
    @State var showInfo : Bool = false
    @State var showFaceID : Bool = false
    var isEyeHiddin : Bool = true
    let star = "***"
    
    //MARK: body
    var body: some View {
        VStack(spacing: 30) {
                HStack {
                    Text(cardInfo.cardName)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        Spacer()
                    
                    Button {
                        showFaceID.toggle()
                        if showFaceID {
                            authenticate()
                        } else {
                            showInfo = false
                        }
                    } label: {
                        Image(systemName: showInfo ? "eye.slash" : "eye")
                    }
                    .foregroundColor(.white)

                }
                .padding(15)
            Text(showInfo ? cardInfo.cardNumber : customisedCardNumber(number: cardInfo.cardNumber))
                .font(.title)
                .fontWeight(.regular)
                .foregroundColor(.white)
                .padding(15)
                HStack{
                    Text("Exp: \(cardInfo.cardExpDate)")
                        .font(.headline)
                        .fontWeight(.regular)
                        .foregroundColor(.white)
                        
                    Spacer()
                    Text("CVV: \(showInfo ? cardInfo.cardCVV : star)")
                        .font(.headline)
                        .fontWeight(.regular)
                        .foregroundColor(.white)
                        
                }.padding(15)
            }
            .frame(width: 358, height: 224)
            .background(Color(cardInfo.cardColor))
            .cornerRadius(12)
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
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?

        // check whether biometric authentication is possible
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // it's possible, so go ahead and use it
            let reason = "We need to unlock your data.!"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                // authentication has now completed
                if success {
                    // authenticated successfully
                    DispatchQueue.main.async {
                        showInfo = true
                    }
                } else {
                    // there was a problem
                    print("faceid ui")
                    print(error)
                   return
                }
            }
        } else {
            // no biometrics
            print("faceid ui no")
            print(error)
            return
        }
    }
}


struct AccountServicesSegmentedPicker: View {
    //MARK: vars
    var currentAccountType : accountType
    @Binding var selectedOption : accountServicesOptions
    
    enum accountServicesOptions : String , CaseIterable, Identifiable {
        case transactions = "Transactions"
        case manage = "Manage"
        case detailes = "Detailes"
        case goals = "Goals"
        case liabilities = "Liabilities"
        
        var id: accountServicesOptions { self }
    }
    //MARK: body
    var body: some View {
         Picker("Account Services", selection: $selectedOption) {
             ForEach(accountServicesOptions.allCases) { option in
                 
                 if option.rawValue != "Goals" && option.rawValue !=  "Liabilities" {
                     Text(option.rawValue)
                 }
                 
                 if currentAccountType == .Business && option.rawValue == "Goals" {
                     Text(option.rawValue)
                 } else if currentAccountType == .Liabilities && option.rawValue == "Liabilities" {
                     Text(option.rawValue)
                 }
             }
         }
         .frame(maxWidth: 358)
         .pickerStyle(SegmentedPickerStyle())
    }
    
}
