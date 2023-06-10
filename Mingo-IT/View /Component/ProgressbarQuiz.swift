//
//  ProgressbarQuiz.swift
//  Mingo-IT
//
//  Created by tiyas aria on 10/06/23.
//

import SwiftUI

struct ProgressbarQuiz: View {
    @Binding var value : Double
    
    var body: some View {
        GeometryReader{ geo in
            ZStack (alignment: .leading){
                Rectangle()
                    .frame(width : geo.size.width, height: geo.size.height)
                    .foregroundColor(Color.init(hex: "#E5E5E5"))
                
                Rectangle()
                    .frame(width: min(CGFloat(self.value)*geo.size.width, geo.size.width ), height: geo.size.height)
                    .foregroundColor(Color("primaryBlue"))
            }.cornerRadius(20)
                
            
        }
    }
}

struct ProgressbarQuiz_Previews: PreviewProvider {
    static var previews: some View {
        ProgressbarQuiz(value: .constant(0.0))
    }
}
