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
    var image : [String]
    var description : [String]
}

let dataLesson : [DataExplanationLesson] = [
    DataExplanationLesson(title: "Programming", image: ["programming-ilustration" , "programming 2", "programming 3"], description: ["Welcome to the world of programming! Programming is the art of giving instructions to a computer to perform specific tasks.Programming allows you to express your ideas and bring them to life.", "Just like how we give directions or instructions to a robot how to solve problems and accomplish goals.Programming equips you with the ability to break down complex problems into smaller, manageable pieces and devise logical solutions." , "By learning programming, you can become a valuable contributor to the development of innovative software, cutting-edge technologies, and groundbreaking solutions that can transform lives and industries."]),
    
    DataExplanationLesson(title: "Logical Thinking", image: ["logic", "logic 2", "logic 3"], description: ["Logical thinking is like having a superpower that helps you solve puzzles, crack codes, and make sense of complex problems.It's a way of thinking that enables you to approach challenges systematically and find innovative solutions." , "Logical thinking helps you break down complex problems into smaller, more manageable parts.It allows you to identify patterns, analyze information, and develop step-by-step strategies to solve problems effectively.", "Logical Thinking equips you with the tools to approach challenges systematically, break down complex problems, and develop innovative solutions.By developing logical thinking skills, you'll become a better problem-solver and a more discerning technologist."]),
    
    DataExplanationLesson(title: "Mathematic", image: ["math", "math 2" , "math 3"], description: ["Mathematics is the language of logic, patterns, and problem-solving that helps you build the amazing things you see in technology." , "Mathematics trains your brain to think logically, break down problems into smaller steps, and come up with efficient algorithms.It's like having a superpower that helps you solve puzzles and build innovative software solutions." , "Learning mathematics is essential for high school students studying informatics engineering because it forms the foundation of logical thinking, problem-solving, and algorithmic design."]),
    
    DataExplanationLesson(title: "UI/UX Design", image: ["design", "design 2" , "design 3" , "design 4"], description: ["Imagine you have a favorite app or website that you love to use. Have you ever wondered why it feels so easy to navigate and use?Well, that's because of the brilliant work done by UI and UX designers."  , "UI, which stands for User Interface, refers to the visual and interactive elements of an application or website.It's like the fancy clothes that make a software program look attractive and inviting." , "Then UX, which stands for User Experience. UX is like the thoughtful and caring friend who ensures your experience with an app or website is smooth, enjoyable, and effortless.", " By learning UI and UX, you'll gain the skills to create visually appealing interfaces and design intuitive user experiences.This means your apps will be easier to understand and navigate, making users happy!"])
    
]



