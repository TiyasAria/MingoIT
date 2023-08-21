//
//  LogicExtensionView.swift
//  Mingo-IT
//
//  Created by tiyas aria on 18/08/23.
//

import SwiftUI

extension LogicView {
     var learningSection : some View {
        VStack(alignment: .leading, spacing: 24){
            Text("Basic Algorithms")
                .font(.system(size: 32 , weight: .semibold , design: .rounded))
            
            Image("AlgoIllustration")
                .frame(maxWidth: .infinity)
            
            Text("In our daily lives, from making breakfast to solving math problems to folding clothes, takes a set of step-by-step instructions to perform tasks. These series of sets are called, Algorithms.")
                .font(.system(size: 20 , weight: .light , design: .rounded))

            
            Text("Algorithms are sets of instructions of what steps to take to complete a task or solve a problem. They are all around us, from making breakfast to doing homework")
                .font(.system(size: 20 , weight: .light , design: .rounded))
        }
        .padding(.horizontal,24)
    }
    
     var quizMultipleSection : some View {
        VStack(alignment: .leading, spacing: 24){
            Text("Here are some simple algorithm examples: \n \n1. Brushing Your Teeth \n2. Wet your toothbrush. \n3. Put toothpaste on the toothbrush. \n4. Brush your teeth for two minutes. \n5. Spit out the toothpaste. \n6. Rinse your mouth and toothbrush with water. \n \n \nAlgorithms help us complete tasks efficiently and effectively.")
                .font(.system(size: 20 , weight: .light , design: .rounded))

            QuizCard(
                
                materialType: .logic,
                userAnswer: $lessonViewModel.userLogicAnswerChoice,
                isTry: $userViewModel.isDoneQuestionOne,
                isPassed: $lessonViewModel.quizOnePassed,
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
    
     var fillTheBlankSection : some View {
        VStack(alignment: .leading, spacing: 24){
           
            QuizCard(
                materialType: .logic,
                userAnswer: $lessonViewModel.userLogicAnswerFill,
                isTry: $userViewModel.isDoneQuestionTwo,

                isPassed: $lessonViewModel.quizTwoPassed,
                question: [
                    "An algorithm is a set of step-by-step",
                    "instruction",
                    "that describe how to perform a task."
                ],
                explanation: "An algorithm is a set of step-by-step instruction  that describe how to perform a task. ",
                quizType: .fillTheBlank
            )
        }
        .padding(.horizontal,24)
    }
    
     var dragAndDropSection : some View {
        VStack(alignment: .leading, spacing: 24){
           Text("Help Mingo to Arrange a sequence that changes the contents of glasses A and B so that the red water is in glass A and the blue water is in glass B.")
                .font(.system(size: 20 , weight: .light , design: .rounded))

            HStack {
                Spacer()
                Image("image6")
                Spacer()

            }
               
            QuizCard(
                materialType: .logic,
                userAnswer: $lessonViewModel.userLogicAnswerDrag,
                isTry: $userViewModel.isDoneQuestionThree,

                isPassed: $lessonViewModel.quizThreePassed,
                items: ["Pour the contents of glass C into glass B", "Pour the contents of glass A into glass C", "Pour the contents of glass B into glass A"],
                itemAnswers: ["Pour the contents of glass A into glass C", "Pour the contents of glass B into glass A", "Pour the contents of glass C into glass B"],
                explanation: "So this is the proper sequence to transfer the contents of the glass.  \nPour the contents of glass A into glass C \nPour the contents of glass B into glass A \nPour the contents of glass C into glass B" ,
                quizType: .drag
            )
            
            
        }
        .padding(.horizontal,24)

    }
    
}
