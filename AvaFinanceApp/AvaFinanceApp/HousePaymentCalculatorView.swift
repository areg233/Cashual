import SwiftUI

struct HousePaymentCalculatorView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var loanAmount: String = ""
    @State private var interestRate: Double = 2.5 // Default to 2.5%
    @State private var loanTerm: Double = 30 // Default to 30 years, common for mortgages

    var monthlyPayment: Double {
        let principal = Double(loanAmount) ?? 0
        let monthlyInterestRate = interestRate / 100 / 12
        let numberOfPayments = loanTerm * 12

        guard monthlyInterestRate > 0 else {
            return principal / numberOfPayments
        }

        let payment = principal * (monthlyInterestRate * pow(1 + monthlyInterestRate, numberOfPayments)) / (pow(1 + monthlyInterestRate, numberOfPayments) - 1)
        return payment.isNaN ? 0 : payment
    }

    var body: some View {
        ZStack {
            Color.teal.edgesIgnoringSafeArea(.all) // Teal background for the entire view
            
            VStack {
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
                
                Text("House Payment Calculator")
                    .font(.largeTitle) // Making the title larger
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.vertical, 20)
                
                Form {
                    TextField("Loan Amount ($)", text: $loanAmount)
                        .keyboardType(.decimalPad)
                    HStack {
                        Text("Interest Rate: \(interestRate, specifier: "%.2f")%")
                        Slider(value: $interestRate, in: 2.5...20.0, step: 0.1)
                            .accentColor(.blue)
                    }
                    HStack {
                        Text("Loan Term (Years): \(Int(loanTerm))")
                        Slider(value: $loanTerm, in: 1...30, step: 1)
                            .accentColor(.blue)
                    }
                }
                .background(Color.white.opacity(0.6)) // Slightly transparent background for the form
                
                Text("Monthly Payment: $\(monthlyPayment, specifier: "%.2f")")
                    .font(.title)
                    .foregroundColor(.white) // Ensuring text color is white for visibility
                    .padding()

                Spacer() // Adjusts the spacing at the bottom
            }
            .padding() // Padding around the VStack content
        }
    }
}

struct HousePaymentCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        HousePaymentCalculatorView()
    }
}
