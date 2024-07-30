//
//  ContentView.swift
//  Cashual
//
//  Created by Ava Reger on 12/27/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedSurvey: FinancialHealthSurvey?
    @State private var showSurvey = false
    @State private var showingCalculator: Bool = false
    @State private var calculatorToPresent: AnyView? = nil
    @State private var calculatorView: AnyView?
    @State private var showCarPaymentCalculator = false
    @State private var showHousePaymentCalculator = false
    @State private var showSavingsCalculator = false
    
    let darkBlueColor = Color(red: 10/255, green: 25/255, blue: 47/255)
    let gridItems = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        NavigationView {
            ZStack {
                darkBlueColor.edgesIgnoringSafeArea(.all)

                VStack(spacing: 0) {
                    Image("MainScreenBackground")
                        .resizable()
                        .scaledToFill()
                        .frame(height: UIScreen.main.bounds.height / 3)
                        .clipped()

                    ScrollView(showsIndicators: false) {
                        VStack {
                            sectionHeader(title: "Financial Calculators").padding(.top, 20)
                            iconGridCalculators()

                            sectionHeader(title: "Check Your Financial Health").padding(.top, 20)
                            iconGridSurveys()
                        }
                        .padding(.horizontal)
                    }
                    
                    VStack {
                        List {
                            NavigationLink(destination: TaxesView()) {
                                Text("Taxes: W2 Employee vs 1099 Contractor")
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(Color(red: 255/255, green: 111/255, blue: 97/255)) // Coral color
                                    .cornerRadius(8)
                            }
                            .listRowBackground(Color.clear) // Clear background for the list row
                            
                            NavigationLink(destination: SavingsView()) {
                                Text("Savings: How to Prepare for a Rainy Day")
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(Color(red: 79/255, green: 193/255, blue: 233/255)) // Lighter blue
                                    .cornerRadius(8)
                            }
                            .listRowBackground(Color.clear) // Clear background for the list row
                            
                            NavigationLink(destination: StudentLoanView()) {
                                Text("Student Loan: Getting Back to a Clean Slate")
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(Color(red: 72/255, green: 201/255, blue: 176/255)) // Teal color
                                    .cornerRadius(8)
                            }
                            .listRowBackground(Color.clear) // Clear background for the list row
                        }
                        .listStyle(PlainListStyle())
                        .frame(maxHeight: 200)
                        .background(darkBlueColor)
                    }
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
        .sheet(isPresented: $showSurvey) {
            SurveyView(survey: selectedSurvey ?? budgetingBasicsSurvey)
        }
        .sheet(isPresented: $showCarPaymentCalculator) {
            CarPaymentCalculatorView()
        }
        .sheet(isPresented: $showHousePaymentCalculator) {
            HousePaymentCalculatorView()
        }
        .sheet(isPresented: $showSavingsCalculator) {
            SavingsCalculatorView()
        }
    }

    private func sectionHeader(title: String) -> some View {
        Text(title)
            .font(.headline)
            .foregroundColor(.white)
            .padding(.vertical, 5)
    }
    
    private func iconGridCalculators() -> some View {
            LazyVGrid(columns: gridItems, spacing: 20) {
                Button(action: {
                    self.showCarPaymentCalculator = true
                }) {
                    iconView(icon: "car", text: "Car Payment")
                }
                Button(action: {
                    self.showHousePaymentCalculator = true
                }) {
                    iconView(icon: "house", text: "House Payment")
                }
                Button(action: {
                    self.showSavingsCalculator = true
                }) {
                    iconView(icon: "banknote", text: "Savings")
                }
            }
        }
    
    private func iconGridSurveys() -> some View {
        LazyVGrid(columns: gridItems, spacing: 20) {
            Button(action: {
                self.selectedSurvey = budgetingBasicsSurvey
                self.showSurvey = true
            }) {
                iconView(icon: "heart.text.square", text: "Budgeting Basics Survey")
            }
            Button(action: {
                self.selectedSurvey = debtManagementSurvey
                self.showSurvey = true
            }) {
                iconView(icon: "dollarsign.circle", text: "Debt Management Survey")
            }
            Button(action: {
                self.selectedSurvey = savingsAndInvestmentSurvey
                self.showSurvey = true
            }) {
                iconView(icon: "chart.bar", text: "Savings and Investment Survey")
            }
        }
    }
    
    @ViewBuilder
    private func iconView(icon: String, text: String) -> some View {
        VStack {
            Image(systemName: icon)
                .font(.largeTitle)
                .foregroundColor(.white)
            Text(text)
                .foregroundColor(.white)
                .font(.caption)
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
