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
    //@AppStorage("faceId_Status") var isFaceIDEnabled = false
    @State var shouldGoToNotificationPermission: Bool = false
    
    //MARK: body
    var body: some View {
        VStack {
                Spacer()
                ViewTitleDescription(viewTitle: "Enable Face ID", viewDescription: "Face Id is a convenient and secure method to signin")
                Spacer(minLength: 490)
                
                LargeButton(text: "Enable", isfilled: true) {
                    authenticate()
                    shouldGoToNotificationPermission = true
                }
                                
                PlainButton(text: "Maybe Later") {
                    shouldGoToNotificationPermission = true
                }
                Spacer()
                NavigationLink(destination: NotificationsPermission(), isActive: $shouldGoToNotificationPermission) {
                }.labelsHidden()
        }
        
    }
    
    //MARK: functions
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
                    print("Face id is enabled now")
                    //....
                } else {
                    // there was a problem
                    print(error)
                   return
                }
            }
        } else {
            // no biometrics
            print("no biometrics")
            print(error)
            return
        }
    }
}

struct FaceIdPermission_Previews: PreviewProvider {
    static var previews: some View {
        FaceIdPermission()
    }
}
