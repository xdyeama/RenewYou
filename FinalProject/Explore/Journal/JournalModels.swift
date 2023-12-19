//
//  JournalModels.swift
//  FinalProject
//
//  Created by Beket Barlykov  on 19.12.2023.
//

import Foundation
import UIKit

struct JournalTemplate{
    let title: String
    let subtitle: String
    let image: String
    let topic: String
}

struct JournalCategoryModel{
    let title: String
    let image: String
    let templates: [JournalTemplate]
}

let journalsData = [
    JournalCategoryModel(title: "Productivity", image: "productivity", templates: [
        JournalTemplate(title: "End of Year Reflection", subtitle: "Let's reflect on this, year, what you've learned and how you can be better next year.", image: "productivity1", topic: "Describe your year as if you were a journalist"),
        JournalTemplate(title: "End of the Day Reflection", subtitle: "Let's think about today, what you learned and how you can be better tomorrow", image: "productivity1", topic: "What wen tell today, what are 3 things that happened today that you are grateful for?"),
        JournalTemplate(title: "Morning Preparation", subtitle: "Prepare for the new day", image: "productivity1", topic: "What is the most important thing that you want to focus on today?"),
    ]),
    JournalCategoryModel(title: "Happiness", image: "happiness", templates: [
        JournalTemplate(title: "Book Review", subtitle: "Remember and summarize what you have learned", image: "happiness1", topic: "Describe the book, what did you like or dislike about it?"),
        JournalTemplate(title: "Planning a Future Event", subtitle: "What future event are you excited about", image: "happiness1", topic: "What future event are you excited about, why is it important to you?")
    ]),
    JournalCategoryModel(title: "Self-Discovery", image: "self-discovery", templates: [
        JournalTemplate(title: "Thoughts", subtitle: "Overcone negative emotions by teaching your brain to think more positively and less critically.", image: "self-discovery1", topic: "What emotions do you feel right noew, what are the physical reactions of your body?"),
        JournalTemplate(title: "Fear Setting", subtitle: "Exploring things you can do to overcome your fears and make better decisions", image: "self-discovery1", topic: "Name your fear"),
        JournalTemplate(title: "Negative Visualization", subtitle: "practice your skills of graefulness and resiliene. Contemplate what have you own or have achieved and visualize your life without the things we often take for granted.", image: "self-discovery1", topic: "Write about the people, decisions, events, and things you are grateful for.")
    ]),
    JournalCategoryModel(title: "Stress & Anxiety", image: "stress&anxiety" , templates: [
        JournalTemplate(title: "Thoughts", subtitle: "Overcone negative emotions by teaching your brain to think more positively and less critically.", image: "self-discovery1", topic: "What emotions do you feel right noew, what are the physical reactions of your body?"),
        JournalTemplate(title: "Feel Better", subtitle: "Quick journal to feel a boost of positive energy", image: "stress&anxiety1", topic: "What are 5 things you love about yourself?")
    ]),
//    JournalCategoryModel(title: "Sleep")
]
