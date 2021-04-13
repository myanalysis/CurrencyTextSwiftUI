//
//  ContentViewModel.swift
//  Currency
//
//  Created by Benson on 4/13/21.
//

import Foundation
 


class ContentViewModel:ObservableObject {
    
    @Published var value:Decimal?
    
    var currency_value: String?  = "$100.00"
    var unformattedText: String?
    
    init(){
        
    }
    
    // convert Decimal to DOuble
    
    func decimalConvert (decimal: Decimal) -> Double {
        
        let d = decimal
        let nsDecimal = NSDecimalNumber(decimal: d)
        let double = nsDecimal.doubleValue
        return double
        
    }
    
    // Model Struct
    
    func getEntry() -> EntryModel {
        
        EntryModel(
            
            value: decimalConvert( decimal: self.value ?? 0 ) / 100.0
            
        )
        
    }
    
    // Sumbit Button
    
    func submitButton(){
        
        print(self.value)
        
        print( getEntry() )
        
    }
    
}
