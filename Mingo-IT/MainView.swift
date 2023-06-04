//
//  MainView.swift
//  Mingo-IT
//
//  Created by Zai on 31/05/23.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
            TabView {
                Group{
                    Text("You can put some view in here")
                }
                .tabItem {
                    Image(systemName: "gamecontroller.fill")
                    Text("Play")
                }
                
                Text("Profile Screen")
                .tabItem {
                    Image(systemName: "person.crop.circle.fill")
                    Text("Profile")
                }
            }
            .accentColor(Color.init(hex: "54AAB4"))
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
