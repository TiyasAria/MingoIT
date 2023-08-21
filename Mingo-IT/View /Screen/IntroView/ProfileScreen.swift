//
//  ProfileScreen.swift
//  Mingo-IT
//
//  Created by Zai on 05/06/23.
//

import SwiftUI

struct ProfileScreen: View {
    @StateObject private var userManager = UserManager()
    

    @Binding var programmingProgress: Float
    @Binding var logicProgress: Float
    @Binding var mathProgress: Float
    @Binding var designProgress: Float
    @State private var isEditingName = false
    @State private var name = ""
    @FocusState private var isEdit: Bool
    
    var body: some View {
        VStack {

            ZStack{
                Color("primaryBlue")
                    .frame(height: 130)
                Text("Profile")
                    .foregroundColor(.white)
                    .font(.custom("SFProRounded-Bold", size: 32))
                
            }
            .clipShape(RoundedCornerItem(radius: 30, corners: [.bottomLeft, .bottomRight]))
            
            HStack {
                Image("Mingo")
                    .resizable()
                    .frame(width: 41.0, height: 52.0)
                
                VStack(alignment: .leading) {
                    HStack {
                        if isEditingName {
                            TextField("", text: $name )
                                .focused($isEdit)
                        }else {
                            Text(userManager.currentUsername ?? "Ayu")
                        }
                        Image(systemName: "square.and.pencil")
                            .onTapGesture {
                                isEditingName.toggle()
                                isEdit = true
                                userManager.currentUsername = name
                            }
                    }
                    .font(.headline)
                    
                    Text("Informatics Engineering Candidate")
                        .font(.subheadline)
                }
            }
            .padding(25)
            
           
            Text("Level 1")
                .frame(width: 310)
                .padding(17)
                .font(.title3)
                .fontWeight(.bold)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color("darkBlue"), lineWidth: 2)
                )
            
            Text("Statistic")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(Color("darkBlue"))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(25)
            
            List {
                HStack {
                    Image("ProgrammingIllustration")
                        .resizable()
                        .frame(width: 60.0, height: 60.0)
                    
                    VStack(alignment: .leading) {
                        Text("Programming")
                            .font(.headline)
                        
                        ProgressBar(progress: $programmingProgress)
                            .offset(y: -15)
                    }.offset(y: 15)
                }
                
                HStack {
                    Image("LogicIllustration")
                        .resizable()
                        .frame(width: 60.0, height: 60.0)
                    
                    VStack(alignment: .leading) {
                        Text("Logical Thinking")
                            .font(.headline)
                        
                        ProgressBar(progress: $logicProgress)
                            .offset(y: -15)
                    }.offset(y: 15)
                }
                
                HStack {
                    Image("MathIllustration")
                        .resizable()
                        .frame(width: 60.0, height: 60.0)
                    
                    VStack(alignment: .leading) {
                        Text("Math")
                            .font(.headline)
                        
                        ProgressBar(progress: $mathProgress)
                            .offset(y: -15)
                    }.offset(y: 15)
                }
                
                HStack {
                    Image("DesignIllustration")
                        .resizable()
                        .frame(width: 60.0, height: 60.0)
                    
                    VStack(alignment: .leading) {
                        Text("UI/UX")
                            .font(.headline)
                        
                        ProgressBar(progress: $designProgress)
                            .offset(y: -15)
                    }.offset(y: 15)
                }
            }
            .listStyle(.plain)
            .offset(y: -25)
            
            Spacer()
            
           
        }
        .background(.white)
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .offset(y: 0.1)
        
    }
}
