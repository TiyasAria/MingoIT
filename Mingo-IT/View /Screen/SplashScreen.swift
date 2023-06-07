//
//  SplashScreen.swift
//  Mingo-IT
//
//  Created by tiyas aria on 03/06/23.
//

import SwiftUI

struct SplashScreen: View {
    
    @State var isActive : Bool = false
    @AppStorage("user_signin") var currentUserSignIn : Bool = false

    
    var body: some View {
        ZStack{
            if self.isActive {
                if currentUserSignIn {
                    HomeScreen()
                } else {
                   DisclaimerView()
                }
               
            } else {
                Color("primaryBlue")
                    .ignoresSafeArea()
                Image("splashscreen")
                    .padding(.top, 20)
                
                VStack {
                    Image("Mingo Icon")
                    Text("Mingo IT")
                        .font(.custom("SFProRounded-Bold", size: 48))
                        .foregroundColor(Color("darkBlue"))
                }
                .padding(.top, 30)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.isActive = true
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
