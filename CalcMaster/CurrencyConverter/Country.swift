//
//  Country.swift
//  Calculator
//
//  Created by Priyansh Parekh on 8/8/24.
//

import Foundation

class Country {
    
    var name: String
    var code: String
//    var rate: String
    
    init(name: String, code: String) {
        self.name = name
        self.code = code
//        self.rate = rate
    }

    func toString() -> String {
        return self.name + ";" + self.code
    }
}
