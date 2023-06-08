//
//  GatePageScreen.swift
//  Mingo-IT
//
//  Created by tiyas aria on 08/06/23.
//

import SwiftUI

struct GatePageScreen: View {
    
    var body: some View {
        NavigationStack {
            VStack{
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
            }
            .padding(.horizontal, 24)
        }
        .toolbar(.hidden, for: .tabBar)
    }
}

struct GatePageScreen_Previews: PreviewProvider {
    static var previews: some View {
        GatePageScreen()
    }
}
