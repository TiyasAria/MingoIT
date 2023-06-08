//
//  HomeScreen.swift
//  Mingo-IT
//
//  Created by tiyas aria on 04/06/23.
//

import SwiftUI

struct HomeScreen: View {

    @State private var selectionTab : Tab = .play
    enum Tab {
       case play
       case profile
    }
    
    
    var body: some View {
        TabView(selection: $selectionTab) {
            LevelPageView()
                .tabItem {
                    Label("Play", systemImage: "gamecontroller.fill")
                  
                }
                .tag(Tab.play)
            
            ProfilePageView()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle.fill")
                }
                .tag(Tab.play)
        }
       
        .accentColor(Color("primaryBlue"))
     
        
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
