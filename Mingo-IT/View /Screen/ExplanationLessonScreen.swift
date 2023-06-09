//
//  ExplanationLessonScreen.swift
//  Mingo-IT
//
//  Created by tiyas aria on 04/06/23.
//

import SwiftUI

struct ExplanationLessonScreen: View {
    let explanation : DataExplanationLesson
    
    @State var currentIndex  = 0
    @State private var isShowingNextScreen = false
    

    
    var body: some View {
        NavigationStack {
            VStack{
                
                Image(explanation.image[currentIndex])
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300 )
                    .padding(.vertical, 20)
                
                VStack{
                    
                    Text(explanation.title)
                        .frame(height: 30)
                        .font(.custom("SFProRounded-Bold", size: 24))
                        .padding(10)
                        .foregroundColor(.white)
                        .offset(y: 20)
                        .padding(.bottom, 10)
                    
                   
                    
                    Text(explanation.description[currentIndex])
                        .font(.custom("SFProRounded-Reguler", size: 20))
                        .padding(.horizontal,24)
                        .padding(.bottom, 30)
                        .frame(height: 250)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                    
                    NavigationLink( isActive: $isShowingNextScreen, destination: {
                        LessonScreen()
                    }, label: {
                        MButton(text: currentIndex == explanation.description.count - 1  ? "I’m Ready to Learn!" : "Next",
                                isFullWidth: true, background: Color("primaryOrange"), action: {
                            withAnimation(.easeInOut(duration: 1)){
                                if currentIndex < explanation.description.count - 1 {
                                    currentIndex = currentIndex + 1
                                } else {
                                    print("masuk")
                                    self.isShowingNextScreen = true
                                    
                                }
                            }
                        }
                        )
                    })
                    .padding(.bottom, 20)

                    
                    
                    
                }
              
                .background(Color("primaryBlue"))
                .clipShape(
                    RoundedCornerItem(radius: 30, corners: [.topLeft,.topRight])
                )
                
                
            }
            .offset(y:60)
            .ignoresSafeArea()
            .navigationBarBackButtonHidden(true)
        }
        
        
    }
    
    
    
    
    
    
    
}

struct ExplanationLessonScreen_Previews: PreviewProvider {
    static var previews: some View {
        ExplanationLessonScreen(explanation: dataLesson[0])
    }
}
