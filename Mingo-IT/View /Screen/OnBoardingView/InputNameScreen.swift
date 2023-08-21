//
//  InputNameScreen.swift
//  Mingo-IT
//
//  Created by tiyas aria on 09/06/23.
//

import SwiftUI


struct InputNameScreen: View {
    
    @EnvironmentObject var userManager : UserManager
    @State private var isShowingNextScreen : Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center){
                VStack{
                    Text("Hello")
                        .font(.system(size: 24 , weight: .medium, design: .rounded))
                        .foregroundColor(Color("darkBlue"))
                    
                    Text("What is Your Name?")
                        .font(.system(size: 32 , weight: .bold, design: .rounded))
                        .foregroundColor(Color("darkBlue"))
                        .padding(.bottom, 40)
                    
                    TextField("Insert Your Name Here"
                              , text: $userManager.currentUser)
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
                
                
                NavigationLink(isActive: $isShowingNextScreen) {
                    BackgroundStoryView().navigationBarBackButtonHidden(true)
                } label: {
                    MButton(text: "Next",
                            isFullWidth: true,
                            textColor :(userManager.currentUser.isEmpty) ? Color("textDisabled") : Color(.white),
                            background: (userManager.currentUser.isEmpty) ? Color("greyButtonDisabled") : Color("primaryOrange"),
                            action: {
                                isShowingNextScreen = true
                                userManager.signIn()
                            }
                    )
                }
                .disabled(userManager.currentUser.isEmpty)
            }
            .padding(.vertical, 30)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct InputNameScreen_Previews: PreviewProvider {
    static var previews: some View {
        InputNameScreen()
            .environmentObject(UserManager())
    }
}
