//
//  ProgrammingView.swift
//  Mingo-IT
//
//  Created by Muhammad Abdul Ghani on 08/06/23.
//

import SwiftUI

struct ProgrammingView: View {
    @EnvironmentObject private var lessonViewModel : LessonViewModel
    @EnvironmentObject private var userViewModel : UserManager
    @EnvironmentObject private var gateViewModel : GateViewModel
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


extension ProgrammingView {
    private var learningSection : some View {
        VStack(alignment: .leading, spacing: 24){
            Text("Basic Programming")
                .font(.system(size: 32 , weight: .semibold , design: .rounded))
            
            Text("Programming is like giving instructions to a computer to perform tasks, just like how we give directions or instructions to a friend.")
                .font(.system(size: 20 , weight: .light , design: .rounded))
            
            Text("Imagine you are the director of your own digital world, where you get to be creative and problem-solve by breaking big tasks into small steps.")
                .font(.system(size: 20 , weight: .light , design: .rounded))
            
            Text("With programming, kids can explore their ideas, think logically, and have fun while they learn a valuable skill that can open doors to endless possibilities")
            .font(.system(size: 20 , weight: .light , design: .rounded))        }
        .padding(.horizontal,24)
    }
    
    private var secondLearningSection : some View {
        VStack(alignment: .leading, spacing: 24){
            
            Text("Imagine you have a robot friend who can do all sorts of things, like making breakfast or cleaning your room.")
                .font(.system(size: 20 , weight: .light , design: .rounded))
            
            Text("But your robot friend doesn't understand spoken language, so you need to give it precise instructions in a language it understands.")
                .font(.system(size: 20 , weight: .light , design: .rounded))
            Text("That's where programming comes in! You can use simple commands to tell your robot friend what to do step by step. ")
                .font(.system(size: 20 , weight: .light , design: .rounded))
            Text("For example, you can program it to pour cereal into a bowl, then add milk, and finally, use a spoon to eat it.")
                .font(.system(size: 20 , weight: .light , design: .rounded))
            Text("By writing these instructions in a special language, you can teach your robot friend to make a delicious bowl of cereal every morning.")
                .font(.system(size: 20 , weight: .light , design: .rounded))
            Text("Programming allows you to control the robot's actions and make it your helpful assistant in daily tasks.")
                .font(.system(size: 20 , weight: .light , design: .rounded))
            Spacer()
        }
        .padding(.horizontal,24)
    }
    
    private var thirdLearningSection : some View {
        VStack(alignment: .leading, spacing: 24){
            
            Text("Here's a very basic example of programming")
                .font(.system(size: 20 , weight: .light , design: .rounded))
            Image("programmingImage")
                .resizable()
                .scaledToFit()
                .frame(width: .infinity, height: .infinity)
            Text("In this example, the print() will display the message inside () as the output. This example tells or commands the computer to display the data inside the parentheses ().")
                .font(.system(size: 20 , weight: .light , design: .rounded))
            Text("So, it's like we give a command to the computer to print the text \"I am feeling code today!\". ")
                .font(.system(size: 20 , weight: .light , design: .rounded))
            Text("Note: To print a text you need to wrap the text over the double quote.")
                .font(.system(size: 20 , weight: .light , design: .rounded))
            Text("Later we will catch more about programming with one of the most powerful languages that build your iOS app now.")
                .font(.system(size: 20 , weight: .light , design: .rounded))
            
            
            Spacer()
        }
        .padding(.horizontal,24)
    }
    
    private var quizSection : some View {
        VStack(alignment: .leading, spacing: 24){
            
            QuizCard(
                
                materialType: .programming,
                userAnswer: $lessonViewModel.userAnswerChoice,
                isTry: $userViewModel.isDoneQuestionOne,
                isPassed: $lessonViewModel.quizOnePassed,
                title: "Which one of these describe programming correctly?",
                answer: "Programming is giving instructions to a computer to perform tasks",
                items: ["Programming is giving instructions to a computer to perform tasks", "Programming is the way to communicate with robot", "Programming is a sets of instruction"],
                explanation: "Programming is giving instructions to a computer to perform tasks",
                quizType: .multipleChoice
            )
            
            QuizCard(
                materialType: .programming,
                userAnswer: $lessonViewModel.userAnswerFill,
                isTry: $userViewModel.isDoneQuestionTwo,
                isPassed: $lessonViewModel.quizTwoPassed,
                question: [
                    "(“Hello, Swift!”)",
                    "print",
                    "What is the command used to show Hello, Swift into the screen?"
                    
                ],
                explanation: "The print() function prints the specified message to the screen, or other standard output device.The message can be a string, or any other object, the object will be converted into a string before written to the screen.",
                quizType: .fillTheBlank
            )
            
            QuizCard(
                
                materialType: .programming,
                userAnswer: $lessonViewModel.userAnswerChoice,
                isTry: $userViewModel.isDoneQuestionThree,
                isPassed: $lessonViewModel.quizThreePassed,
                title: "Which quote we used to print a string text?",
                answer: "Double Quote (“ )",
                items: ["Double Quote (“ )", "Single Quote (‘ )", "Back Quote (` )"],
                explanation: "Double Quote (“ ) is used to print a string text",
                quizType: .multipleChoice
            )
            
            Spacer()
        }
        .padding(.horizontal, 24)
    }
}





