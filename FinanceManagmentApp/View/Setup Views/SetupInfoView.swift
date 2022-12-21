//
//  SetupInfoView.swift
//  FinanceManagmentApp
//
//  Created by Zahra Majed Alzawad on 18/05/1444 AH.
//

import SwiftUI
import FLAnimatedImage

struct SetupInfoView: View {
    
  @AppStorage("shouldshowonboarding") var shouldshowonboarding: Bool = false
    @State private var showNextView: Bool = false
    
        //@State var shouldshowonboarding: Bool = true
    var body: some View {
            VStack(alignment: .leading, spacing: 10){
                
                /*Image("Logo")
                    .padding(.top)
                    .padding(.trailing)*/
                
               /* GIFView(type: .name(""))
                    .frame(width: 200, height: 250)*/
                Spacer()
                ViewTitleDescription(viewTitle: "PAYWISE", viewDescription: "We will need some information to get started")
                    .padding(.leading)
                Spacer()
                HStack{
                    Text("1")
                        .foregroundColor(.white)
                        .padding(9)
                        .background(Color("AccentPurpleLight"))
                        .clipShape(Circle())
                        .padding(.leading)
                    
                    
                    Text("Basic Information")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    .bold() }
                
                Text("Give us your phone number and wait for the magic! We will provide you with information, and you only have to amend it in case of error")
                    .frame(alignment: .leading)
                    .padding(.leading, 40.0)
                    .padding(.trailing, 17)
                    
                HStack{
                    
                    Text("2")
                        .foregroundColor(Color("AccentPurpleLight"))
                    
                        .padding(9)
                        .background(.white)
                        .clipShape(Circle())
                        .padding(.leading)
                    
                    Text("Financial Information")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color("grayText"))
                    
                    
                    
                }
                Spacer()
                LargeButton(text: "Start", isfilled: true) {
                    showNextView = true
                }
                .padding(.leading)
                Spacer()
                NavigationLink(destination: PhoneNumberPInfo(), isActive: $showNextView) {
                }.labelsHidden()
            }.fullScreenCover(isPresented: $shouldshowonboarding, content: {onboarding1(shouldshowonboarding: $shouldshowonboarding)})
        
    }
}

struct SetupInfoView_Previews: PreviewProvider {
    static var previews: some View {
        SetupInfoView()
    }
}


struct onboarding1: View {
    @Binding var shouldshowonboarding: Bool
    var body: some View {
        TabView{
            //"Easy way to manage your money"
            /*PageView(title: "Manage Your Money Like the RICH", subtitle: "We will help you controling your money", imageName: "background1", showbutton: false, shouldshowonboarding: $shouldshowonboarding,
                     dissbutton: true)*/
            PageView(title: "Manage Your Money Like the ", accentWord: "RICH", title2: "", subtitle: "We will help you controling your money", imageName: "", showbutton: false, shouldshowonboarding: $shouldshowonboarding, dissbutton: false)
            
            PageView(title: "", accentWord: "Balance", title2: " Your Money", subtitle: "Divide your income into different digital cards based on a financial strategy", imageName: "", showbutton: true, shouldshowonboarding: $shouldshowonboarding, dissbutton: false)
            
           /* PageView(title: "Set your goal " ,
                     subtitle: "Set your goal to grow your money and achieve the goal you are aiming for " ,
                     imageName: "background",
                     showbutton: false,
                     shouldshowonboarding: $shouldshowonboarding,
                     dissbutton: false)*/

            
           /* PageView(title: "Track your goal " ,
                     subtitle: "Manage and track your goal depending on period of time and amount of money. " ,
                     imageName: "track",
                     showbutton: true,
                     shouldshowonboarding: $shouldshowonboarding,
                     dissbutton: false)*/
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        .ignoresSafeArea()
    }
}

struct PageView: View {
    let title: String
    let accentWord : String
    let title2: String
    let subtitle: String
    let imageName: String
    let showbutton: Bool
    @Binding var shouldshowonboarding: Bool
    let dissbutton: Bool
    var body: some View {
        VStack{
            
           // Spacer(minLength:500)
            GIFView(type: .name(""))
                .frame(width: 380, height: 480)
            
            Group {
              Text(title) +
                Text(accentWord).foregroundColor(Color("AccentPurpleLight")).fontWeight(.bold) +
              Text(title2)
            }.frame(width: 350,  alignment: .leading)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.bottom, 10.0)

            
           /* Text(title)
                .frame(width: 350,  alignment: .leading)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.black)
                .padding(.bottom, 10.0)*/
            
        
            Text(subtitle)
                .font(.subheadline)
                .fontWeight(.medium)
                .padding(.bottom, 30.0)
                .frame(width: 350, alignment: .leading)
                .foregroundColor(.black)
            
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
                        .background(Color("AccentGreenLight"))
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
                            .foregroundColor(Color("AccentGreenLight"))
                            .frame(width: 355, height: 43)
//                                .background(Color("greenn"))
                            .cornerRadius(14)
                    }
            }
            
            
            Spacer(minLength: 42)
            
        }
    }
        
        
    }

struct GIFView: UIViewRepresentable {
  private var type: URLType

  init(type: URLType) {
    self.type = type
  }

  private let imageView: FLAnimatedImageView = {
    let imageView = FLAnimatedImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.layer.cornerRadius = 24
    imageView.layer.masksToBounds = true
    return imageView
  }()

  private let activityIndicator: UIActivityIndicatorView = {
    let activityIndicator = UIActivityIndicatorView()
    activityIndicator.translatesAutoresizingMaskIntoConstraints = false
    return activityIndicator
  }()
}

extension GIFView {
  func makeUIView(context: Context) -> UIView {
    let view = UIView(frame: .zero)

    view.addSubview(activityIndicator)
    view.addSubview(imageView)

    imageView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    imageView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true

    activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

    return view
  }

  func updateUIView(_ uiView: UIView, context: Context) {
    activityIndicator.startAnimating()
    guard let url = type.url else { return }

    DispatchQueue.global().async {
      if let data = try? Data(contentsOf: url) {
        let image = FLAnimatedImage(animatedGIFData: data)

        DispatchQueue.main.async {
          activityIndicator.stopAnimating()
          imageView.animatedImage = image
        }
      }
    }
  }
}

enum URLType {
  case name(String)
  case url(URL)

  var url: URL? {
    switch self {
      case .name(let name):
        return Bundle.main.url(forResource: name, withExtension: "gif")
      case .url(let remoteURL):
        return remoteURL
    }
  }
}
