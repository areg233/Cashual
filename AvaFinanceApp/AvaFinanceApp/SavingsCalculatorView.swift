import SwiftUI

struct SavingsCalculatorView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var initialAmount: String = ""
    @State private var monthlyContribution: String = ""
    @State private var annualInterestRate: Double = 1.0 // Default to 1%
    @State private var yearsToSave: Double = 1

    var futureValue: Double {
        let principal = Double(initialAmount) ?? 0
        let monthlyDeposit = Double(monthlyContribution) ?? 0
        let monthlyRate = (annualInterestRate / 100) / 12
        let totalMonths = yearsToSave * 12

        // Future value of a series formula for compound interest
        let futureValueOfSeries = monthlyDeposit * ((pow(1 + monthlyRate, totalMonths) - 1) / monthlyRate)
        // Future value of the principal amount
        let futureValueOfPrincipal = principal * pow(1 + monthlyRate, totalMonths)
        
        return futureValueOfSeries + futureValueOfPrincipal
    }

    var body: some View {
        ZStack {
            Color.teal.edgesIgnoringSafeArea(.all) // Teal background for the entire view

            VStack {
                Spacer().frame(height: 50) // Adds spacing at the top

                HStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack {
                            Image(systemName: "arrow.left") // Use "arrow.backward" for iOS 14 or later
                                .foregroundColor(.white)
                            Text("Back")
                                .foregroundColor(.white)
                        }
                        .padding()
                    }
                    Spacer()
                }
                
                Text("Savings Calculator")
                    .font(.largeTitle) // Making the title larger
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.bottom, 20)
                
                Form {
                    TextField("Initial Savings Amount ($)", text: $initialAmount)
                        .keyboardType(.decimalPad)
                    TextField("Monthly Contribution ($)", text: $monthlyContribution)
                        .keyboardType(.decimalPad)
                    HStack {
                        Text("Annual Interest Rate: \(annualInterestRate, specifier: "%.1f")%")
                        Slider(value: $annualInterestRate, in: 0.1...10.0, step: 0.1)
                            .accentColor(.blue)
                    }
                    HStack {
                        Text("Years to Save: \(Int(yearsToSave)) years")
                        Slider(value: $yearsToSave, in: 1...40, step: 1)
                            .accentColor(.blue)
                    }
                }
                .background(Color.white.opacity(0.6)) // Slightly transparent background for the form

                // Display the future savings
                Text("Future Savings: $\(futureValue, specifier: "%.2f")")
                    .font(.title)
                    .foregroundColor(.white) // Ensuring text color is white for visibility
                    .padding()

                Spacer() // Adjusts the spacing at the bottom
            }
            .padding() // Padding around the VStack content
        }
        .navigationBarHidden(true) // Ensure the navigation bar is hidden to use the custom back button
    }
}

struct SavingsCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        SavingsCalculatorView()
    }
}
