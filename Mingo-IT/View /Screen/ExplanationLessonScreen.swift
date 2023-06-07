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
    
    var body: some View {
        VStack() {
            
            //            Image(systemName: "xmark")
            //                .frame(width: 200, height: 200)
            //                .foregroundColor(.black)
            
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
                    
                    MButton(text: "Next",
                            isFullWidth: true,
                            action : {
                        if currentIndex < explanation.description.count - 1 {
                                         currentIndex = currentIndex + 1 
                                           } else {
                                              print("masuk")
                                               NavigationLink {
                                                   MaterialScreen()
                                               } label: {
                                                   
                                               }

                                           }
                            },
                            background: Color("primaryOrange")
                    )

                   
                    
                    Spacer()

                }
              
            }
            .clipShape(RoundedCorner(radius: 30, corners: [.topLeft, .topRight]))
            
            
        }
        .ignoresSafeArea()
        
    }
    
    
    
    struct RoundedCorner: Shape {
        var radius: CGFloat = .infinity
        var corners: UIRectCorner = .allCorners
        
        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(roundedRect: rect,
                                    byRoundingCorners: corners,
                                    cornerRadii: CGSize(width: radius, height: radius))
            return Path(path.cgPath)
        }
    }
    
    
    
}

struct ExplanationLessonScreen_Previews: PreviewProvider {
    static var previews: some View {
        ExplanationLessonScreen(explanation: dataLesson[0])
    }
}
