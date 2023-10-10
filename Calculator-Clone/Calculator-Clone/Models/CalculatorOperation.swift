//
//  CalculatorOperation.swift
//  Calculator-Clone
//
//  Created by 김선규 on 10/10/23.
//

import Foundation

enum CalculatorOperation {
    case divide
    case mutiply
    case substract
    case add
    
    var title: String {
        switch self {
            case .divide:
                return "/"
            case .mutiply:
                return "x"
            case .substract:
                return "-"
            case .add:
                return "+"
        }
    }
}
