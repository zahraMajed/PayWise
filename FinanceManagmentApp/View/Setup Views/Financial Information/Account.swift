//
//  Account.swift
//  FinanceManagmentApp
//
//  Created by ashwaq almuzaini on 24/05/1444 AH.
//

import SwiftUI

struct Account: View {
   
        @State private var isOn1:Bool = true
        @State private var isOn2:Bool = false
        @State private var isOn3:Bool = false
        
        var body: some View {
            
            VStack(spacing:17){
                Spacer()
                ZStack{
                    Text ("Account")
                        .bold()
                        .font(.largeTitle)
                        .frame(width: 350, alignment: .topLeading)
                        .offset(y:-340)
            
             
                    
                    VStack{
                        ZStack{
                            RoundedRectangle(cornerRadius: 25)
                                .foregroundColor(Color("Gray4"))
                                .frame(width: 365, height: 200)
                                .frame(width: 360, alignment: .center)
                                .offset(y:70)
                            
                            Text("Basic Information")
                                .font(.title2)
                                .frame(width: 350, alignment: .leading)
                                .offset(y:-10)
                               
                            Text("Your Name")
                                .font(.system(.title2))
                                .frame(width: 350, alignment: .leading)
                                .offset(y:25)
                            Text("Zahra Alzawad")
                                .font(.subheadline)
                                .frame(width: 350, alignment: .leading)
                                .offset(y:60)
                                .foregroundColor(Color.gray)
                            Divider()
                                .offset(y:80)
                                .frame(width: 300, height: 0.5)
                                .frame(width: 360, alignment: .topLeading)
                            HStack{
                                Text("Phone Number")
                                    .font(.title2)
                                    .frame(width: 340, alignment: .trailing)
                                    .offset(x:15 , y:110)
                                
                                Spacer()
                                    .frame(width: 70)
                                Button("Edit") {
                                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                                }
                                
                                .frame(width: 360, alignment: .topLeading)
                                .offset( x:110, y:110)
                                .foregroundColor(Color("AccentGreenLight"))
                            }
                            
                            Text("966550000000")
                                .font(.subheadline)
                                .frame(width: 350, alignment: .topLeading)
                                .offset(y:145)
                                .foregroundColor(Color.gray)
                        }
                        
                        
                        
                        VStack{
                            RoundedRectangle(cornerRadius: 25)
                                .foregroundColor(Color("Gray4"))
                                .frame(width: 365, height: 190)
                                .frame(width: 360, alignment: .center)
                                .offset(y:70)
                            
                            Text("Settings")
                                .font(.system(.title2))
                                .frame(width: 340, alignment: .topLeading)
                                .offset(y:-120)
                               
                            HStack{
                                Text("Monthly Incom")
                                    .font(.title2)
                                    .frame(width: 340, alignment: .trailing)
                                    .offset(x: 70, y:-110)
                                
                                Spacer()
                                    .frame(width: 180)
                                Button("Edit") {
                                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                                }
                                
                                .frame(width: 360, alignment: .leading)
                                .offset( x:56, y:-110)
                                .foregroundColor(Color("AccentGreenLight"))
                            }
                            
                            Text("500$")
                                .font(.subheadline)
                                .frame(width: 350, alignment: .topLeading)
                            
                                .offset(y:-100)
                            
                                .frame(width: 360, alignment: .topTrailing)
                                .foregroundColor(Color.gray)
                            Divider()
                                .offset(y:-110)
                                .frame(width: 300, height: 0.5)
                                .frame(width: 360, alignment: .topLeading)
                            HStack{
                                Text("Language / لغة")
                                
                                    .font(.title2)
                                    .frame(width: 350, alignment: .topLeading)
                                    .offset(y:40)
                                
                                    .frame(width: 360, alignment: .topTrailing)
                                    .offset(x:260, y:-150)
                                Spacer()
                                    .frame(width: 180)
                                Button("Edit") {
                                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                                }
                                
                                .frame(width: 340, alignment: .leading)
                                .offset( x:35, y:-110)
                                .foregroundColor(Color("AccentGreenLight"))
                                
                            }
                            Text("English")
                                .font(.subheadline)
                                .frame(width: 340, alignment: .topLeading)
                                .offset(y:-100)
                                .foregroundColor(Color.gray)
                        }
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 25)
                                .foregroundColor(Color("Gray4"))
                                .frame(width: 365, height: 190)
                                .frame(width: 360, alignment: .center)
                                .offset(y:-70)
                            
                            HStack{
                                Toggle("Notifications", isOn: $isOn1)
                                    .frame(width: 340, alignment: .leading)
                                    .offset(y:-120)
                                    .font(.title2)
                                    .tint(Color("AccentGreenLight"))
                                    
                            }
                            Divider()
                                .offset(y:-90)
                                .frame(width: 350, height: 0.5)
                                .frame(width: 360, alignment: .topTrailing)
                            HStack{
                                
                                Toggle("Dark mode", isOn: $isOn2)
                                    .frame(width: 340, alignment: .leading)
                                    .offset(y:-70)
                                    .font(.title2)
                                    .tint(Color("AccentGreenLight"))
                                    
                            }
                            Divider()
                                .offset(y:-40)
                                .frame(width: 350, height: 0.5)
                                .frame(width: 360, alignment: .topLeading)
                                    ZStack{
                                        Toggle("Enable online payment", isOn: $isOn3)
                                        
                                            .frame(width: 340, alignment: .leading)
                                            .offset(y:-20)
                                            .font(.title2)
                                            .tint(Color("AccentGreenLight"))
                                           
                                    
                            }
                        }
                    }
                }
                .padding(.vertical,200)}
        }
        
    }
                           
                          
struct Account_Previews: PreviewProvider {
    static var previews: some View {
        Account()
    }
}
