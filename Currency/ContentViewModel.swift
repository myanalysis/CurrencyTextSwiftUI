//
//  ContentViewModel.swift
//  Currency
//
//  Created by Benson on 4/13/21.
//

import Foundation


struct data {
    
    let value:Double
    
}
 

class ContentViewModel:ObservableObject {
     
    @Published var value:Decimal?
    
    var currency_value: String?  = "100.00"
    var unformattedText: String?
      
    init(){
         
    }
    
    func decimalConvert (decimal: Decimal) -> Double {
        
        let d = decimal
        let nsDecimal = NSDecimalNumber(decimal: d)
        let double = nsDecimal.doubleValue
        
        return double
        
    }
    
    func getEntry() -> EntryModel {

        EntryModel(
  
            value: decimalConvert( decimal: self.value ?? 0 ) / 100.0
           
        )

    }
    
     
    func submitButton(){
        
        print(self.value)
        
        print( getEntry() )
          
        
    }
    
    
    
}
