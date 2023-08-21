//
//  BackgroundStoryView.swift
//  Mingo-IT
//
//  Created by Zai on 04/06/23.
//

import SwiftUI

struct BackgroundStoryView: View {
    @EnvironmentObject private var userManager : UserManager
    @State var currentIndex = 0
    @State private var isShowingNextScreen = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Image(listDataBackgroundStory[currentIndex].image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300 )
                    .padding(.vertical, 20)
                
                VStack{
                    Text(listDataBackgroundStory[currentIndex].title)
                        .frame(height: 30)
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .padding(10)
                        .offset(y: 5)
                    
                    
                    Text(listDataBackgroundStory[currentIndex].description)
                        .font(.system(size: 20, weight: .regular, design: .rounded))
                        .frame(height: 200)
                        .padding(.horizontal,24)
                        .padding(.bottom, 30)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                    
                    
                    NavigationLink( isActive : $isShowingNextScreen,destination: {
                        HomeScreen().navigationBarBackButtonHidden(true)
                    }, label: {
                        MButton(text: currentIndex == listDataBackgroundStory.count - 1 ? "Let’s Go!" : "Next",
                                isFullWidth: true, background: Color("primaryOrange"), action: {
                            withAnimation(.easeInOut(duration: 1)){
                                if currentIndex <   listDataBackgroundStory.count - 1 {
                                    currentIndex = currentIndex + 1
                                } else {
                                    print("masuk")
                                    withAnimation(.spring()) {
                                        self.isShowingNextScreen = true
                                        userManager.currentUserSignIn = true
                                    }
                                }
                            }
                        }
                        )
                    })
                    .padding(.bottom, 10)
                }
                .background(Color("primaryBlue"))
                .clipShape(RoundedCornerItem(radius: 30, corners: [.topLeft, .topRight]))
            }
            .ignoresSafeArea()
        }
        
    }
    
}

struct BackgroundStoryView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundStoryView()
            .environmentObject(UserManager())
    }
}
