//
//  ProgressBar.swift
//  Mingo-IT
//
//  Created by Zai on 05/06/23.
//

import SwiftUI

struct ProgressBar: View {
    @Binding var progress: Float
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(Color("backgroundCard"))
                    .frame(width: geometry.size.width, height: 15)
                    .cornerRadius(10)
                
                Rectangle()
                    .foregroundColor(Color("primaryOrange"))
                    .frame(width: min(CGFloat(self.progress)*geometry.size.width, geometry.size.width), height: 15)
                    .cornerRadius(10)
                
                Text("\(Int(progress * 100)) %")
                    .font(.caption)
                    .foregroundColor(.black)
                    .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height)
            }
        }
        .padding(.zero)
    }
}
