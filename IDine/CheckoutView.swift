//
//  CheckoutView.swift
//  IDine
//
//  Created by Vivek Shrivastava on 16/07/24.
//

import SwiftUI

struct CheckoutView: View {
    
    let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    @EnvironmentObject var order: Order
    @State private var paymentType = "Cash"
    
    @State private var addLoyalityDetails: Bool = false
    @State private var loyalityNumber: String = ""
    
    let tipAmounts = [10, 15, 20, 25, 0]
    
    @State private var tipAmount = 0
    
    @State private var showingPaymentAlert = false
    
    var totalPrice: String {
        let total = Double(order.total)
        let tipValue = (total * Double(tipAmount)) / 100
        return (total + tipValue).formatted(.currency(code: "USD"))
    }
    
    var body: some View {
        VStack {
            Form {
                Section {
                    Picker("How do you want to pay?", selection: $paymentType) {
                        ForEach(paymentTypes, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section {
                    Toggle("Add iDine Loyality Card", isOn: $addLoyalityDetails.animation())
                    if addLoyalityDetails {
                        TextField("Enter your iDone ID", text: $loyalityNumber)
                    }
                }
                
                Section("Add a tip?") {
                    Picker("Percentage:", selection: $tipAmount) {
                        ForEach(tipAmounts, id: \.self) {
                            Text("\($0)%")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Total: \(totalPrice)") {
                    Button("Confirm order") {
                        // place the order
                        showingPaymentAlert.toggle()
                    }
                }
            }
            .alert("Order confirmed", isPresented: $showingPaymentAlert) {
                // add buttons here
            } message: {
                Text("Your total was \(totalPrice) – thank you!")
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
            .environmentObject(Order())
    }
}
