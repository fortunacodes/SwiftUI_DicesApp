//
//  SetupView.swift
//  ImagenTexto
//
//  Created by Jesús  Fortuna on 01/05/2020.
//  Copyright © 2020 Jesús  Fortuna. All rights reserved.
//

import SwiftUI
import StoreKit

struct SetupView: View {
    @Binding var showSetup : Bool
    @State var name1 = ""
    @State var name2 = ""
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        ZStack {
            // Leaving a comment for GitHub
            Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
            HStack {
                VStack (alignment: .leading, spacing: 18) {
                    
                    Image(systemName: "info.circle.fill")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .foregroundColor(Color.white)
                        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)), Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)) , Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))]), startPoint: .top, endPoint: .bottomTrailing))
                        .cornerRadius(10)
                    
                    Text("infoGame")
                        .font(.caption)
                        .foregroundColor(Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .multilineTextAlignment(.center)
                    
                    
                    optionsSetup(image: "desktopcomputer", text: self.name1)
                        .onTapGesture {
                            UIApplication.shared.open(URL(string: "http://www.tangideas.com")!, options: [:], completionHandler: nil)
                            
                        }
                        .onAppear {
                            let langStr = Locale.current.languageCode
                            if langStr == "es"{
                                self.name1 = "Desarrollador"
                            }else{
                                self.name1 = "Developer"
                            }
                        } // For the language
                    
                    optionsSetup(image: "rosette", text: self.name2)
                        .onTapGesture {
                            SKStoreReviewController.requestReview()
                        }
                        .onAppear {
                            let langStr = Locale.current.languageCode
                            if langStr == "es"{
                                self.name2 = "Valorar"
                            }else{
                                self.name2 = "Rate"
                            }
                        } // For the language
                }
                
                
            }
            .padding(.horizontal,20)
        }
        .frame(height: 250)
        .cornerRadius(10)
        .padding(.horizontal, 60)
        .shadow(radius: 30)
        .offset(y: showSetup ? -80 : 1000)
        
        
        
        
        
    }
}

struct SetupView_Previews: PreviewProvider {
    static var previews: some View {
        SetupView(showSetup: .constant(true))
    }
}

struct optionsSetup: View {
    
    var image : String
    var text : String
    
    var body: some View {
        
        HStack{
            ZStack {
                
                Image(systemName: image)
                    .font(.system(size: 20))
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    .shadow(radius: 10)
                    .frame(width: 39, height: 34)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)), Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)) , Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))]), startPoint: .top, endPoint: .bottomTrailing))
                    .cornerRadius(10)
                    .shadow(radius: 10)
            }
            Text(text)
                .font(.system(size: 20))
                .foregroundColor(Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)))
                .shadow(radius: 10)
            
        }
    }
}
