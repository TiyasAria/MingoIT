//
//  ButtonComponent.swift
//  Mingo-IT
//
//  Created by tiyas aria on 03/06/23.
//

import SwiftUI

struct ButtonComponent: View {
    let title : String
//    let action : () -> Void
    var backgroundColor : Color = Color("primaryOrange")
    var textColor : Color = .white
    var shadowColor : Color = Color("shadowColorButton")
    var isFullSize : Bool = true
//    var width = 133
//        var height = 44
    
  

    var body: some View {
        if isFullSize {
            Text(title)
                .frame(maxWidth: .infinity, maxHeight: 60)
                .foregroundColor(textColor)
                .font( .custom("SFProRounded-Bold", size: 20))
                .background(backgroundColor)
                .cornerRadius(10)
                .shadow(color:   shadowColor.opacity(0.75), radius: 0, x: 0, y: 4)
        } else {
            Text(title)
                .frame(maxWidth: 133, maxHeight: 44)
                .foregroundColor(textColor)
                .font( .custom("SFProRounded-Reguler", size: 16))
                .background(backgroundColor)
                .cornerRadius(10)
                .shadow(color:   shadowColor.opacity(0.75), radius: 0, x: 0, y: 4)
        }
        
            
    }
}

struct ButtonComponent_Previews: PreviewProvider {
    static var previews: some View {
        ButtonComponent(title: "Submit")
    }
}
