//
//  ExtensionsMath.swift
//  Mingo-IT
//
//  Created by tiyas aria on 19/08/23.
//

import SwiftUI

extension MathematicsView {
     var learningSection : some View {
        VStack(alignment: .leading, spacing: 24){
            Text("Kalkulus")
                .font(.system(size: 32 , weight: .semibold , design: .rounded))

            Image("calculus")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 300, maxHeight: 200)
            
            
            Text("Calculus, an essential discipline in the realm of computer science, delves into the realm of change and continuous calculations.")
                .font(.system(size: 20 , weight: .light , design: .rounded))

            
            Text("Within calculus, you will explore fundamental concepts such as limits, integrals, and differentials that serve as building blocks for comprehending the behavior of systems in computer science.")
                .font(.system(size: 20 , weight: .light , design: .rounded))

            Text("This field equips you with the necessary mathematical tools to analyze and optimize algorithms, model intricate computational systems, and grasp the underlying principles that drive data processing.")
                .font(.system(size: 20 , weight: .light , design: .rounded))

            Spacer()


        }
        .padding(.horizontal,24)
    }
    
     var secondLearningSection : some View {
        VStack(alignment: .leading, spacing: 24){
            Text("A solid grasp of calculus is indispensable in the realm of computer science as it enables you to employ analytical approaches to tackle complex problems, fine-tune solutions, and grasp the nuances of change within computer systems.")
                .font(.system(size: 20 , weight: .light , design: .rounded))

            Text("Armed with this knowledge, you will possess the ability to develop efficient solutions, optimize algorithms, and effectively analyze system behavior in computational environments. ")
                .font(.system(size: 20 , weight: .light , design: .rounded))

            Text("Moreover, calculus serves as a fundamental mathematical framework for scrutinizing algorithms, modeling computational systems, and understanding the principles that underpin data processing within the field of computer science.")
                .font(.system(size: 20 , weight: .light , design: .rounded))

            Spacer()

        }
        .padding(.horizontal, 24)
    }
    
     var thirdLearningSection : some View {
        VStack(alignment: .leading, spacing: 24){
            Text("Limit")
                .font(.system(size: 32 , weight: .bold , design: .rounded))

            
            Text("Limit is a mathematical concept that models the behavior of a function as it approaches a specific value, where the function either approaches a fixed value or becomes infinite.")
                .font(.system(size: 20 , weight: .light , design: .rounded))

            
            Text("Let's examine the concept or general form of the limit of a function below: \nThe limit of f(x) approaching c equals L, expressed as:")
                .font(.system(size: 20 , weight: .light , design: .rounded))

            Image("limit1")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 200, maxHeight: 200)
            
            
            Text("If for every x sufficiently close to c but not equal to c, f(x) approaches L.")
                .font(.system(size: 20 , weight: .light , design: .rounded))

            Spacer()


        }
        .padding(.horizontal,24)
    }
     var fourthLearningSection : some View {
        VStack(alignment: .leading, spacing: 24){
            Text("Properties of function limits")
                .font(.system(size: 24 , weight: .semibold , design: .rounded))

            
            Text("The properties of algebraic function limits are determined by the following theorems, where n is a positive integer, k is a constant, and f and g are functions that have limits at c:")
                .font(.system(size: 20 , weight: .light , design: .rounded))

            Image("limit2")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 500, maxHeight: 500)
            
            Spacer()
          

        }
        .padding(.horizontal,24)
    }
     var fifthLearningSection : some View {
        VStack(alignment: .leading, spacing: 24){
            Text("Finding the value of a function limit")
                .font(.system(size: 24 , weight: .semibold , design: .rounded))

            Text("To find the value of a function limit, there are several approaches that can be used:")
                .font(.system(size: 20 , weight: .light , design: .rounded))

            Text("1.Direct Substitution Approach \n \nIf the function can be substituted with a value that approaches the given point, we can determine the value of the function as the point is approached. For example, if we want to find lim f(x) as x approaches a, we can try substituting values of x that approach a into the function f(x).")
                .font(.system(size: 20 , weight: .light , design: .rounded))

            Image("limit3")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 300, maxHeight: 300)
                .padding(.bottom, 10)
            
            Text("2.Common Multiples Method/Rationalizing Method \n \nThis method is used when the function involves fractions or radicals. By multiplying the numerator and denominator of the function by the conjugate or a suitable factor, we can simplify the expression and eliminate any indeterminate forms to find the limit.")
                .font(.system(size: 20 , weight: .light , design: .rounded))

            Image("limit4")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 300, maxHeight: 300)
                .padding(.bottom, 10)

            Text("3.Factoring Method/Algebraic Manipulation Approach \n \nIn some cases, we can use algebraic manipulations to simplify the function before finding its limit. This involves using simple algebraic techniques such as factoring, simplifying fractions, or rationalizing square roots to eliminate indeterminate forms such as 0/0 or ∞/∞.")
                .font(.system(size: 20 , weight: .light , design: .rounded))

            Image("limit5")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 300, maxHeight: 300)
            
            Spacer()
          
        }
        .padding(.horizontal,24)
    }
    
     var quizSection : some View {
    
        VStack(spacing: 24){
            QuizCard(
                materialType: .mathematic,
                userAnswer: $lessonViewModel.userMathAnswerChoice1,
                isTry: $userViewModel.isDoneQuestionOne,
                isPassed: $lessonViewModel.quizOnePassed,
                title: "$$\\lim\\limits_{x \to 2} \\frac{x^{2}-3x+2}{x-1}=$$",
                answer: "0",
                items: ["-2", "0" , "1"],
                explanation: "$$\\lim\\limits_{x \to 2} \\frac{x^{2}-3x+2}{x-1}=\\frac{(2)^{2}-3(2)+2}{(2)-1}=\\frac{4-6+2}{2-1}=\\frac{0}{1}=0$$",
                quizType: .multipleChoice
            )
            
            QuizCard(
                materialType: .mathematic,
                userAnswer: $lessonViewModel.userMathAnswerChoice2,
                isTry: $userViewModel.isDoneQuestionTwo,
                isPassed: $lessonViewModel.quizTwoPassed,
                title: "$$\\lim \\limits_{x \to 2} \\frac{2x^{2}-x-6}{3x^{2}-5x-2}=$$",
                answer: "1",
                items: ["1", "2" , "-2"],
                explanation: "$$\\lim \\limits_{x \to 2} \\frac{2x^{2}-x-6}{3x^{2}-5x-2}=\\frac{(2x+3)\\cancel{(x-2)}}{(3x+1)\\cancel{(x-2)}}=\\frac{(2x+3)}{(3x+1)}=\\frac{2(2)+3}{3(2)+1}=\\frac{7}{7}=1$$",
                quizType: .multipleChoice
            )
            
            QuizCard(
                materialType: .mathematic,
                userAnswer: $lessonViewModel.userMathAnswerChoice3,
                isTry: $userViewModel.isDoneQuestionThree,
                isPassed: $lessonViewModel.quizThreePassed,
                title: "$$\\lim\\limits_{x \to 3} \\frac{(x-3)(\\sqrt{x}+\\sqrt{3})}{(\\sqrt{x}-\\sqrt{3})}=$$",
                answer: "12",
                items: ["-12", "9" , "12"],
                explanation: "$$\\lim \\limits_{x \to 3} \\frac{(x-3)(\\sqrt{x}+\\sqrt{3})}{(\\sqrt{x}-\\sqrt{3})}=\\frac{(x-3)(\\sqrt{x}+\\sqrt{3})}{\\sqrt{x}-\\sqrt{3}}\\frac{(\\sqrt{x}+\\sqrt{3})}{(\\sqrt{x}+\\sqrt{3})}\\frac{\\cancel{(x-3)}(\\sqrt{x}+\\sqrt{3})(\\sqrt{x}+\\sqrt{3})}{\\cancel{(x-3)}}\\frac{(\\sqrt{x}+\\sqrt{3})(\\sqrt{x}+\\sqrt{3})}{1}(2\\sqrt{3})(2\\sqrt{3})=12$$",
                quizType: .multipleChoice
            )
        }.padding(.horizontal, 24)
    }
}
