//
//  ProgrammingView.swift
//  Mingo-IT
//
//  Created by Muhammad Abdul Ghani on 08/06/23.
//

import SwiftUI

struct ProgrammingView: View {
    @EnvironmentObject var lessonViewModel : LessonViewModel
    @EnvironmentObject  var userViewModel : UserManager
    @EnvironmentObject  var gateViewModel : GateViewModel
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 24){
                ProgressbarQuiz(value: $lessonViewModel.progressValue)
                    .frame(height: 15)
                    .padding(.horizontal,24)
                    .padding(.top,20)
                
                ScrollView{
                    
                    switch lessonViewModel.programmingState {
                    case 0 :
                        learningSection
                    case 1 :
                        secondLearningSection
                    case 2 :
                        thirdLearningSection
                    case 3 :
                        quizSection
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
                        lessonViewModel.programmingState -= 1
                        lessonViewModel.progressValue -= 0.25
                    }
                    ).disabled(lessonViewModel.programmingState == 0)
                    
                    
                    NavigationLink(isActive: $lessonViewModel.moveNextScreen, destination: {
                           lessonViewModel.chooseDestinationProgramming()
                    }, label: {
                        MButton(text: "Continue",
                                isFullWidth: false,
                                textColor : Color(.white),
                                background:  Color("primaryOrange"),
                                action: {
                                    if lessonViewModel.programmingState == 3 {
                                        lessonViewModel.moveNextScreen = true
                                    } else {
                                        lessonViewModel.programmingState += 1
                                        lessonViewModel.progressValue += 0.25
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

struct ProgrammingView_Previews: PreviewProvider {
    static var previews: some View {
        ProgrammingView()
            .environmentObject(UserManager())
            .environmentObject(GateViewModel())
            .environmentObject(LessonViewModel())
    }
}






