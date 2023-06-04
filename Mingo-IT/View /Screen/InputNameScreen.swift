//
//  InputNameScreen.swift
//  Mingo-IT
//
//  Created by tiyas aria on 03/06/23.
//

import SwiftUI


struct InputNameScreen: View {
    
    @State var currentUser : String   = ""
    @AppStorage("user_signin") var currentUserSignIn : Bool = false
    @AppStorage("currentUser") var currentUsername : String?
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center){
                Text("Hello")
                    .font(.custom("SFProRounded-Medium", size: 24))
                    .foregroundColor(Color("darkBlue"))
                
                Text("What is Your Name?")
                    .font(.custom("SFProRounded-Bold", size: 32))
                    .foregroundColor(Color("darkBlue"))
                    .padding(.bottom, 40)
                
                TextField("Insert Your Name Here"
                          , text: $currentUser)
                .padding(.horizontal, 30)
                .padding(.vertical , 20 )
                .background(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color("borderCard"), lineWidth: 1)
                )
               
                Spacer()
                Image("ilustrasi_ input_name")
                Spacer()
                
                NavigationLink {
                    BackgroundStoryScreen()
                } label: {
                    Text("Next")
                        .foregroundColor((currentUser.isEmpty) ? Color("textDisabled"):Color.white)
                        .font(.custom("SFProRounded-Bold", size: 20))
                        .frame(maxWidth: .infinity, maxHeight: 60 )
                        .background((currentUser.isEmpty) ? Color("greyButtonDisabled") : Color("primaryOrange")  )
                        .cornerRadius(10)
                        .shadow(color: (currentUser.isEmpty) ?Color("colorShadowGray") : Color("shadowColorButton").opacity(0.75), radius: 0, x: 0, y: 4)
                        .onTapGesture {
                            signIn()
                        }
                }.disabled(currentUser.isEmpty)

                
                
            }
            .padding(.horizontal , 24)
        .padding(.vertical, 30)
        }
    }
    
    func signIn(){
        currentUsername = currentUser
        withAnimation(.spring()) {
            currentUserSignIn = true
        }
    }
}

struct InputNameScreen_Previews: PreviewProvider {
    static var previews: some View {
        InputNameScreen()
    }
}
