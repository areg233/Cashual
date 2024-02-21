import SwiftUI

struct CarPaymentCalculatorView: View {
    @Environment(\.presentationMode) var presentationMode // For navigating back
    @State private var loanAmount: String = ""
    @State private var loanTerm: Double = 5 // Default to 5 years
    @State private var interestRate: Double = 5.0 // Default to 5.0%
    
    // Sample interest rates for demonstration
    let interestRates = Array(stride(from: 1.0, through: 15.0, by: 0.5))
    
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
        VStack(spacing: 20) {
            HStack {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss() // Dismiss the view
                }) {
                    HStack {
                        Image(systemName: "arrow.left") // System name for back arrow
                            .foregroundColor(.white)
                        Text("Back")
                            .foregroundColor(.white)
                    }
                    .padding()
                }
                Spacer()
            }
            
            Text("Car Payment Calculator")
                .font(.largeTitle)
                .foregroundColor(.white)
            
            TextField("Loan Amount", text: $loanAmount)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
                .padding()
                .background(Color.white)
                .cornerRadius(5)
                .foregroundColor(.black)
            
            HStack {
                Text("Loan Term (Years): \(Int(loanTerm))")
                    .foregroundColor(.white)
                Slider(value: $loanTerm, in: 1...7, step: 1)
                    .accentColor(.white)
            }
            .padding()
            
            Picker("Interest Rate", selection: $interestRate) {
                ForEach(interestRates, id: \.self) { rate in
                    Text("\(rate, specifier: "%.1f")%").tag(rate)
                }
            }
            .pickerStyle(WheelPickerStyle())
            .background(Color.white)
            .cornerRadius(5)
            .padding()
            
            // Emphasized monthly payment display
            VStack {
                Text("Monthly Payment:")
                    .font(.title) // Adjust the font size for the label as needed
                    .foregroundColor(.white)
                
                Text("$\(monthlyPayment, specifier: "%.2f")")
                    .font(.system(size: 64, weight: .bold)) // Use a larger font size for dramatic effect
                    .foregroundColor(.white)
            }
            .padding() // Add padding for better spacing if needed
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.teal.edgesIgnoringSafeArea(.all))
    }
}

struct CarPaymentCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CarPaymentCalculatorView()
    }
}
