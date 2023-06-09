//
//  LessonScreen.swift
//  Mingo-IT
//
//  Created by Zai on 08/06/23.
//

import SwiftUI

struct LessonScreen: View {

    @State private var progress: Float = 0.5
    @State private var backToGate = false


    @State var quizOnePassed: Bool = false
    @State var quizTwoPassed: Bool = false
    @State var quizThreePassed: Bool = false
    

    var body: some View {
        VStack {
            HStack{
                NavigationLink(isActive: $backToGate, destination: {
                    GatePageScreen()
                }, label: {
                    Image(systemName: "xmark")
                                .font(.system(size: 24))
                                .bold()
                            .foregroundColor(Color("primaryBlue"))
                            .onTapGesture {
                                backToGate = true
                            }
                })
                
                ProgressView(value: progress)
                               .progressViewStyle(LinearProgressViewStyle())
                               .accentColor(Color("primaryBlue"))
                              
            }
            .padding(.horizontal,24)
            ScrollView {
               
                VStack(alignment: .leading, spacing: 25) {
                    Text("Basic Algorithm")
                        .font(.custom("SFProRounded-SemiBold", size: 32))
                    
                    QuizCard(
                        isPassed: $quizOnePassed,
                        items: ["Pour the contents of glass C into glass B", "Pour the contents of glass A into glass C", "Pour the contents of glass B into glass A"],
                        itemAnswers: ["Pour the contents of glass B into glass A", "Pour the contents of glass C into glass B", "Pour the contents of glass A into glass C"],
                        explanation: "Algorithms are sets of instructions of what steps to take to complete a task or solve a problem.",
                        quizType: .drag
                    )
                    
                    QuizCard(
                        isPassed: $quizTwoPassed,
                        question: [
                            "An algorithm is a set of step-by-step",
                            "logic",
                            "that describe how to perform a task."
                        ],
                        explanation: "An algorithm is a set of step-by-step instruction  that describe how to perform a task. ",
                        quizType: .fillTheBlank
                    )
                    
                    QuizCard(
                        isPassed: $quizThreePassed,
                        title: "What exactly Algorithm is?",
                        answer: "A sets of Instructions",
                        items: ["A sets of command", "A sets of Instructions", "A sets for making tea"],
                        explanation: "Algorithms are sets of instructions of what steps to take to complete a task or solve a problem.",
                        quizType: .multipleChoice
                    )
                    
                    Image("AlgoIllustration")
                        .frame(maxWidth: .infinity)

                    Text("In our daily lives, from making breakfast to solving math problems to folding clothes, takes a set of step-by-step instructions to perform tasks. These series of sets are called, Algorithms.")

                    Text("Algorithms are sets of instructions of what steps to take to complete a task or solve a problem. They are all around us, from making breakfast to doing homework.")
                    
                    
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(20)
            
            MButton(text: "Continue", isFullWidth: true, background: Color("primaryOrange"))
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct LessonScreen_Previews: PreviewProvider {
    static var previews: some View {
        LessonScreen()
    }
}
