//
//  LogicView.swift
//  Mingo-IT
//
//  Created by Muhammad Abdul Ghani on 08/06/23.
//

import SwiftUI

struct LogicView: View {
    @EnvironmentObject  var lessonViewModel : LessonViewModel
    @EnvironmentObject  var userViewModel : UserManager
    @EnvironmentObject  var gateViewModel : GateViewModel
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 24){
                ProgressbarQuiz(value: $lessonViewModel.progressValueLogic)
                    .frame(height: 15)
                    .padding(.horizontal,24)
                    .padding(.top,20)
                
                ScrollView{
                    switch lessonViewModel.logicState {
                    case 0 :
                        learningSection
                    case 1 :
                        quizMultipleSection
                    case 2 :
                        fillTheBlankSection
                    case 3 :
                        dragAndDropSection
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
                        lessonViewModel.logicState -= 1
                        lessonViewModel.progressValueLogic -= 0.25
                     }
                    ).disabled(lessonViewModel.logicState == 0)
                    
                    
                    NavigationLink(isActive: $lessonViewModel.moveNextScreen, destination: {
                        lessonViewModel.chooseDestinationLogic()
                    }, label: {
                        MButton(text: "Continue",
                                isFullWidth: false,
                                textColor : Color(.white),
                                background:  Color("primaryOrange"),
                                action: {
                                    if lessonViewModel.logicState == 3 {
                                        lessonViewModel.moveNextScreen = true
                                    } else {
                                        lessonViewModel.logicState += 1
                                        lessonViewModel.progressValueLogic += 0.25
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

struct LogicView_Previews: PreviewProvider {
    static var previews: some View {
        LogicView()
            .environmentObject(LessonViewModel())
            .environmentObject(UserManager())
            .environmentObject(GateViewModel())
    }
}
