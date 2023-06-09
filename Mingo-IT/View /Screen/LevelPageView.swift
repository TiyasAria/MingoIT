//
//  LevelPageView.swift
//  Mingo-IT
//
//  Created by tiyas aria on 07/06/23.
//

import SwiftUI

struct LevelPageView: View {
    
    @State var point : Int = 0
    var listImageLevel = ["Level1", "Level2Gray", "Level3Gray"]
    //     level untuk move imagenya
    @State var currentLevel = 0
    @State private  var isShowNextScreen = false
    
    
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center){
                //             title item
                ZStack{
                    Color("primaryBlue")
                        .frame(height: 130)
                    Text("Learning Journey")
                        .foregroundColor(.white)
                        .font(.custom("SFProRounded-Bold", size: 32))
                    
                }
                .clipShape(RoundedCornerItem(radius: 30, corners: [.bottomLeft, .bottomRight]))
                
                ZStack {
                    Image("awan")
                        .offset(x: 0, y: -100 )
                    
                    VStack{
                        
                        //            box info  mapel and value
                        if currentLevel == 0  {
                            withAnimation(.easeOut(duration: 1)){
                               BoxEnable(point: $point)
                            }
                            
                            
                        } else {
                            withAnimation(.easeIn(duration: 1)){
                                itemBoxDisable()
                            }
                        
                        }
                        //            item gedung
                        ZStack {
                            
                            Image(listImageLevel[currentLevel])
                                .resizable()
                                .scaledToFit()
                                .frame(height: 244)
                            
                            Image("background_level")
                                .offset(y: 160 )
                            
                            Image("mingoStay")
                                .resizable()
                                .scaledToFit()
                                .frame(width : 82 , height: 100)
                                .offset(y:130)
                        }
                        
                        //             button
                        HStack{
                            Image("left arrow")
                                .onTapGesture {
                                    withAnimation(.easeOut(duration: 0.5)){
                                        currentLevel = currentLevel - 1
                                    }
                                   
                                }.disabled(currentLevel  == 0 )
                            
                            
                            NavigationLink(isActive : $isShowNextScreen ,destination: {
                               GateView()
                            }, label: {
                                MButton(text: "Play",
                                        isFullWidth: true, background: Color("primaryOrange"), action: {
                                    isShowNextScreen = true
                                }
                                )
                            })
                            .disabled(currentLevel > 0)
                            
                            
                            Image("right arrow")
                                .onTapGesture {
                                    withAnimation(.easeIn(duration: 0.5)){
                                        currentLevel = currentLevel + 1                                    }
                                  
                                }
                                .disabled(currentLevel  == 2 )
                            
                            
                        }
                        .offset(y:70)
                        .padding(.horizontal, 25)
                        
                        
                    }
                    
                }
                
                Spacer()
                
            }
            
            .ignoresSafeArea()
        }
    }
}

struct LevelPageView_Previews: PreviewProvider {
    static var previews: some View {
        LevelPageView()
    }
}

struct ItemBox: View {
    var title : String
    @Binding var point : Int
    
    
    var body: some View {
        HStack {
            
            Text(title)
                .foregroundColor( .white )
                .font(.custom("SFProRounded-Reguler", size: 16))
            
            
            Spacer()
            
            Text("\(point)/5")
                .foregroundColor( Color("primaryBlue"))
                .padding(.all, 5)
                .background( .white )
                .cornerRadius(5)
            
        }
    }
}


struct itemBoxDisable : View {
    
    var body: some View{
        VStack(alignment: .leading, spacing: 10) {
            Text("To access this level you need: ")
                .font(.custom("SFProRounded-Reguler", size: 16))
                .foregroundColor(Color.init(hex: "8D8D8D"))
            contentBoxDisable(title: "Programming")
            contentBoxDisable(title: "Logical Thinking")
            contentBoxDisable(title: "Mathematic")
            contentBoxDisable(title: "Design UI/UX")
        }
        .frame(width: 240, height: 161)
        .padding()
        .background(Color.init(hex: "E5E5E5"))
        .cornerRadius(20)
    }
}

struct contentBoxDisable : View {
    var title : String
    
    var body : some View {
        HStack {
            
            Text(title)
                .foregroundColor(Color.init(hex: "8D8D8D"))
                .font(.custom("SFProRounded-Reguler", size: 16))
            
            
            Spacer()
            
            Text("3/5")
                .foregroundColor( Color.init(hex: "8D8D8D"))
                .padding(.all, 5)
                .background( Color.init(hex: "CBC9C9") )
                .cornerRadius(5)
            
        }
    }
}

struct BoxEnable: View {
    @Binding var point : Int
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            ItemBox(title: "Programming", point:$point)
            ItemBox(title: "Logical Thingking", point:$point)
            ItemBox(title: "Mathematic", point:$point)
            ItemBox(title: "Design UI/UX", point:$point)
        }
        .frame(width: 240, height: 161)
        .padding()
        .background( Color("primaryBlue"))
        .cornerRadius(20)
    }
}
