//
//  ProgrammingView.swift
//  Mingo-IT
//
//  Created by Muhammad Abdul Ghani on 08/06/23.
//

import SwiftUI

struct ProgrammingView: View {
    @AppStorage("progressValue") private var progressValue : Double  = 0.25
    @AppStorage("programmingState") private var programmingState = 0
    @AppStorage("userAnswerDrag") var userAnswerDrag = ""
    @AppStorage("userAnswerFill") var userAnswerFill = ""
    @AppStorage("userAnswerChoice") var userAnswerChoice = ""
    @State private var moveNextScreen  = false
    @StateObject private var userData = UserManager()
    @StateObject private var userScore = ScoreManager()

    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    
    @State var quizOnePassed: Bool = false
    @State var quizTwoPassed: Bool = false
    @State var quizThreePassed: Bool = false
    
   
    
    @ViewBuilder
    func chooseDestination() -> some View {
        if (programmingState == 3) && (userScore.scoreProgramming >= 2) {
            CompleteLessonScreen( materialType: .programming)
        } else {
            IncompleteLessonScreen(materialType: .programming)
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 24){
                ProgressbarQuiz(value: $progressValue)
                    .frame(height: 15)
                    .padding(.horizontal,24)
                    .padding(.top,20)
                
                ScrollView{
                    switch programmingState {
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
                        programmingState -= 1
                        progressValue -= 0.25
                     }
                    ).disabled(programmingState == 0)
                    
                    MButton(text: "Continue",
                            isFullWidth: false,
                            textColor : Color(.white),
                            background:  Color("primaryOrange"),
                            action: {
                        if programmingState == 3 {
                            moveNextScreen = true
                        } else {
                            programmingState += 1
                            progressValue += 0.25
                        }
                    

                    
                     }
                    ).background(
                        NavigationLink(isActive: $moveNextScreen, destination: {
                            chooseDestination()
                        }, label: {
                            EmptyView()
                        })
                    )

                }
                
//                ini text untuk placeholder aja untuk check scorenya masuk atau ngga , nantinya akan di remove text ini
                Text("Score \(userScore.scoreProgramming)")
                    .padding(.leading, 150)
                
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
        
        
    }
}

struct ProgrammingView_Previews: PreviewProvider {
    static var previews: some View {
        ProgrammingView()
    }
}


extension ProgrammingView {
    private var learningSection : some View {
        VStack(alignment: .leading, spacing: 24){
            Text("Basic Algorithms")
                .font(.custom("SFProRounded-SemiBold", size: 32))
            
            Image("AlgoIllustration")
                .frame(maxWidth: .infinity)
            
            Text("In our daily lives, from making breakfast to solving math problems to folding clothes, takes a set of step-by-step instructions to perform tasks. These series of sets are called, Algorithms.")
                .font(.custom("SFProRounded-light", size: 20))
            
            
            Text("Algorithms are sets of instructions of what steps to take to complete a task or solve a problem. They are all around us, from making breakfast to doing homework")
                .font(.custom("SFProRounded-light", size: 20))
        }
        .padding(.horizontal,24)
    }
    
    
    
    
    private var quizMultipleSection : some View {
        VStack(alignment: .leading, spacing: 24){
            Text("Here are some simple algorithm examples: \n \n1. Brushing Your Teeth \n2. Wet your toothbrush. \n3. Put toothpaste on the toothbrush. \n4. Brush your teeth for two minutes. \n5. Spit out the toothpaste. \n6. Rinse your mouth and toothbrush with water. \n \n \nAlgorithms help us complete tasks efficiently and effectively.")
            .font(.custom("SFProRounded-light", size: 20))
                        
            QuizCard(

                materialType: .programming,
                userAnswer: $userAnswerChoice,
                isTry: $userData.isDoneQuestionOne,
                isPassed: $quizOnePassed,
                title: "What exactly Algorithm is?",
                answer: "A sets of Instructions",
                items: ["A sets of command", "A sets of Instructions", "A sets for making tea"],
                explanation: "Algorithms are sets of instructions of what steps to take to complete a task or solve a problem.",
                quizType: .multipleChoice
            )
            
            Spacer()
        }
        .padding(.horizontal, 24)
    }
    
    private var fillTheBlankSection : some View {
        VStack(alignment: .leading, spacing: 24){
           
            
            QuizCard(
                materialType: .programming,
                userAnswer: $userAnswerFill,
                isTry: $userData.isDoneQuestionTwo,

                isPassed: $quizTwoPassed,
                question: [
                    "An algorithm is a set of step-by-step",
                    "logic",
                    "that describe how to perform a task."
                ],
                explanation: "An algorithm is a set of step-by-step instruction  that describe how to perform a task. ",
                quizType: .fillTheBlank
            )
        }
        .padding(.horizontal,24)
    }
    
    private var dragAndDropSection : some View {
        VStack(alignment: .leading, spacing: 24){
           Text("Help Mingo to Arrange a sequence that changes the contents of glasses A and B so that the red water is in glass A and the blue water is in glass B.")
                .font(.custom("SFProRounded-light", size: 20))

            HStack {
                Spacer()
                Image("image6")
                Spacer()

            }
               
            
            
            QuizCard(
                materialType: .programming,
                userAnswer: $userAnswerDrag,
                isTry: $userData.isDoneQuestionThree,

                isPassed: $quizThreePassed,
                items: ["Pour the contents of glass C into glass B", "Pour the contents of glass A into glass C", "Pour the contents of glass B into glass A"],
                itemAnswers: ["Pour the contents of glass B into glass A", "Pour the contents of glass C into glass B", "Pour the contents of glass A into glass C"],
                explanation: "Algorithms are sets of instructions of what steps to take to complete a task or solve a problem.",
                quizType: .drag
            )
            
            
        }
        .padding(.horizontal,24)

    }
    
    
}





