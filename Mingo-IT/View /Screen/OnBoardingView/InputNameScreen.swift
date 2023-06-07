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
                Group {
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
                }
                .padding(.horizontal , 24)
                
                NavigationLink(destination: {
                    BackgroundStoryView()
                        .navigationBarBackButtonHidden(true)
                }, label: {
                    ButtonComponent(
                        title: "Next", action: {
                            signIn()
                        },
                        backgroundColor: (currentUser.isEmpty) ? Color("greyButtonDisabled") : Color("primaryOrange"),
                        textColor: (currentUser.isEmpty) ? Color("textDisabled"): Color.white, shadowColor: (currentUser.isEmpty) ? Color("colorShadowGray") : Color("shadowColorButton")
                    
                    )
//                    .onTapGesture {
//                        signIn()
//                    }
                  
                        .padding(.horizontal, 24)
                })
                .disabled(currentUser.isEmpty)
            }
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
