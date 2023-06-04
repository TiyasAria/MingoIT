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
            Image("CompleteOwl")
                .offset(y: -70)
            
            Spacer()
            
            VStack {
                Text("Begin The Journey")
                    .foregroundColor(.white)
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(20)
                
                Text("Lorem ipsum dolor sit amet consectetur. Tortor euismod eleifend luctus ultricies varius leo est imperdiet. Fermentum morbi hendrerit velit massa in. Ut metus leo in nec neque sed senectus vulputate mauris. Id hac eget et nec.")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                
                
                MButton(text: "Next", isFullWidth: true, background: Color.init(hex: "FF8C41"))
            }
            .background(Color.init(hex: "54AAB4"))
            .frame(
                  minWidth: 0,
                  maxWidth: .infinity,
                  minHeight: 0,
                  maxHeight: .infinity,
                  alignment: .topLeading
                )
            .cornerRadius(30)
        }
        .offset(y: 175)
    }
}

struct BackgroundStoryView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundStoryView()
    }
}
