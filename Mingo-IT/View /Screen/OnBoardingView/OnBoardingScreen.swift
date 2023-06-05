//
//  OnBoardingScreen.swift
//  Mingo-IT
//
//  Created by tiyas aria on 04/06/23.
//

import SwiftUI

struct OnBoardingScreen: View {
    /*
     on boarding screen
     0 - disclamer screen
     1- input screen
     2 - Bg Screen
     */
    
    @State var onBoardingState : Int = 0

    var body: some View {
        ZStack{
            switch onBoardingState{
            case 0 :
                DisclaimerView()
            case 1 :
                InputNameScreen()
            case 2 :
               BackgroundStoryView()
            default :
                Text("Default screen")
            }
        }
    }
}

struct OnBoardingScreen_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingScreen()
    }
}
