//
//  SurveyModels.swift
//  AvaFinanceApp
//
//  Created by Ava Reger on 2/10/24.
//

import Foundation

// Define your data structures here
struct FinancialHealthSurvey {
    var questions: [FinancialQuestion]
}

struct FinancialQuestion {
    let id: UUID
    let text: String
    let answers: [FinancialAnswer]
}

struct FinancialAnswer {
    let text: String
    let score: Int
}

let sampleSurvey = FinancialHealthSurvey(questions: [
    FinancialQuestion(
        id: UUID(),
        text: "How often do you budget or track your spending?",
        answers: [
            FinancialAnswer(text: "Daily or weekly", score: 10),
            FinancialAnswer(text: "Monthly", score: 7),
            FinancialAnswer(text: "Rarely", score: 3),
            FinancialAnswer(text: "Never", score: 0)
        ]
    ),
    // Add the second question here
    FinancialQuestion(
        id: UUID(),
        text: "Do you have an emergency fund?",
        answers: [
            FinancialAnswer(text: "Yes, more than 6 months of expenses", score: 10),
            FinancialAnswer(text: "Yes, less than 6 months of expenses", score: 5),
            FinancialAnswer(text: "No, but planning to start one", score: 2),
            FinancialAnswer(text: "No", score: 0)
        ]
    ),
    // ... Add more questions as needed
])
