//
//  ContentView.swift
//  Currency
//
//  Created by Benson on 4/12/21.
//




import SwiftUI
import CurrencyFormatter
import CurrencyTextField

// https://github.com/marinofelipe/CurrencyText.git
// CurrencyTextSwiftUI

import Combine

struct ContentView: View {
    
    @ObservedObject var vm = ContentViewModel()
    
    static var currencyFormatter: CurrencyFormatter = .init()
    static let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        return formatter
    }()
    
    var body: some View {
        
        VStack(alignment: .center) {
            
            Spacer()
            
            CurrencyTextField(
                configuration: .init(
                    placeholder: "Play with me...",
                    text: self.$vm.currency_value,
                    unformattedText: $vm.unformattedText,
                    inputAmount: $vm.value,
                    onCommitHandler: nil,
                    onEditingChangedHandler: nil
                ),
                formatter: CurrencyTextFieldFormatter(
                    formatter: CurrencyFormatter {
                        
                        $0.maxValue = 9999999
                        $0.minValue = -999999
                        $0.showCurrencySymbol = true
                        $0.currency = .dollar
                        $0.locale = CurrencyLocale.englishUnitedStates
                        $0.hasDecimals = true
                        
                    },
                    clearsWhenValueIsZero: true
                )
            )
            .frame(
                maxWidth: 300
            )
            .keyboardType(.numbersAndPunctuation)
            .fixedSize()
            .textFieldStyle(
                RoundedBorderTextFieldStyle()
            )
            .multilineTextAlignment(.trailing)
            
            VStack(spacing: 10) {
                Text("Formatted value: \(String(describing: vm.currency_value))")
                Text("UnformattedText value: \(String(describing: vm.unformattedText))")
                Text("Input amount: \(String(describing: vm.value))")
            }.padding()
             
            Button(action: {
                self.vm.submitButton()
            }) {
                Text("Button")
            }.padding(20)
            
            Link("Go to GitHub Page", destination: URL(string: "https://github.com/marinofelipe/CurrencyText")!)
                .padding()
                .foregroundColor(.orange)
 
            Spacer()
            
        }
        .navigationTitle("SwiftUI")
        .navigationBarTitleDisplayMode(.inline)
        .contentShape(Rectangle()) // makes the whole view area tappable
        .onTapGesture(perform: endEditing)
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

import UIKit

extension View {
    func endEditing() {
        UIApplication.shared.endEditing()
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(
            #selector(Self.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil
        )
    }
}
