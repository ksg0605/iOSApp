//
//  CalculatorButton.swift
//  Calculator-Clone
//
//  Created by 김선규 on 10/10/23.
//

import UIKit

enum CalculatorButton {
    case allClear
    case plusMinus
    case percentage
    case divide
    case mutiply
    case substract
    case add
    case equals
    case number(Int)
    case decimal
    
    init(calcButton: CalculatorButton) {
        
        switch calcButton {
            case .allClear, .plusMinus, .percentage, .divide, .mutiply, .substract, .add, .equals, .decimal:
                self = calcButton
            case .number(let int):
                if int.description.count == 1 {
                    self = calcButton
                } else {
                    fatalError("CalculatorButton.number Int was not 1 digit during init")
                }
        }
    }
    
}

extension CalculatorButton {
    
    var title: String {
        switch self {
            case .allClear:
                return "AC"
            case .plusMinus:
                return "+/-"
            case .percentage:
                return "%"
            case .divide:
                return "/"
            case .mutiply:
                return "x"
            case .substract:
                return "-"
            case .add:
                return "+"
            case .equals:
                return "="
            case .number(let int):
                return int.description
            case .decimal:
                return "."
        }
    }
    
    var color: UIColor {
        switch self {
            case .allClear, .plusMinus, .percentage:
                return .lightGray
            case .divide, .mutiply, .substract, .add, .equals:
                return .systemOrange
            case .number, .decimal:
                return .darkGray
        }
    }
    
    var selectedColor: UIColor? {
        switch self {
            case .allClear, .plusMinus, .percentage, .equals, .number, .decimal:
                return nil
            case .divide, .mutiply, .substract, .add:
                return .white
        }
    }
}
