//
//  BackgroundStoryScreen.swift
//  Mingo-IT
//
//  Created by tiyas aria on 03/06/23.
//

import SwiftUI

struct BackgroundStoryScreen: View {
    var body: some View {
        VStack{
            Spacer()
            Image("bg_story")
                .resizable()
                .frame(width: .infinity, height: 245)
                .padding(.horizontal, 24)
                .padding(.vertical, 30)
            
            ZStack{
                Rectangle()
                    .frame(height: 500)
                    .foregroundColor(Color("primaryBlue"))
                  
                VStack{
                    Spacer()
                    Text("Gajasjjejwnd")
                    Spacer()
                    NavigationLink(destination: {
                        HomeScreen()
                    }, label: {
                        ButtonComponent(title: "Next") {
                            
                        }
                        .padding(.horizontal, 24)
                    .padding(.bottom, 60)
                    })
                }
            }
            
        }
        .ignoresSafeArea()
      
       
       
    }
}

struct BackgroundStoryScreen_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundStoryScreen()
    }
}
