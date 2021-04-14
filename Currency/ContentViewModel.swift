//
//  ContentViewModel.swift
//  Currency
//
//  Created by Benson on 4/13/21.
//

import Foundation
 

struct CurrencyText {
     
    var text: String?
    var unformatted: String?
    var input:Decimal?
    
}

class ContentViewModel:ObservableObject {
     
    @Published var value = CurrencyText()
    
   
    
    init(){
        
    }
     
    // convert to Double from decimal
    func decimalConvert (decimal: Decimal) -> Double {
        
        let d = decimal
        let nsDecimal = NSDecimalNumber(decimal: d)
        let double = nsDecimal.doubleValue
        return double
        
    }
    
    // Model Struct
    
    func getEntry() -> EntryModel {
        
        EntryModel(
            
            value: decimalConvert( decimal: self.value.input ?? 0 ) / 100.0
            
        )
        
    }
    
    // Sumbit Button
    
    func submitButton(){
        
        print(self.value)
        
        print( getEntry() )
        
    }
    
}
