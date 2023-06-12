//
//  MathematicsView.swift
//  Mingo-IT
//
//  Created by Muhammad Abdul Ghani on 09/06/23.
//

import SwiftUI

struct MathematicsView: View {
    @AppStorage("progressValueMath") private var progressValueMath : Double  = 0.167
    @AppStorage("mathState") private var mathematicState = 0
    @AppStorage("userMathAnswerChoice1") var userMathAnswerChoice1 = ""
    @AppStorage("userMathAnswerChoice2") var userMathAnswerChoice2 = ""
    @AppStorage("userMathAnswerChoice3") var userMathAnswerChoice3 = ""
    @State private var moveNextScreen  = false
    @StateObject private var userData = UserManager()
    @StateObject private var userScore = ScoreManager()
    
    @State var quizOnePassed: Bool = false
    @State var quizTwoPassed: Bool = false
    @State var quizThreePassed: Bool = false
    @Binding var mingoGatePosition: CGPoint

    @ViewBuilder
    func chooseDestination() -> some View {
        if (mathematicState == 5) && (userScore.scoreMath >= 2) {
            CompleteLessonScreen( materialType: .mathematic)
        } else {
            IncompleteLessonScreen(materialType: .mathematic)
        }
    }
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    var body: some View {
        NavigationStack{
            VStack(alignment: .leading,spacing: 24){
                ProgressbarQuiz(value: $progressValueMath)
                    .frame(height: 15)
                    .padding(.horizontal,24)
                    .padding(.top,20)
                
                ScrollView{
                    switch mathematicState {
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
                        mathematicState -= 1
                        progressValueMath -= 0.167
                     }
                    ).disabled(mathematicState == 0)
                    
                    
                    NavigationLink(isActive: $moveNextScreen, destination: {
                            chooseDestination()
                    }, label: {
                        MButton(text: "Continue",
                                isFullWidth: false,
                                textColor : Color(.white),
                                background:  Color("primaryOrange"),
                                action: {
                            if mathematicState == 5 {
                                moveNextScreen = true
                            } else {
                                mathematicState += 1
                                progressValueMath += 0.167
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
                       mingoGatePosition = .zero
                   }
    }
}

struct MathematicsView_Previews: PreviewProvider {
    static var previews: some View {
        MathematicsView(mingoGatePosition: .constant(.zero))
    }
}

extension MathematicsView {
    private var learningSection : some View {
        VStack(alignment: .leading, spacing: 24){
            Text("Kalkulus")
                .font(.custom("SFProRounded-SemiBold", size: 32))
            
            Image("calculus")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 300, maxHeight: 200)
            
            
            Text("Calculus, an essential discipline in the realm of computer science, delves into the realm of change and continuous calculations.")
                .font(.custom("SFProRounded-Light", size: 20))
            
            
            Text("Within calculus, you will explore fundamental concepts such as limits, integrals, and differentials that serve as building blocks for comprehending the behavior of systems in computer science.")
                .font(.custom("SFProRounded-Light", size: 20))
            
            Text("This field equips you with the necessary mathematical tools to analyze and optimize algorithms, model intricate computational systems, and grasp the underlying principles that drive data processing.")
                .font(.custom("SFProRounded-Light", size: 20))
            
            Spacer()


        }
        .padding(.horizontal,24)
    }
    
    private var secondLearningSection : some View {
        VStack(alignment: .leading, spacing: 24){
            Text("A solid grasp of calculus is indispensable in the realm of computer science as it enables you to employ analytical approaches to tackle complex problems, fine-tune solutions, and grasp the nuances of change within computer systems.")
                .font(.custom("SFProRounded-Light", size: 20))
            
            Text("Armed with this knowledge, you will possess the ability to develop efficient solutions, optimize algorithms, and effectively analyze system behavior in computational environments. ")
                .font(.custom("SFProRounded-Light", size: 20))
            
            Text("Moreover, calculus serves as a fundamental mathematical framework for scrutinizing algorithms, modeling computational systems, and understanding the principles that underpin data processing within the field of computer science.")
                .font(.custom("SFProRounded-Light", size: 20))
            
            Spacer()

        }
        .padding(.horizontal, 24)
    }
    
    private var thirdLearningSection : some View {
        VStack(alignment: .leading, spacing: 24){
            Text("Limit")
                .font(.custom("SFProRounded-SemiBold", size: 32))
            
            
            Text("Limit is a mathematical concept that models the behavior of a function as it approaches a specific value, where the function either approaches a fixed value or becomes infinite.")
                .font(.custom("SFProRounded-Light", size: 20))
            
            
            Text("Let's examine the concept or general form of the limit of a function below: \nThe limit of f(x) approaching c equals L, expressed as:")
                .font(.custom("SFProRounded-Light", size: 20))
            
            Image("limit1")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 200, maxHeight: 200)
            
            
            Text("If for every x sufficiently close to c but not equal to c, f(x) approaches L.")
                .font(.custom("SFProRounded-Light", size: 20))
            
            Spacer()


        }
        .padding(.horizontal,24)
    }
    private var fourthLearningSection : some View {
        VStack(alignment: .leading, spacing: 24){
            Text("Properties of function limits")
                .font(.custom("SFProRounded-SemiBold", size: 24))
            
            
            Text("The properties of algebraic function limits are determined by the following theorems, where n is a positive integer, k is a constant, and f and g are functions that have limits at c:")
                .font(.custom("SFProRounded-Light", size: 20))
            
            
        
            
            Image("limit2")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 500, maxHeight: 500)
            
            Spacer()
          

        }
        .padding(.horizontal,24)
    }
    private var fifthLearningSection : some View {
        VStack(alignment: .leading, spacing: 24){
            Text("Finding the value of a function limit")
                .font(.custom("SFProRounded-SemiBold", size: 24))
            
            
            Text("To find the value of a function limit, there are several approaches that can be used:")
                .font(.custom("SFProRounded-Light", size: 20))
            
            Text("1.Direct Substitution Approach \n \nIf the function can be substituted with a value that approaches the given point, we can determine the value of the function as the point is approached. For example, if we want to find lim f(x) as x approaches a, we can try substituting values of x that approach a into the function f(x).")
                .font(.custom("SFProRounded-Light", size: 20))
            
            Image("limit3")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 300, maxHeight: 300)
                .padding(.bottom, 10)
            
            Text("2.Common Multiples Method/Rationalizing Method \n \nThis method is used when the function involves fractions or radicals. By multiplying the numerator and denominator of the function by the conjugate or a suitable factor, we can simplify the expression and eliminate any indeterminate forms to find the limit.")
                .font(.custom("SFProRounded-Light", size: 20))
            
            Image("limit4")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 300, maxHeight: 300)
                .padding(.bottom, 10)

            
            Text("3.Factoring Method/Algebraic Manipulation Approach \n \nIn some cases, we can use algebraic manipulations to simplify the function before finding its limit. This involves using simple algebraic techniques such as factoring, simplifying fractions, or rationalizing square roots to eliminate indeterminate forms such as 0/0 or ∞/∞.")
                .font(.custom("SFProRounded-Light", size: 20))
            
            Image("limit5")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 300, maxHeight: 300)
            
           
            
            Spacer()
          

        }
        .padding(.horizontal,24)
    }
    
    private var quizSection : some View {
        
       
        VStack(spacing: 24){
            QuizCard(
                materialType: .mathematic,
                userAnswer: $userMathAnswerChoice1,
                isTry: $userData.isDoneQuestionOne,
                isPassed: $quizOnePassed,
                title: "$$\\lim\\limits_{x \to 2} \\frac{x^{2}-3x+2}{x-1}=$$",
                answer: "0",
                items: ["-2", "0" , "1"],
                explanation: "$$\\lim\\limits_{x \to 2} \\frac{x^{2}-3x+2}{x-1}=\\frac{(2)^{2}-3(2)+2}{(2)-1}=\\frac{4-6+2}{2-1}=\\frac{0}{1}=0$$",
                quizType: .multipleChoice
            )
            
            QuizCard(
                materialType: .mathematic,
                userAnswer: $userMathAnswerChoice2,
                isTry: $userData.isDoneQuestionTwo,
                isPassed: $quizOnePassed,
                title: "$$\\lim \\limits_{x \to 2} \\frac{2x^{2}-x-6}{3x^{2}-5x-2}=$$",
                answer: "1",
                items: ["1", "2" , "-2"],
                explanation: "$$\\lim \\limits_{x \to 2} \\frac{2x^{2}-x-6}{3x^{2}-5x-2}=\\frac{(2x+3)\\cancel{(x-2)}}{(3x+1)\\cancel{(x-2)}}=\\frac{(2x+3)}{(3x+1)}=\\frac{2(2)+3}{3(2)+1}=\\frac{7}{7}=1$$",
                quizType: .multipleChoice
            )
            
            QuizCard(
                materialType: .mathematic,
                userAnswer: $userMathAnswerChoice3,
                isTry: $userData.isDoneQuestionThree,
                isPassed: $quizOnePassed,
                title: "$$\\lim\\limits_{x \to 3} \\frac{(x-3)(\\sqrt{x}+\\sqrt{3})}{(\\sqrt{x}-\\sqrt{3})}=$$",
                answer: "12",
                items: ["-12", "9" , "12"],
                explanation: "$$\\lim \\limits_{x \to 3} \\frac{(x-3)(\\sqrt{x}+\\sqrt{3})}{(\\sqrt{x}-\\sqrt{3})}=\\frac{(x-3)(\\sqrt{x}+\\sqrt{3})}{\\sqrt{x}-\\sqrt{3}}\\frac{(\\sqrt{x}+\\sqrt{3})}{(\\sqrt{x}+\\sqrt{3})}\\frac{\\cancel{(x-3)}(\\sqrt{x}+\\sqrt{3})(\\sqrt{x}+\\sqrt{3})}{\\cancel{(x-3)}}\\frac{(\\sqrt{x}+\\sqrt{3})(\\sqrt{x}+\\sqrt{3})}{1}(2\\sqrt{3})(2\\sqrt{3})=12$$",
                quizType: .multipleChoice
            )
        }.padding(.horizontal, 24)
    }
}


