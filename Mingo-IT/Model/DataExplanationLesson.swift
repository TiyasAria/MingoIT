//
//  DataExplanationLesson.swift
//  Mingo-IT
//
//  Created by tiyas aria on 04/06/23.
//

import Foundation

struct DataExplanationLesson : Identifiable{
    let id = UUID()
    var title : String
    var image : String
    var description : String
}

let dataLesson : [DataExplanationLesson] = [
    DataExplanationLesson(title: "Programming", image: "programming-ilustration", description: "Programming is like giving instructions to a computer to perform tasks, just like how we give directions or instructions to a friend."),
    
    DataExplanationLesson(title: "Logical Thinking", image: "logic", description: "In our daily lives, from making breakfast to solving math problems to folding clothes, takes a set of step-by-step instructions to perform tasks. These so called Algorithms help us complete tasks efficiently and effectively."),
    
    DataExplanationLesson(title: "Mathematic", image: "math", description: "Mathematic, especially calculus is essential in computer science, exploring change and continuous calculations. With calculus, you can analyze algorithms, model complex systems, and grasp data processing principles." ),
    
    DataExplanationLesson(title: "UI/UX Design", image: "design", description: "UI/UX design involves creating user interfaces and enhancing the user experience for digital products or services. It focuses on designing visually appealing and user-friendly interfaces." )
    
]



