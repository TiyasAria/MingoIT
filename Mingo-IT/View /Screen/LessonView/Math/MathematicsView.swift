//
//  MathematicsView.swift
//  Mingo-IT
//
//  Created by Muhammad Abdul Ghani on 09/06/23.
//

import SwiftUI

struct MathematicsView: View {
    @EnvironmentObject  var lessonViewModel : LessonViewModel
    @EnvironmentObject  var userViewModel : UserManager
    @EnvironmentObject  var gateViewModel : GateViewModel
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    var body: some View {
        NavigationStack{
            VStack(alignment: .leading,spacing: 24){
                ProgressbarQuiz(value: $lessonViewModel.progressValueMath)
                    .frame(height: 15)
                    .padding(.horizontal,24)
                    .padding(.top,20)
                
                ScrollView{
                    switch lessonViewModel.mathematicState {
                    case 0 :
                       learningSection
                    case 1 :
                        secondLearningSection
                    case 2 :
                        thirdLearningSection
                    case 3 :
                        fourthLearningSection
                    case 4 :
                        fifthLearningSection
                    case 5 :
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
                                lessonViewModel.mathematicState -= 1
                                lessonViewModel.progressValueMath -= 0.167
                            }
                    ).disabled(lessonViewModel.mathematicState == 0)
                    
                    
                    NavigationLink(isActive: $lessonViewModel.moveNextScreen, destination: {
                        lessonViewModel.chooseDestinationMath()
                    }, label: {
                        MButton(text: "Continue",
                                isFullWidth: false,
                                textColor : Color(.white),
                                background:  Color("primaryOrange"),
                                action: {
                                    if lessonViewModel.mathematicState == 5 {
                                        lessonViewModel.moveNextScreen = true
                                    } else {
                                        lessonViewModel.mathematicState += 1
                                        lessonViewModel.progressValueMath += 0.167
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

struct MathematicsView_Previews: PreviewProvider {
    static var previews: some View {
        MathematicsView()
            .environmentObject(LessonViewModel())
            .environmentObject(UserManager())
            .environmentObject(GateViewModel())
            .environmentObject(ScoreManager())
    }
}



