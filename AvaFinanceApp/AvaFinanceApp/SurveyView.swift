import SwiftUI

struct SurveyView: View {
    let survey: FinancialHealthSurvey
    @Environment(\.presentationMode) var presentationMode // For navigating back
    @State private var currentQuestionIndex = 0
    @State private var selectedAnswers = [Int]()
    @State private var totalScore = 0 // Accumulate scores
    @State private var surveyCompleted = false // Track completion

    var body: some View {
        ZStack {
            Color(red: 10/255, green: 25/255, blue: 47/255)
                .edgesIgnoringSafeArea(.all) // Navy background

            VStack {
                // Back button
                HStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss() // Go back
                    }) {
                        HStack {
                            Image(systemName: "arrow.left")
                                .foregroundColor(.white)
                            Text("Back")
                                .foregroundColor(.white)
                        }
                        .padding()
                    }
                    Spacer()
                }

                // Survey title
                Text(survey.title)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding()

                // Questions and answers
                if !surveyCompleted {
                    if currentQuestionIndex < survey.questions.count {
                        let question = survey.questions[currentQuestionIndex]

                        Text(question.text)
                            .foregroundColor(.white)
                            .font(.title)
                            .padding()

                        ForEach(question.answers.indices, id: \.self) { index in
                            let answer = question.answers[index]
                            Button(action: {
                                self.selectedAnswers.append(answer.score)
                                self.totalScore += answer.score
                                
                                if self.currentQuestionIndex < self.survey.questions.count - 1 {
                                    self.currentQuestionIndex += 1
                                } else {
                                    self.surveyCompleted = true // Survey completed
                                }
                            }) {
                                Text(answer.text)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.blue)
                                    .cornerRadius(10)
                            }
                            .padding(.bottom, 2)
                        }
                    }
                } else {
                    // Display score and completion advice
                    VStack {
                        Text("Your Score: \(totalScore)")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                        Text(completionAdvice(for: totalScore))
                            .foregroundColor(.white)
                            .font(.headline)
                            .padding()
                    }
                }
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    // Function to determine completion advice based on score
    func completionAdvice(for score: Int) -> String {
        // Define ranges directly as tuples and associate them with advice
        let adviceRanges: [(range: Range<Int>, advice: String)] = [
            (40..<Int.max, "Excellent! You have a strong handle on your debt management. Keep leveraging your knowledge and strategies to stay ahead."),
            (20..<40, "You're on the right track, but there's room for improvement. Focus on understanding interest rates better and consider ways to optimize your debt repayment plan."),
            (0..<20, "It's important to start taking control of your debt. Begin with understanding the impact of interest rates and exploring debt management services that could offer assistance.")
        ]
        
        // Iterate through the ranges to find where the score fits
        for adviceRange in adviceRanges {
            if adviceRange.range.contains(score) {
                // Return the associated advice
                return adviceRange.advice
            }
        }
        
        // Default advice if none of the ranges match
        return "Thank you for completing the survey."
    }
}

// Preview provider
struct SurveyView_Previews: PreviewProvider {
    static var previews: some View {
        SurveyView(survey: budgetingBasicsSurvey)
    }
}
