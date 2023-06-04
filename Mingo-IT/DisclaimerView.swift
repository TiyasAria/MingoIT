//
//  DisclaimerView.swift
//  Mingo-IT
//
//  Created by Zai on 02/06/23.
//

import SwiftUI

struct DisclaimerView: View {
    var body: some View {
        VStack {
            Spacer()
            MButton(text: "I Understand", isFullWidth: true)
        }
    }
}

struct DisclaimerView_Previews: PreviewProvider {
    static var previews: some View {
        DisclaimerView()
    }
}
