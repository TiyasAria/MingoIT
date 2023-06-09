//
//  BackgroundStoryView.swift
//  Mingo-IT
//
//  Created by Zai on 04/06/23.
//

import SwiftUI

struct BackgroundStoryView: View {
    @StateObject private var userManager = UserManager()
    
    

    let image = ["image1", "image2", "image3", "image4", "image5"]
    let description = [
        "Enter the realm of informatics engineering, where data becomes a canvas, algorithms become brushes, and your imagination becomes the masterpiece",
        "Mingo is your friendly guide on this adventure into informatics engineering.\n \nMingo dreams of building cutting-edge software, creating digital solutions, and shaping the future with technology",
        "Imagine you stepping into a lively informatics engineering class.\n \nYou will learn essential programming languages, algorithms, and techniques to become a skilled informatics engineer." ,
        "Feel the excitement as you cross into a realm where you'll learn to create digital wonders and shape the future.\n \nMaster the art of informatics engineering through immersive and interactive learning experiences.",
        "Are you ready to embark on this incredible journey of becoming an informatics engineering student?, \n \nGet ready to unveil the mysteries of coding, algorithms, and innovative problem-solving."
    ]
    
    let title = [
        "Hello Harry!",
        "Meet Mingo",
        "Building Skills" ,
        "Enter The Digital Frontier",
        "Let’s Begin Your Adventure",
        
    ]
    @State var currentIndex = 0
    @State private var isShowingNextScreen = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Image(image[currentIndex])
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300 )
                    .padding(.vertical, 20)
                
                VStack{
                    Text(title[currentIndex])
                        .frame(height: 30)
                        .font(.custom("SFProRounded-Bold", size: 24))
                        .foregroundColor(.white)
                        .padding(10)
                        .offset(y: 5)
                    
                    
                    Text(description[currentIndex])
                        .font(.custom("SFProRounded-Reguler", size: 20))
                        .frame(height: 200)
                        .padding(.horizontal,24)
                        .padding(.bottom, 30)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                    
                    
                    NavigationLink( isActive : $isShowingNextScreen,destination: {
                        HomeScreen().navigationBarBackButtonHidden(true)
                    }, label: {
                        MButton(text: currentIndex == description.count - 1  ? "Let’s Go!" : "Next",
                                isFullWidth: true, background: Color("primaryOrange"), action: {
                            withAnimation(.easeInOut(duration: 1)){
                                if currentIndex < description.count - 1 {
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
    }
}
