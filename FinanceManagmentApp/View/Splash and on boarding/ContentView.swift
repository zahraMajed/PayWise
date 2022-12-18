//
//  ContentView.swift
//  OnBoarding1
//
//  Created by Shaden on 19/05/1444 AH.
//


// ContentView == it is the sign up page
// NotNow == should open sign up page
// @AppStorage == should show the on boarding for use only
// page view == structure of the page
// onboaring1 == on boarding view



import SwiftUI

struct ContentView: View {
//    @AppStorage("shouldshowonboarding") var shouldshowonboarding: Bool = true
    
    @State var shouldshowonboarding: Bool = true
    
    
    var body: some View {
        NavigationView{
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
            }
            .padding()
        }
        .fullScreenCover(isPresented: $shouldshowonboarding, content: {onboarding1(shouldshowonboarding: $shouldshowonboarding)})
    }
}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
//


struct onboarding1: View {
    @Binding var shouldshowonboarding: Bool
    var body: some View {
        TabView{
            PageView(title: "Easy way to manage your money", subtitle: "", imageName: "background1", showbutton: false, shouldshowonboarding: $shouldshowonboarding,
                     dissbutton: true)
            
            PageView(title: "Set your goal " ,
                     subtitle: "Set your goal to grow your money and achieve the goal you are aiming for " ,
                     imageName: "background",
                     showbutton: false,
                     shouldshowonboarding: $shouldshowonboarding,
                     dissbutton: false)

            
            PageView(title: "Track your goal " ,
                     subtitle: "Manage and track your goal depending on period of time and amount of money. " ,
                     imageName: "track",
                     showbutton: true,
                     shouldshowonboarding: $shouldshowonboarding,
                     dissbutton: false)
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        .ignoresSafeArea()
    }
}



struct PageView: View {
    let title: String
    let subtitle: String
    let imageName: String
    let showbutton: Bool
    @Binding var shouldshowonboarding: Bool
    let dissbutton: Bool
    var body: some View {
        ZStack{
            
            Image(imageName)
                .resizable()
                .ignoresSafeArea()
            
            VStack{
                
                
                
                Spacer(minLength:500)
                
                
                Text(title)
                    .frame(width: 350, height: 90, alignment: .leading)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("purplee"))
                
            
                Text(subtitle)
                    .frame(width: 350, height: 90, alignment: .leading)
                    .foregroundColor(Color("purplee"))
                
                
                
                Spacer()
                if showbutton{
                    Button {
                        shouldshowonboarding.toggle()
                    }label: {
                        
                        Text("Get Started")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 355, height: 43)
                            .background(Color("greenn"))
                            .cornerRadius(14)
                    }
                }
                
                
                    if dissbutton{
                        Button {
                            shouldshowonboarding.toggle()
                        }label: {
                            
                            Text("Not Now")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundColor(Color("greenn"))
                                .frame(width: 355, height: 43)
//                                .background(Color("greenn"))
                                .cornerRadius(14)
                        }
                }
                
                
                Spacer(minLength: 42)
                
            }
        }
        
        
    }
        
        
    }

