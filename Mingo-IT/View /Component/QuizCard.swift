//
//  QuizCard.swift
//  Mingo-IT
//
//  Created by Zai on 06/06/23.
//

import SwiftUI
import LaTeXSwiftUI

enum QuizType {
    case multipleChoice, fillTheBlank, drag
}

enum QuizMaterial {
    case logic , mathematic , programming , design
}

struct QuizCard: View {
    let materialType : QuizMaterial
    
    @Binding var userAnswer: String
    @Binding var isTry : Bool
    @Binding var isPassed: Bool
    var score = 0
    @State private var isSelected = false
    @State private var isExplain = false
    @State private var isSubmitted = false
    @State private var isCorrect = false
    @State private var isInCorrect = false
    @State private var isTypeing = false
    @State private var isEditing:Bool = false
    @State private var userAnswerDrag: [String] = [String]()
    @State private var selectedId: String = ""

    @EnvironmentObject private var userScore : ScoreManager
    @EnvironmentObject private var userManager : UserManager
   
    
    var title: String?
    var question: [String]?
    @State var answer: String = ""
    var items: [String] = []
    var itemAnswers: [String] = []
    var explanation: String
    var quizType: QuizType
    
        var body: some View {
            
            return VStack {
                VStack {
                    VStack(alignment: .leading, spacing: 20) {
                        if isExplain {
                            Group {
                                if title != nil {
                                   LaTeX(title!)
                                }
                                
                                Text("Explanation")
                                    .font(.headline)
                                
                                LaTeX(explanation)
                            }
                        }else {
                            if title != nil {
                                LaTeX(title!)
                            }
                            
                            switch quizType {
                            case .multipleChoice:
                                RadioButtonGroup(isTrue: $isCorrect, isSelected: $isSelected, items: items, selectedId: $selectedId) { selected in
                                    userAnswer = selected
                                    
                                }
                                
                            case .fillTheBlank:
                                
                                VStack {
                                    Group {
                                        Text("\(question![0]) ")
                                        + Text(userAnswer != "" ? "\(userAnswer)" : " ____ ")
                                            .bold()
                                        + Text(" \(question![2])")
                                    }
                                    .onTapGesture {
                                        isEditing = true
                                    }
                                    
                                    if isEditing {
                                        TextField("Enter your answer", text: $userAnswer)
                                            .textFieldStyle(RoundedBorderTextFieldStyle())
                                    }
                                }
                                .padding()

                                
                            case .drag:
                                VStack {
                                    DragAndDrop(userAnswer: $userAnswerDrag, items: ["Pour the contents of glass C into glass B", "Pour the contents of glass A into glass C", "Pour the contents of glass B into glass A"])
                                }
                                .frame(maxWidth: .infinity, minHeight: 400)
                            }
                        }
                    }
                    
                    if !isExplain {
                        if isCorrect {
                            
                            Text("Good Job! 🥳")
                                .font(.headline)
                                .offset(y: 20)
                                .foregroundColor(Color("borderCardTrue"))
                        }else if isInCorrect {
                            Text("Try Again! 😭")
                                .foregroundColor(Color("borderCardFalse"))
                                .font(.headline)
                                .offset(y: 20)
                        }
                    }
                    
                    HStack(spacing: -25) {
                        MButton(
                            text: "Explanation",
                            textColor: isSubmitted ? .black : .gray,
                            background: isSubmitted ? .white : Color("greyButtonDisabled")) {
                            if isSubmitted {
                                isExplain.toggle()
                            }
                        }
                        
                        MButton(text: "Submit", background: Color("primaryOrange")) {
                          
                            if !isExplain {
                                isSelected = true
                                selectedId = userAnswer
                                
                                switch quizType {
                                case .drag:
                                    var userAnswerContainer: [String] = userAnswerDrag
                                    userAnswerContainer.append(itemAnswers[itemAnswers.count - 1])
                                    
                                    answer = itemAnswers.joined()
                                    userAnswer = userAnswerContainer.joined()
                                case .fillTheBlank:
                                    answer = question![1]
                                   
                                case .multipleChoice:
                                  
                                    break
                                }
                                
                                if userAnswer != "" {
                                    isSubmitted = true
                                   
                                    if userAnswer.lowercased() == answer.lowercased() {
                                        isCorrect = true
                                        isInCorrect = false
                                    }else {
                                        isCorrect = false
                                        isInCorrect = true
                                    }
                                    
                                    
                                    isPassed = isCorrect
                                    userManager.isDoneQuestionOne = true
                                    userManager.isDoneQuestionTwo = true
                                    userManager.isDoneQuestionThree = true

                                }
//                                 update score 
                                if isCorrect == true {
                                    switch materialType {
                                    case .programming :
                                        userScore.updateScoreProgramming()
                                    case.logic :
                                        userScore.updateScoreLogic()
                                    case.design :
                                        userScore.updateScoreDesign()
                                    case.mathematic :
                                        userScore.updateScoreMath()
                                    default :
                                        break
                                    }
                               
                                }
                               
                                
                                
                            }
                          
                        }.disabled(isSubmitted)
                    }
                    .offset(y: 20)
                }
                .onAppear {
                        if userAnswer != "" {
                            switch quizType {
                            case .multipleChoice:
                                isSelected = true
                                selectedId = answer
                                
                            case .fillTheBlank:
                                answer = question![1]
                                
                            case .drag:
                                break
                            }
                            
                            if quizType != .drag {
                                isSubmitted = true
                               
                                if userAnswer.lowercased() == answer.lowercased() {
                                    isCorrect = true
                                    isInCorrect = false
                                }else {
                                    isCorrect = false
                                    isInCorrect = true
                                }
                            }
                        }
                }
                .frame(width: 280)
                .padding(30)
                .background(isCorrect ? Color("backgroundCardTrue") :
                                isInCorrect ? Color("backgroundCardFalse") : Color("backgroundCard"))
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(isCorrect ? Color("borderCardTrue") :
                                    isInCorrect ? Color("borderCardFalse") : Color("borderCard"), lineWidth: 1)
                )
            }
        }
}
