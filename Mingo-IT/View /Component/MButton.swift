//
//  MButton.swift
//  Mingo-IT
//
//  Created by Zai on 31/05/23.
//

import SwiftUI

struct MButton: View {
    // MARK: USAGE
    /*
     - - - Regular Button - - -
     MButton(text: "I am a button")
     
     - - - Full Width Button - - -
     MButton(text: "I am a button", isFullWidth: true)
     
     - - - Custom Width Button - - -
     MButton(text: "I am a button", width: CGFloat(100))
     
     - - - Custom Color Button - - -
     MButton(text: "I am a button", background: .black, textColor: .white) OR
     
     MButton(text: "I am a button", background: Color.init(hex: "#000"), textColor: Color.init(hex: "#FFF"))
     
     - - - Callback Function - - -
     MButton(text: "I Understand", isFullWidth: true, action: { #code here }) OR
     
     MButton(text: "I Understand", isFullWidth: true) {
     #code here
     }
     *
     *
     */
    
    // MARK: Custom Params
    var text: String
    var width: CGFloat = 100.0
    
    var isFullWidth: Bool = false
    var textColor: Color = .white
    var background: Color = .blue
    var action: () -> () = {}
    
    // MARK: State
    @GestureState private var isPressing = false
    @GestureState private var isLongPressing = false
    @State private var isButtonPressed = false
    @State private var longPressTimer: Timer?
    @State private var loopCounter = 0
    
    var body: some View {
        Button() {
            isButtonPressed.toggle()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                isButtonPressed = false
            }
            action()
        }label: {
            if isFullWidth {
                Text("\(text)")
                    .font(.system(size: 16 , weight: .medium, design: .rounded))    .frame(maxWidth: .infinity)
                    .padding(10)
            }else {
                Text("\(text)")
                    .font(.system(size: 16 , weight: .medium, design: .rounded))  .frame(width: width)
                    .padding(10)
            }
        }
        .fontWeight(.bold)
        .foregroundColor(textColor)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .shadow(color: .black,
                        radius: 0, x: 0, y: 4)
                .opacity(0.25)
        )
        .tint(background)
        .padding(24)
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.roundedRectangle(radius: 10))
        .scaleEffect(isButtonPressed ? 0.975 : 1)
        .offset(y: isButtonPressed ? 5 : 0)
        .animation(Animation.spring())
        
        .gesture(
            LongPressGesture(minimumDuration: 1.0)
                .updating($isLongPressing) { currentState, gestureState, transaction in
                    gestureState = currentState
                    handleLongPressStateChange(gestureState: currentState)
                }
        )
    }
    
    private func handleLongPressStateChange(gestureState: Bool) {
        if gestureState && !isButtonPressed {
            longPressTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { _ in
                withAnimation {
                    isButtonPressed = true
                }
            }
        } else {
            longPressTimer?.invalidate()
            longPressTimer = nil
            withAnimation {
                isButtonPressed = false
            }
        }
        
    }
}

struct MButton_Previews: PreviewProvider {
    static var previews: some View {
        MButton(text: "I am a button")
    }
}
