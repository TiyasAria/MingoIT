//
//  UIUXView.swift
//  Mingo-IT
//
//  Created by Muhammad Abdul Ghani on 09/06/23.
//

import SwiftUI

struct UIUXView: View {
    @EnvironmentObject  var lessonViewModel : LessonViewModel
    @EnvironmentObject  var userViewModel : UserManager
    @EnvironmentObject  var gateViewModel : GateViewModel
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    var body: some View {
        NavigationStack{
            VStack(alignment: .leading,spacing: 24){
                ProgressbarQuiz(value: $lessonViewModel.progressValueDesign)
                    .frame(height: 15)
                    .padding(.horizontal,24)
                    .padding(.top,20)
                
                ScrollView{
                    switch lessonViewModel.designState {
                    case 0 :
                       learningSection
                    case 1 :
                        UXSection
                    case 2 :
                        GoodUXSection
                    case 3 :
                        BadUXSection
                    case 4 :
                        UISection
                    case 5 :
                        GoodUISection
                    case 6 :
                        BadUISection
                    case 7 :
                        QuizSection
                    default:
                        Text("Halo")
                    }
                    
                }
                
                HStack {
                    MButton(text: "Back",
                            isFullWidth: false,
                            textColor : Color(.white),
                            background:  Color("primaryBlue"),
                            action: {
                        lessonViewModel.designState -= 1
                        lessonViewModel.progressValueDesign -= 0.125
                     }
                    ).disabled(lessonViewModel.designState == 0)
                    
                    
                    NavigationLink(isActive: $lessonViewModel.moveNextScreen, destination: {
                        lessonViewModel.chooseDestinationUiUx()
                    }, label: {
                        MButton(text: "Continue",
                                isFullWidth: false,
                                textColor : Color(.white),
                                background:  Color("primaryOrange"),
                                action: {
                                    if lessonViewModel.designState == 7 {
                                        lessonViewModel.moveNextScreen = true
                                    } else {
                                        lessonViewModel.designState += 1
                                        lessonViewModel.progressValueDesign += 0.125
                                    }
                         }
                        )
                    })
                  

                }
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItemGroup (placement: .navigationBarLeading){
                    Image(systemName: "xmark")
                        .foregroundColor(Color("primaryBlue"))
                        .font(.system(size: 24))
                        .bold()
                        .padding(.trailing,10)
                        .onTapGesture {
                            self.mode.wrappedValue.dismiss()
                        }
                    
                }
            }
        }
        .onDisappear {
            gateViewModel.mingoGatePosition = .zero
        }
    }
}

struct UIUXView_Previews: PreviewProvider {
    static var previews: some View {
        UIUXView()
            .environmentObject(UserManager())
            .environmentObject(GateViewModel())
            .environmentObject(LessonViewModel())
    }
}


