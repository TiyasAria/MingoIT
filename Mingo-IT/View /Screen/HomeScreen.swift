//
//  HomeScreen.swift
//  Mingo-IT
//
//  Created by tiyas aria on 04/06/23.
//

import SwiftUI

struct HomeScreen: View {
    @AppStorage("user_signin") var currentUserSignIn : Bool = false
    @AppStorage("currentUser") var currentUsername : String?
    
    var body: some View {
        VStack{
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 150 , height: 150)
                .scaledToFit()
            
            Text(currentUsername ?? "Null")
                .font(.title)
            
            Text("Sign Out")
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 60)
                .background(Color("primaryBlue"))
                .onTapGesture {
                    currentUsername = ""
                    currentUserSignIn = false
                }
            
        }
        .padding(.horizontal, 24)
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
