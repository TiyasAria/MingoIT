//
//  ProfilePageView.swift
//  Mingo-IT
//
//  Created by tiyas aria on 07/06/23.
//

import SwiftUI

struct ProfilePageView: View {
    @StateObject private var userManager = UserManager()

    var body: some View {
        NavigationStack {
            VStack{
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 150 , height: 150)
                    .scaledToFit()
                
                Text(userManager.currentUsername ?? "Ayu")
                    .font(.headline)
                    .foregroundColor(.black)
                
                
                
                Text("sign out")
                                      .foregroundColor(Color.white)
                                      .font(.custom("SFProRounded-Bold", size: 20))
                                      .frame(maxWidth: .infinity, maxHeight: 60 )
                                      .background( Color("primaryOrange")  )
                                      .cornerRadius(10)
                                      .shadow(color :  Color("shadowColorButton").opacity(0.75), radius: 0, x: 0, y: 4)
                                      .onTapGesture {
                                          userManager.currentUsername = ""
                                          userManager.currentUserSignIn = false
                                      }
                    
                
//                MButton(text: "Sign Out", isFullWidth: true,
//                        action : {
//                    currentUsername = ""
//                    currentUserSignIn = false
//                },
//                        background: Color("primaryBlue"))
                
            }
            .padding(.horizontal, 24)
        }
    }
}

struct ProfilePageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePageView()
    }
}
