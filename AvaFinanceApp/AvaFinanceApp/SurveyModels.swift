import Foundation

// Define your data structures here
struct FinancialHealthSurvey {
    var title: String
    var questions: [FinancialQuestion]
    var completionAdvice: [String: String] // Advice based on score ranges
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

// Budgeting Basics Survey
let budgetingBasicsSurvey = FinancialHealthSurvey(
    title: "Budgeting Basics Survey",
    questions: [
        FinancialQuestion(
            id: UUID(),
            text: "How do you track your daily expenses?",
            answers: [
                FinancialAnswer(text: "Using a budgeting app", score: 10),
                FinancialAnswer(text: "Manually in a notebook or spreadsheet", score: 7),
                FinancialAnswer(text: "I occasionally review my bank statements", score: 3),
                FinancialAnswer(text: "I don’t track my expenses", score: 0)
            ]
        ),
        FinancialQuestion(
            id: UUID(),
            text: "What percentage of your income do you save?",
            answers: [
                FinancialAnswer(text: "More than 20%", score: 10),
                FinancialAnswer(text: "10% to 20%", score: 7),
                FinancialAnswer(text: "Less than 10%", score: 3),
                FinancialAnswer(text: "I don’t save regularly", score: 0)
            ]
        ),
        FinancialQuestion(
            id: UUID(),
            text: "How often do you review and adjust your budget?",
            answers: [
                FinancialAnswer(text: "Monthly", score: 10),
                FinancialAnswer(text: "Every few months", score: 7),
                FinancialAnswer(text: "Once a year", score: 3),
                FinancialAnswer(text: "Never", score: 0)
            ]
        ),
        FinancialQuestion(
            id: UUID(),
            text: "What’s your strategy for handling unexpected expenses?",
            answers: [
                FinancialAnswer(text: "I have an emergency fund", score: 10),
                FinancialAnswer(text: "I adjust my budget to cover it", score: 7),
                FinancialAnswer(text: "I use my credit card", score: 3),
                FinancialAnswer(text: "I don’t have a strategy", score: 0)
            ]
        ),
        FinancialQuestion(
            id: UUID(),
            text: "How do you prioritize your spending?",
            answers: [
                FinancialAnswer(text: "Necessities first, then savings, then wants", score: 10),
                FinancialAnswer(text: "I try to balance necessities and wants", score: 7),
                FinancialAnswer(text: "I mostly spend on wants", score: 3),
                FinancialAnswer(text: "I don’t prioritize my spending", score: 0)
            ]
        )
    ],
    completionAdvice: [
        "30-50": "Great job! You're on the right path to mastering budgeting. Consider exploring more advanced financial planning strategies.",
        "10-29": "You're doing well, but there's room for improvement. Focus on building your savings and tracking expenses more closely.",
        "0-9": "It's time to focus on your budgeting skills. Start by tracking your expenses and setting up a simple budget."
    ]
)

// Debt Management Survey
let debtManagementSurvey = FinancialHealthSurvey(
    title: "Debt Management Survey",
    questions: [
        FinancialQuestion(
            id: UUID(),
            text: "What types of debt do you currently have?",
            answers: [
                FinancialAnswer(text: "No debt", score: 10),
                FinancialAnswer(text: "Student loans only", score: 7),
                FinancialAnswer(text: "Credit card debt", score: 4),
                FinancialAnswer(text: "Multiple types of debt", score: 0)
            ]
        ),
        FinancialQuestion(
            id: UUID(),
            text: "How do you approach paying off your debts?",
            answers: [
                FinancialAnswer(text: "I prioritize high-interest debts first", score: 10),
                FinancialAnswer(text: "I pay off small debts first for quick wins", score: 7),
                FinancialAnswer(text: "I make minimum payments across the board", score: 3),
                FinancialAnswer(text: "I struggle to make regular payments", score: 0)
            ]
        ),
        FinancialQuestion(
            id: UUID(),
            text: "What's your understanding of interest rates and their impact on debt?",
            answers: [
                FinancialAnswer(text: "Very knowledgeable, and I use this knowledge to manage my debt efficiently", score: 10),
                FinancialAnswer(text: "Somewhat knowledgeable, but unsure how to apply this to my debt", score: 5),
                FinancialAnswer(text: "Not very knowledgeable", score: 2),
                FinancialAnswer(text: "No understanding", score: 0)
            ]
        ),
        FinancialQuestion(
            id: UUID(),
            text: "How comfortable are you with your current level of debt?",
            answers: [
                FinancialAnswer(text: "Very comfortable, I have a solid plan to pay it off", score: 10),
                FinancialAnswer(text: "Somewhat comfortable, but I need a better plan", score: 5),
                FinancialAnswer(text: "Not comfortable, it feels overwhelming", score: 2),
                FinancialAnswer(text: "Extremely uncomfortable, it's unmanageable", score: 0)
            ]
        ),
        FinancialQuestion(
            id: UUID(),
            text: "Have you ever used a debt consolidation or management service?",
            answers: [
                FinancialAnswer(text: "Yes, and it significantly helped me manage my debt", score: 10),
                FinancialAnswer(text: "Yes, but it didn’t make much difference", score: 5),
                FinancialAnswer(text: "No, but I'm considering it", score: 2),
                FinancialAnswer(text: "No, and I have no plans to use one", score: 0)
            ]
        )
    ],
    completionAdvice: [
        "40-50": "Excellent! You have a strong handle on your debt management. Keep leveraging your knowledge and strategies to stay ahead.",
        "20-39": "You're on the right track, but there's room for improvement. Focus on understanding interest rates better and consider ways to optimize your debt repayment plan.",
        "0-19": "It's important to start taking control of your debt. Begin with understanding the impact of interest rates and exploring debt management services that could offer assistance."
    ]
)

// Savings and Investment Survey
let savingsAndInvestmentSurvey = FinancialHealthSurvey(
    title: "Savings and Investment Survey",
    questions: [
        FinancialQuestion(
            id: UUID(),
            text: "Do you have an emergency fund, and if so, how many months of expenses does it cover?",
            answers: [
                FinancialAnswer(text: "Yes, more than 6 months of expenses", score: 10),
                FinancialAnswer(text: "Yes, 3 to 6 months of expenses", score: 7),
                FinancialAnswer(text: "Yes, less than 3 months of expenses", score: 3),
                FinancialAnswer(text: "No, I do not have an emergency fund", score: 0)
            ]
        ),
        FinancialQuestion(
            id: UUID(),
            text: "What types of investment accounts are you familiar with?",
            answers: [
                FinancialAnswer(text: "401(k), IRA, and taxable accounts", score: 10),
                FinancialAnswer(text: "401(k) and IRA only", score: 7),
                FinancialAnswer(text: "Savings account only", score: 3),
                FinancialAnswer(text: "I'm not familiar with investment accounts", score: 0)
            ]
        ),
        FinancialQuestion(
            id: UUID(),
            text: "How do you research investment opportunities?",
            answers: [
                FinancialAnswer(text: "I use a variety of sources and do thorough research", score: 10),
                FinancialAnswer(text: "I occasionally read financial news or blogs", score: 5),
                FinancialAnswer(text: "I rely on tips from friends and family", score: 2),
                FinancialAnswer(text: "I don’t research investment opportunities", score: 0)
            ]
        ),
        FinancialQuestion(
            id: UUID(),
            text: "What percentage of your income do you invest?",
            answers: [
                FinancialAnswer(text: "More than 15%", score: 10),
                FinancialAnswer(text: "10% to 15%", score: 7),
                FinancialAnswer(text: "5% to 10%", score: 3),
                FinancialAnswer(text: "Less than 5%", score: 0)
            ]
        ),
        FinancialQuestion(
            id: UUID(),
            text: "How do you balance risk and reward in your investment choices?",
            answers: [
                FinancialAnswer(text: "I have a well-diversified portfolio that balances risk and reward", score: 10),
                FinancialAnswer(text: "I take some calculated risks based on research", score: 7),
                FinancialAnswer(text: "I prefer safe investments, even if returns are lower", score: 3),
                FinancialAnswer(text: "I don't consider risk much, I invest in what's trending", score: 0)
            ]
        )
    ],
    completionAdvice: [
        "40-50": "You're doing an excellent job managing your savings and investments. Continue diversifying and researching to optimize your portfolio.",
        "20-39": "You have a good start, but there's room for growth. Consider increasing your investment knowledge and diversifying your portfolio.",
        "0-19": "It's time to focus on building your savings and understanding investment basics. Start with creating an emergency fund and learning about different types of investment accounts."
    ]
)

