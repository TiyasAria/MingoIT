//
//  BackgroundStoryView.swift
//  Mingo-IT
//
//  Created by Zai on 04/06/23.
//

import SwiftUI

struct BackgroundStoryView: View {
    var body: some View {
        VStack {
            Spacer()
            Image("bg_story")
                .padding(.vertical, 75)
            
            ZStack{
                Color("primaryBlue")
                
                VStack{
                    Text("Begin The Journey")
                        .foregroundColor(.white)
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(20)
                        .offset(y: 5)
                    
                    Text("Lorem ipsum dolor sit amet consectetur. Tortor euismod eleifend luctus ultricies varius leo est imperdiet. Fermentum morbi hendrerit velit massa in. Ut metus leo in nec neque sed senectus vulputate mauris. Id hac eget et nec.")
                        .frame(width: 325)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                    
                    
                    MButton(text: "Next", isFullWidth: true, background: Color("primaryOrange"))
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

struct BackgroundStoryView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundStoryView()
    }
}
