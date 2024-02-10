//
//  SurveyView.swift
//  AvaFinanceApp
//
//  Created by Ava Reger on 2/10/24.
//

import Foundation
import SwiftUI

struct SurveyView: View {
    @State private var currentQuestionIndex = 0 // Tracks the current question
    @State private var selectedAnswers = [Int]() // Holds the selected score for each question

    var body: some View {
        VStack {
            if currentQuestionIndex < sampleSurvey.questions.count {
                let question = sampleSurvey.questions[currentQuestionIndex]
                Text(question.text)
                    .font(.title)
                    .padding()
                
                ForEach(question.answers, id: \.text) { answer in
                    Button(action: {
                        self.selectedAnswers.append(answer.score) // Save the selected answer's score
                        if self.currentQuestionIndex < sampleSurvey.questions.count - 1 {
                            self.currentQuestionIndex += 1 // Go to next question
                        }
                    }) {
                        Text(answer.text)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                }
            } else {
                // Survey is completed
                let totalScore = selectedAnswers.reduce(0, +) // Calculate the total score
                Text("Your financial health score is \(totalScore)")
                    .font(.title)
                // Here you can add more code to give specific advice based on the totalScore
            }
            Spacer()
        }
        .navigationBarBackButtonHidden(currentQuestionIndex < sampleSurvey.questions.count) // Hide back button while survey is in progress
    }
}

struct SurveyView_Previews: PreviewProvider {
    static var previews: some View {
        SurveyView()
    }
}
