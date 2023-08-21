//
//  UIUXView.swift
//  Mingo-IT
//
//  Created by Muhammad Abdul Ghani on 09/06/23.
//

import SwiftUI

struct UIUXView: View {
    @EnvironmentObject private var lessonViewModel : LessonViewModel
    @EnvironmentObject private var userViewModel : UserManager
    @EnvironmentObject private var gateViewModel : GateViewModel
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    var body: some View {
        NavigationStack{
            VStack(alignment: .leading,spacing: 24){
                ProgressbarQuiz(value: $lessonViewModel.progressValueDesign)
                    .frame(height: 15)
                    .padding(.horizontal,24)
                    .padding(.top,20)
                
                ScrollView{
                    switch lessonViewModel.designState {
                    case 0 :
                       learningSection
                    case 1 :
                        UXSection
                    case 2 :
                        GoodUXSection
                    case 3 :
                        BadUXSection
                    case 4 :
                        UISection
                    case 5 :
                        GoodUISection
                    case 6 :
                        BadUISection
                    case 7 :
                        QuizSection
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
                        lessonViewModel.designState -= 1
                        lessonViewModel.progressValueDesign -= 0.125
                     }
                    ).disabled(lessonViewModel.designState == 0)
                    
                    
                    NavigationLink(isActive: $lessonViewModel.moveNextScreen, destination: {
                        lessonViewModel.chooseDestinationUiUx()
                    }, label: {
                        MButton(text: "Continue",
                                isFullWidth: false,
                                textColor : Color(.white),
                                background:  Color("primaryOrange"),
                                action: {
                                    if lessonViewModel.designState == 7 {
                                        lessonViewModel.moveNextScreen = true
                                    } else {
                                        lessonViewModel.designState += 1
                                        lessonViewModel.progressValueDesign += 0.125
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

struct UIUXView_Previews: PreviewProvider {
    static var previews: some View {
        UIUXView()
            .environmentObject(UserManager())
            .environmentObject(GateViewModel())
            .environmentObject(LessonViewModel())
    }
}

extension UIUXView {
    private var learningSection : some View {
        VStack(alignment: .leading, spacing: 24){
            Text("UI/UX Design")
                .font(.system(size: 32 , weight: .semibold , design: .rounded))
            Image("introUIUX")
                .resizable()
                .frame(width: 300, height: 300)
            
            Text("UI/UX design refers to the process of creating user interfaces and enhancing the user experience for digital products or services.")
                .font(.system(size: 20 , weight: .light , design: .rounded))
            
            Text("It involves designing the visual elements, layout, and interaction flow to ensure an intuitive and user-friendly interface.")
                .font(.system(size: 20 , weight: .light , design: .rounded))
            Text("UI (User Interface) design focuses on the appearance and aesthetics of the interface, while UX (User Experience) design emphasizes the overall user journey, usability, and satisfaction.")
                .font(.system(size: 20 , weight: .light , design: .rounded))
            Text("Through thoughtful UI/UX design, designers aim to optimize the interaction between users and digital products, resulting in a seamless and enjoyable user experience.")
            .font(.system(size: 20 , weight: .light , design: .rounded))        }
        .padding(.horizontal,24)
    }
    
    private var UXSection : some View {
        VStack(alignment: .leading, spacing: 24){
            Text("UX Design")
                .font(.system(size: 24 , weight: .semibold , design: .rounded))
            
            Text("UX, or User Experience, is all about crafting fulfilling and significant interactions for users when they engage with a product or service.")
                .font(.system(size: 20 , weight: .light , design: .rounded))
            Text("It entails employing user-centered design principles to create experiences that are intuitive, enjoyable, and user-friendly.")
                .font(.system(size: 20 , weight: .light , design: .rounded))
            Text("UX design encompasses a range of tasks, including user research, persona creation, information organization, prototyping, usability testing, visual and interactive design, accessibility considerations, and iterative design based on user feedback.")
                .font(.system(size: 20 , weight: .light , design: .rounded))
            Text("The objective is to deliver experiences that are intuitive, enjoyable, and aligned with user needs and objectives.")
                .font(.system(size: 20 , weight: .light , design: .rounded))
            Text("To better understand UX, let's examine the differences between good and bad UX in a calculator app.")
                .font(.system(size: 20 , weight: .light , design: .rounded))
          Spacer()
        
        }
        .padding(.horizontal,24)
    }
    
    private var GoodUXSection : some View {
        VStack(alignment: .leading, spacing: 24){
            Text("Good UX")
                .font(.system(size: 24 , weight: .semibold , design: .rounded))
            
            Text("In the first calculator application, the numbers are arranged in a familiar and logical order, following the standard layout of a traditional calculator.")
                .font(.system(size: 20 , weight: .light , design: .rounded))
            Text("The buttons are labeled clearly, making it easy for users to locate and press the desired numbers. ")
                .font(.system(size: 20 , weight: .light , design: .rounded))
            Text("The overall design and functionality of the calculator are intuitive and user-friendly, allowing users to perform calculations without any confusion or frustration.")
                .font(.system(size: 20 , weight: .light , design: .rounded))
           Image("goodUX")
                .resizable()
                .frame(width: 300, height: 600)
            
         
        
          Spacer()
        
        }
        .padding(.horizontal,24)
    }
    
    private var BadUXSection : some View {
        VStack(alignment: .leading, spacing: 24){
            Text("Bad UX")
                .font(.system(size: 24 , weight: .semibold , design: .rounded))
            
            Text("In the second calculator application, the arrangement of numbers is unconventional and differs significantly from the standard layout of a calculator. ")
                .font(.system(size: 20 , weight: .light , design: .rounded))
            Text("The buttons may be positioned randomly or follow a non-intuitive pattern, making it difficult for users to find and select the correct numbers. ")
                .font(.system(size: 20 , weight: .light , design: .rounded))
            Text("This unusual arrangement can lead to confusion and errors in input, resulting in a frustrating user experience.")
                .font(.system(size: 20 , weight: .light , design: .rounded))
           Image("badUX")
                .resizable()
                .frame(width: 300, height: 600)
            
          Spacer()
        
        }
        .padding(.horizontal,24)
    }
    
    private var UISection : some View {
        VStack(alignment: .leading, spacing: 24){
            Text("UI Design")
                .font(.system(size: 24 , weight: .semibold , design: .rounded))
            
            Text("User Interface design specifically focuses on the digital aspects of interaction.")
                .font(.system(size: 20 , weight: .light , design: .rounded))
            
            Text("It is concerned with the design of the user interface itself, UI design considers the appearance, functionality, and interactivity of the product, ensuring that every visual and interactive element is carefully crafted to be intuitive and user-friendly.")
                .font(.system(size: 20 , weight: .light , design: .rounded))
            
            Text("A UI designer is responsible for designing icons, buttons, typography, color schemes, spacing, imagery, and ensuring responsive design. ")
                .font(.system(size: 20 , weight: .light , design: .rounded))
            
            Text("Their goal is to visually guide users through the interface, making the experience seamless and intuitive. ")
                .font(.system(size: 20 , weight: .light , design: .rounded))
            
            Text("They also ensure that the UI design reflects the brand's identity, maintaining consistency and aesthetic appeal throughout the interface.")
                .font(.system(size: 20 , weight: .light , design: .rounded))
            
            Text("To better understand UI, let's examine the differences between good and bad UI in a calculator app.")
                .font(.system(size: 20 , weight: .light , design: .rounded))
            
          Spacer()
        
        }
        .padding(.horizontal,24)
    }
    
    private var GoodUISection : some View {
        VStack(alignment: .leading, spacing: 24){
            Text("Good UI")
                .font(.system(size: 24 , weight: .semibold , design: .rounded))
            
            Text("In the first calculator application, the UI incorporates a black background with contrasting white text.")
                .font(.system(size: 20 , weight: .light , design: .rounded))
            
            Text("The black background creates a sleek and modern look, while the white text provides excellent readability and visibility.")
                .font(.system(size: 20 , weight: .light , design: .rounded))
            
            Text("The orange buttons with a beautiful gradient and subtle grayish shadow effects on the number buttons add visual appeal and depth.")
                .font(.system(size: 20 , weight: .light , design: .rounded))
            
            Text("This UI design combines aesthetics with functionality, creating an engaging and visually pleasing user experience.")
                .font(.system(size: 20 , weight: .light , design: .rounded))
            
           Image("goodUI")
                .resizable()
                .frame(width: 300, height: 600)
            
         
        
          Spacer()
        
        }
        .padding(.horizontal,24)
    }
    
    private var BadUISection : some View {
        VStack(alignment: .leading, spacing: 24){
            Text("Bad UI")
                .font(.system(size: 24 , weight: .semibold , design: .rounded))
            
            Text("In the second calculator application, the UI utilizes a yellow background with white text and white buttons with yellow text.")
                .font(.system(size: 20 , weight: .light , design: .rounded))
            
            Text("The yellow background may cause readability issues and strain the user's eyes.")
                .font(.system(size: 20 , weight: .light , design: .rounded))
            
            Text("The lack of contrast between the background and text makes it difficult to read the numbers and symbols clearly.")
                .font(.system(size: 20 , weight: .light , design: .rounded))
            
            Text("Additionally, the use of a monochromatic color scheme can make it harder to distinguish different elements of the calculator.")
                .font(.system(size: 20 , weight: .light , design: .rounded))
            
            Text("This UI design may result in a less user-friendly and less visually pleasing experience.")
                .font(.system(size: 20 , weight: .light , design: .rounded))
            
           Image("badUI")
                .resizable()
                .frame(width: 300, height: 600)
            
         
        
          Spacer()
        
        }
        .padding(.horizontal,24)
    }
    
    private var QuizSection : some View {
        VStack(alignment: .leading, spacing: 24){
            QuizCard(
                
                materialType: .design,
                userAnswer: $lessonViewModel.userDesignAnswerChoice1,
                isTry: $userViewModel.isDoneQuestionOne,
                isPassed: $lessonViewModel.quizOnePassed,
                title: "What is the difference between UI (User Interface) and UX (User Experience)?",
                answer: "UI focuses on visual design, while UX focuses on the overall user experience.",
                items: ["UI focuses on visual design, while UX focuses on the overall user experience.", "UI and UX are the same thing.", "UI focuses on user experience, while UX focuses on interface design."],
                explanation: "UI (User Interface) and UX (User Experience) are two different concepts in user experience design. UI deals with the visual and interactive aspects of the user interface, including layout, colors, icons, buttons, and other components that allow users to interact with a product or system. On the other hand, UX encompasses the entire user experience when interacting with a product or system, including factors such as satisfaction, efficiency, usability, and the emotions experienced by users.",
                quizType: .multipleChoice
            )
            
            QuizCard(
                
                materialType: .design,
                userAnswer: $lessonViewModel.userDesignAnswerChoice2,
                isTry: $userViewModel.isDoneQuestionTwo,
                isPassed: $lessonViewModel.quizTwoPassed,
                title: "Which of the following design considerations is NOT typically associated with creating an effective user interface (UI)?",
                answer: "Server-side programming techniques",
                items: ["Color scheme and contrast", "Navigation structure and hierarchy", "Server-side programming techniques"],
                explanation: "While server-side programming is essential for web development, it is not directly related to creating an effective UI. Typography selection, color scheme and contrast, and navigation structure and hierarchy are all crucial considerations in UI design.",
                quizType: .multipleChoice
            )
            QuizCard(
                
                materialType: .design,
                userAnswer: $lessonViewModel.userDesignAnswerChoice3,
                isTry: $userViewModel.isDoneQuestionThree,
                isPassed: $lessonViewModel.quizThreePassed,
                title: "Which of the following tasks are typically involved in the UX design process?",
                answer: "User research",
                items: ["User research", "Typography selection", "Prototyping"],
                explanation: "User research is a fundamental task in the UX design process. It involves gathering insights and understanding the needs, behaviors, and preferences of the target users. Through methods such as surveys, interviews, and observations, designers can collect valuable data to inform their design decisions. User research helps identify user goals, motivations, and challenges, ensuring that the final product or service meets user expectations and delivers a satisfying user experience. By incorporating user research, designers can create user-centered solutions that are tailored to user needs and lead to more successful and impactful designs.",
                quizType: .multipleChoice
            )
            Spacer()
        }.padding(.horizontal, 24)
    }
}
