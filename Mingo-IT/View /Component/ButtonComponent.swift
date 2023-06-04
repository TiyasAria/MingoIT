//
//  ButtonComponent.swift
//  Mingo-IT
//
//  Created by tiyas aria on 03/06/23.
//

import SwiftUI

struct ButtonComponent: View {
    let title : String
    let action : () -> Void
    
  

    var body: some View {
            Text(title)
                .foregroundColor( Color.white)
                .font(.custom("SFProRounded-Bold", size: 20))
                .frame(maxWidth: .infinity, maxHeight: 60 )
                .background(Color("primaryOrange"))
                .cornerRadius(10)
                .shadow(color:  Color("shadowColorButton").opacity(0.75), radius: 0, x: 0, y: 4)
                .onTapGesture {
                    action()
                }
                
        
    }
}

struct ButtonComponent_Previews: PreviewProvider {
    static var previews: some View {
        ButtonComponent(title: "Submit", action: {
            
        })
    }
}
