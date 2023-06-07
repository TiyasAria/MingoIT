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
        NavigationStack {
            VStack{
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 150 , height: 150)
                    .scaledToFit()
                
                Text(currentUsername ?? "Ayu")
                    .font(.headline)
                    .foregroundColor(.black)
                
                HStack {
                    NavigationLink(destination: {
                        ExplanationLessonScreen(explanation: dataLesson[0])
                    }, label: {
                        Text("Programming")
                            .padding()
                            .background(Color("primaryBlue"))
                            .foregroundColor(.white)

                            .cornerRadius(10)
                    })
                       
                    Spacer()
                    NavigationLink(destination: {
                        ExplanationLessonScreen(explanation: dataLesson[1])
                    }, label: {
                        Text("Logic")
                            .padding()
                            .background(Color("primaryBlue"))
                            .foregroundColor(.white)

                            .cornerRadius(10)
                    })
                }
                .padding(.bottom, 20)
              
              
                
                HStack{
                    NavigationLink(destination: {
                        ExplanationLessonScreen(explanation: dataLesson[2])
                    }, label: {
                        Text("Matemathic")
                            .padding()
                            .background(Color("primaryBlue"))
                            .foregroundColor(.white)

                            .cornerRadius(10)
                    })
                    Spacer()
                    NavigationLink(destination: {
                        ExplanationLessonScreen(explanation: dataLesson[3])
                    }, label: {
                        Text("UI / UX design")
                            .padding()
                            .background(Color("primaryBlue"))
                            .foregroundColor(.white)

                            .cornerRadius(10)
                    })
                }
                    
                
                MButton(text: "Sign Out", isFullWidth: true,
//                        action : {
//                    currentUsername = ""
//                    currentUserSignIn = false
//                },
                        background: Color("primaryBlue"))
            }
            .padding(.horizontal, 24)
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
