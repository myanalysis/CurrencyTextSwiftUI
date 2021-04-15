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
    var input:Double?
    
}

class ContentViewModel:ObservableObject {
     
    @Published var value = CurrencyText()
     
    init(){
        
    }
   
    // Model Struct
    
    func getEntry() -> EntryModel {
        
        EntryModel(
             
            value:   (self.value.input ?? 0 ) / 100.0
            
        )
        
    }
    
    // Sumbit Button
    
    func submitButton(){
        
        print(self.value)
        print( getEntry() )
        
    }
    
}
