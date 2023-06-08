//
//  BackgroundStoryView.swift
//  Mingo-IT
//
//  Created by Zai on 04/06/23.
//

import SwiftUI

struct BackgroundStory: View {
    var image: String = "CompleteOwl"
    var title: String = "Begin The Journey"
    var content: String = "Lorem ipsum dolor sit amet consectetur. Tortor euismod eleifend luctus ultricies varius leo est imperdiet. Fermentum morbi hendrerit velit massa in. Ut metus leo in nec neque sed senectus vulputate mauris. Id hac eget et nec."
    var isLastPage: Bool = false
    
    var body: some View {
        VStack {
            Image(image)
                .offset(y: -70)
            
            Spacer()
            
            VStack {
                Text(title)
                    .foregroundColor(.white)
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(20)
                    .offset(y: 5)
                
                Text(content)
                    .frame(width: 325)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                
                
                MButton(text: isLastPage ? "I'm Ready to Learn!" : "Next", isFullWidth: true, background: Color("primaryOrange"))
            }
            .background(Color("primaryBlue"))
            .frame(
                  minWidth: 0,
                  maxWidth: .infinity,
                  minHeight: 0,
                  maxHeight: .infinity,
                  alignment: .topLeading
                )
            .cornerRadius(30)
        }
        .offset(y: 150)
    }
}

struct BackgroundStoryView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundStory()
    }
}
