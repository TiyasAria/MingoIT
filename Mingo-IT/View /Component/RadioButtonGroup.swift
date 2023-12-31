//
//  RadioButtonGroup.swift
//  Mingo-IT
//
//  Created by Zai on 06/06/23.
//

import SwiftUI

struct ColorInvert: ViewModifier {

    @Environment(\.colorScheme) var colorScheme

    func body(content: Content) -> some View {
        Group {
            if colorScheme == .dark {
                content.colorInvert()
            } else {
                content
            }
        }
    }
}

struct RadioButton: View {

    @Environment(\.colorScheme) var colorScheme
    
    @Binding var isTrue: Bool
    @Binding var isSelected: Bool

    let id: String
    let callback: (String)->()
    let selectedID : String
    let size: CGFloat
    let color: Color
    let textSize: CGFloat

    init(
        _ id: String,
        callback: @escaping (String)->(),
        selectedID: String,
        size: CGFloat = 20,
        color: Color = Color.primary,
        textSize: CGFloat = 14,
        isTrue: Binding<Bool>,
        isSelected: Binding<Bool>
        ) {
        self.id = id
        self.size = size
        self.color = color
        self.textSize = textSize
        self.selectedID = selectedID
        self.callback = callback
        _isTrue = isTrue
        _isSelected = isSelected
    }

    var body: some View {
        Button(action:{
            self.callback(self.id)
        }) {
            HStack(alignment: .center, spacing: 10) {
                Image(systemName: self.selectedID.lowercased() == self.id.lowercased() ? "largecircle.fill.circle" : "circle")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: self.size, height: self.size)
                    .modifier(ColorInvert())
                Text(id)
//                    .font(Font.system(size: textSize))
                Spacer()
            }.foregroundColor(self.selectedID == self.id ?
                              isSelected ?
                                isTrue ? Color("primaryBlue") : Color("borderCardFalse")
                              : self.color
                              : self.color)
        }
        .foregroundColor(self.color)
        .onAppear {
            
                let _ = print(self.selectedID)
        }
    }
    
}


struct RadioButtonGroup: View {
    @Binding var isTrue: Bool
    @Binding var isSelected: Bool

    let items : [String]

    @Binding var selectedId: String

    let callback: (String) -> ()

    var body: some View {
        VStack(spacing: 20) {
            ForEach(0..<items.count) { index in
                RadioButton(self.items[index], callback: self.radioGroupCallback, selectedID: self.selectedId, isTrue: $isTrue, isSelected: $isSelected)
            }
        }
    }

    func radioGroupCallback(id: String) {
        selectedId = id
        callback(id)
    }
}
