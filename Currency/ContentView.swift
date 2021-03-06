//
//  ContentView.swift
//  Currency
//
//  Created by Benson on 4/12/21.
//
 
import SwiftUI
import Combine
import CurrencyFormatter
import CurrencyTextField

// https://github.com/marinofelipe/CurrencyText.git
// branch:  swif-ui
// CurrencyTextSwiftUI
  

struct ContentView: View {
    
    @ObservedObject var vm = ContentViewModel()
    
    static var currencyFormatter: CurrencyFormatter = .init()
    static let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        return formatter
    }()
    
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .center) {
                 
                CurrencyTextField(
                    configuration: .init(
                        placeholder: "Play with me...",
                        text: self.$vm.value.text,
                        unformattedText: $vm.value.unformatted,
                        inputAmount: $vm.value.input,
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
                    width: 200
                )
                .keyboardType(.numbersAndPunctuation)
                .fixedSize()
                .textFieldStyle(
                    RoundedBorderTextFieldStyle()
                )
                .multilineTextAlignment(.center)
                .padding(.top, 100)
                
                VStack(spacing: 10) {
                    Text("Formatted value: \(String(describing: vm.value.text))")
                    Text("UnformattedText value: \(String(describing: vm.value.unformatted))")
                    Text("Input amount: \(String(describing: vm.value.input))")
                }.padding()
                .font(.callout)
                
                Button(action: {
                    self.vm.submitButton()
                }) {
                    Text("Button")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(8)
                        .padding(.horizontal, 50)
                        .background(Color.purple)
                        .cornerRadius(50)
                }.padding(.top, 20)
                
                
                Link("Go to GitHub Page", destination: URL(string: "https://github.com/marinofelipe/CurrencyText")!)
                    .padding()
                    .foregroundColor(.orange)
                    .padding(.top, 20)
                
                Spacer()
                
            }
            .navigationTitle("CurrencyTextSwiftUI")
            .contentShape(Rectangle()) // makes the whole view area tappable
            .onTapGesture(perform: endEditing)
            
        }
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
