import SwiftUI

struct ContentView: View {
    let darkBlueColor = Color(red: 10/255, green: 25/255, blue: 47/255) // Adjust these RGB values to match your icon's background

    var body: some View {
        NavigationView {
            ZStack {
                darkBlueColor.edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    
                    Image("app_icon_transparent")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 144, height: 144)
                    
                    Text("Cashual")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    List {
                        NavigationLink(destination: TaxesView()) {
                            Text("Taxes: W2 Employee vs 1099 Contractor")
                                .foregroundColor(.black) // Set text color to black
                        }
                        NavigationLink(destination: SavingsView()) {
                            Text("Savings: How to Prepare for a Rainy Day")
                                .foregroundColor(.black) // Set text color to black
                        }
                        NavigationLink(destination: StudentLoanView()) {
                            Text("Student Loan Payback: Getting Back to a Clean Slate")
                                .foregroundColor(.black) // Set text color to black
                        }
                    }
                    .listStyle(PlainListStyle())
                    .background(darkBlueColor)
                    
                    Spacer()
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct TaxesView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text("Understanding Taxes")
                    .font(.title)
                    .fontWeight(.bold)

                Text("Learn the basics of taxation and the differences between being a W2 employee and a 1099 contractor.")
                    .font(.subheadline)
                    .padding(.bottom, 20)

                Text("What is a W2?")
                    .font(.headline)
                    .fontWeight(.semibold)

                Text("A W2 form is issued by employers to report your annual earnings and the taxes withheld from your paycheck. As a W2 employee, taxes are automatically deducted from your salary.")

                Divider()

                Text("What is a 1099?")
                    .font(.headline)
                    .fontWeight(.semibold)

                Text("A 1099 form is used for those who are self-employed or work as independent contractors. As a 1099 contractor, you're responsible for calculating and paying your own taxes.")
            }
            .padding()
        }
        .navigationTitle("Taxes")
    }
}


struct SavingsView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text("The Importance of Savings")
                    .font(.title)
                    .fontWeight(.bold)

                Text("Discover how to effectively save for unforeseen expenses and financial goals.")
                    .font(.subheadline)
                    .padding(.bottom, 20)

                Text("Why Save Money?")
                    .font(.headline)
                    .fontWeight(.semibold)

                Text("Saving money is crucial for financial security. It helps you prepare for emergencies, achieve goals, and reduce financial stress.")

                Divider()

                Text("Types of Savings Accounts")
                    .font(.headline)
                    .fontWeight(.semibold)

                Text("Learn about different savings accounts, including traditional savings accounts, high-yield accounts, and certificates of deposit (CDs).")
            }
            .padding()
        }
        .navigationTitle("Savings")
    }
}


struct StudentLoanView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text("Navigating Student Loans")
                    .font(.title)
                    .fontWeight(.bold)

                Text("Understand your student loans and learn effective strategies for repayment.")
                    .font(.subheadline)
                    .padding(.bottom, 20)

                Text("Understanding Your Student Loans")
                    .font(.headline)
                    .fontWeight(.semibold)

                Text("Get to know the terms of your student loans, including principal, interest rates, and the grace period after graduation.")

                Divider()

                Text("Repayment Plans")
                    .font(.headline)
                    .fontWeight(.semibold)

                Text("Explore various repayment plans, including standard, graduated, and income-driven repayment plans, to find one that suits your financial situation.")
            }
            .padding()
        }
        .navigationTitle("Student Loans")
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
