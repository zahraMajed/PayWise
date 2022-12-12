//
//  LoginViewModel.swift
//  FinanceManagmentApp
//
//  Created by Zahra Majed Alzawad on 18/05/1444 AH.
//

import Foundation
import SwiftUI
import Firebase

class LoginViewModel: ObservableObject {
    //MARK: vars
    @Published var phoneNumber = ""
    // otp
    @Published var enteredOTPText : String = ""
    @Published var otpFields : [String] = Array(repeating: "", count: 6)
    // DataModel For Error View
    @Published var errorMsg = ""
    @Published var isError = false
    // storing code for verification
    @Published var firebaseOTPcode = ""
    @Published var shouldGoToVerify = false
    //loading view
    @Published var isLoading = false
    // user logged status
    @AppStorage("log_Status") var isLoggedIn = false
    @Published var shouldGoToPersonalInfo  = false
    
    //MARK: function
    func getCountryCode() -> String {
        let regionCode = Locale.current.language.region?.identifier ?? ""
        return countriesPhoneCode[regionCode] ?? ""
    }
    
    func sendOTP() async {
        //if isLoading {return}
        do {
            DispatchQueue.main.async {
                self.isLoading = true
            }
            Auth.auth().settings?.isAppVerificationDisabledForTesting = true
            let number = "+\(getCountryCode()) \(phoneNumber)"
            let result = try await PhoneAuthProvider.provider().verifyPhoneNumber(number, uiDelegate: nil)
            DispatchQueue.main.async {
                self.isLoading = false
                self.firebaseOTPcode = result
                self.shouldGoToVerify = true
            }
        } catch {
            handleError(error: error.localizedDescription)
        }
    }
    
    func verifyOTPithoutSignin() async {
        do{
            DispatchQueue.main.async {
                self.enteredOTPText = self.otpFields.reduce("") { partialResult, value in
                   partialResult + value
                }
                self.isLoading = true
            }
            let credential = PhoneAuthProvider.provider().credential(withVerificationID: self.firebaseOTPcode, verificationCode: enteredOTPText)
            let _ = try await Auth.auth().signIn(with: credential)
            try Auth.auth().signOut()
            DispatchQueue.main.async {
                self.shouldGoToPersonalInfo = true
            }
        } catch{
            handleError(error: error.localizedDescription)
        }
    }

    
    func verifyOTP() async {
        do{
            DispatchQueue.main.async {
                self.enteredOTPText = self.otpFields.reduce("") { partialResult, value in
                   partialResult + value
                }
                self.isLoading = true
            }
            let credential = PhoneAuthProvider.provider().credential(withVerificationID: self.firebaseOTPcode, verificationCode: enteredOTPText)
            let _ = try await Auth.auth().signIn(with: credential)
            DispatchQueue.main.async {
                self.isLoading = false
                self.isLoggedIn = true
            }
        } catch{
            handleError(error: error.localizedDescription)
        }
    }
    
    func requestCode(){
        Task{await sendOTP()}
        withAnimation {
            self.errorMsg = "Code Sent Successfully"
            self.isError.toggle()
        }
    }
    
    func handleError(error: String){
        DispatchQueue.main.async {
            self.isLoading = false
            self.errorMsg = error
            self.isError.toggle()
        }
    }
}
