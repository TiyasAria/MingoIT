//
//  HomeScreen.swift
//  Mingo-IT
//
//  Created by tiyas aria on 04/06/23.
//

import SwiftUI

struct HomeScreen: View {

    @State private var programmingProgress: Float = 0.5
    @State private var logicProgress: Float = 0.3
    @State private var mathProgress: Float = 0.4
    @State private var designProgress: Float = 0.1
    @State private var selection = 1
    
    var body: some View {
            TabView(selection: $selection) {
                LevelPageView()
                .tabItem {
                    Image(systemName: "gamecontroller.fill")
                    Text("Play")
                }
                .tag(1)

                ProfileScreen(programmingProgress: $programmingProgress, logicProgress: $logicProgress, mathProgress: $mathProgress, designProgress: $designProgress)
                .tabItem {
                    Image(systemName: "person.crop.circle.fill")
                    Text("Profile")
                }
                .tag(2)
            }
            .accentColor(Color.init(hex: "54AAB4"))
            .navigationBarBackButtonHidden(true)
        }

}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
