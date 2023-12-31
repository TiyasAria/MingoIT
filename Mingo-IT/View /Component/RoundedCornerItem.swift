//
//  RoundedCorner.swift
//  Mingo-IT
//
//  Created by tiyas aria on 07/06/23.
//

import SwiftUI

struct RoundedCornerItem: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct RoundedCorner_Previews: PreviewProvider {
    static var previews: some View {
        RoundedCornerItem()
    }
}
