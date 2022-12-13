//
//  FaceIdPermission.swift
//  FinanceManagmentApp
//
//  Created by Zahra Majed Alzawad on 19/05/1444 AH.
//

import SwiftUI
import LocalAuthentication

struct FaceIdPermission: View {
    //MARK: vars
    @AppStorage("faceId_Status") var isFaceIDEnabled = false
    @State var isEnableLater: Bool = false
    
    //MARK: body
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                ViewTitleDescription(viewTitle: "Enable Face ID", viewDescription: "Face Id is a convenient and secure method to signin")
                Spacer(minLength: 490)
                
                LargeButton(text: "Enable", isfilled: true) {
                    authenticate()
                }
                NavigationLink(destination: Login(), isActive: $isFaceIDEnabled) {
                }.labelsHidden()
                
                PlainButton(text: "Maybe Later") {
                    isEnableLater = true
                }
                Spacer()
                NavigationLink(destination: NotificationsPermission(), isActive: $isEnableLater) {
                }.labelsHidden()
            }
        }
    }
    
    //MARK: functions
    func authenticate() {
        let context = LAContext()
        var error: NSError?

        // check whether biometric authentication is possible
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // it's possible, so go ahead and use it
            let reason = "Face Id is a convenient and secure method to signin"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                // authentication has now completed
                if success {
                    // authenticated successfully
                    isFaceIDEnabled = true
                    //....
                } else {
                    // there was a problem
                   return
                }
            }
        } else {
            // no biometrics
            return
        }
    }
}

struct FaceIdPermission_Previews: PreviewProvider {
    static var previews: some View {
        FaceIdPermission()
    }
}
