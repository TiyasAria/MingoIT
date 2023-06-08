//
//  ExplanationLessonScreen.swift
//  Mingo-IT
//
//  Created by tiyas aria on 04/06/23.
//

import SwiftUI

struct ExplanationLessonScreen: View {
    let explanation : DataExplanationLesson
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    @State var currentIndex  = 0
    @State private var isShowingNextScreen = false
    
    var buttonBack : some View {
        Button {
            self.presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "custom.xmark")
                .foregroundColor(Color("primaryBlue"))
                .font(.system(size: 100))
        }

    }

    
    var body: some View {
        NavigationStack {
            VStack{
                
             buttonBack
    //            Image(systemName: "custom.xmark")
    //                .foregroundColor(Color("primaryBlue"))
    //                .font(.system(size: 100))
                
                Image(explanation.image[currentIndex])
                    .padding(.vertical, 75)
                   
                
                ZStack{
                    Color("primaryBlue")
                    
                    VStack{
                        Spacer()
                        
                        Text(explanation.title)
                            .font(.custom("SFProRounded-Bold", size: 24))
                            .padding(.horizontal,24)
                            .foregroundColor(.white)
                            .offset(y: 5)
                            

                        Spacer()
                        
                        Text(explanation.description[currentIndex])
                            .font(.custom("SFProRounded-Reguler", size: 20))
                            .padding(.horizontal,24)
                        //                            .frame(width: 325)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                           

                        
                        
                        Spacer()
                        
                        NavigationLink( isActive: $isShowingNextScreen, destination: {
                            MaterialScreen()
                        }, label: {
                            ButtonComponent( title: currentIndex == explanation.description.count - 1  ? "I'm ready to learn" : "Next")
                              
                                .padding(.horizontal, 24)
                                .onTapGesture {
                                    withAnimation(.easeInOut(duration: 1)){
                                        if currentIndex < explanation.description.count - 1 {
                                            currentIndex = currentIndex + 1
                                        } else {
                                            print("masuk")
                                            self.isShowingNextScreen = true
                                           
                                        }
                                    }
                            }
                        })
                        
                        
                        Spacer()
                        
                    }
                    
                }
                .clipShape(
                    RoundedCornerItem(radius: 30, corners: [.topLeft,.topRight])
                )
                
                
            }
            .padding(.top, 20)
            .ignoresSafeArea()
    //        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: buttonBack)
        }
        
    }
    
    
    
    
    
    
    
}

struct ExplanationLessonScreen_Previews: PreviewProvider {
    static var previews: some View {
        ExplanationLessonScreen(explanation: dataLesson[0])
    }
}
