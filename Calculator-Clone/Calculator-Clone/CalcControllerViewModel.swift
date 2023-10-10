//
//  CalcControllerViewModel.swift
//  Calculator-Clone
//
//  Created by 김선규 on 10/10/23.
//

import Foundation

enum CurrentNumber {
    case firstNumber
    case secondNumber
}

class CalcControllerViewModel {
    
    var updateViews: (()->Void)?
    
    // MARK: - TableView DataSource Array
    let calcButtonCells: [CalculatorButton] = [
            .allClear, .plusMinus, .percentage, .divide,
            .number(7), .number(8), .number(9), .mutiply,
            .number(4), .number(5), .number(6), .substract,
            .number(1), .number(2), .number(3), .add,
            .number(0), .decimal, .equals
        ]
    
    // MARK: - Variables
    private(set) lazy var calcHeaderLabel: String = "42"
    private(set) var currentNumber: CurrentNumber = .firstNumber
    
    private(set) var firstNumber: Int? = nil
    private(set) var secondNumber: Int? = nil
    
    private(set) var operation: CalculatorOperation? = nil
    
    // MARK: - Memory Variables
    private(set) var prevNumber: Int? = nil
    private(set) var prevOperation: CalculatorOperation? = nil
}

extension CalcControllerViewModel {
    
    public func didSelectButton(with calcButton: CalculatorButton) {
        switch calcButton {
            case .allClear:
                fatalError()
            case .plusMinus:
                fatalError()
            case .percentage:
                fatalError()
            case .divide:
                fatalError()
            case .mutiply:
                fatalError()
            case .substract:
                fatalError()
            case .add:
                fatalError()
            case .equals:
                fatalError()
            case .number(let int):
                self.didSelectNumber(with: number)
            case .decimal:
                fatalError()
        }
        
        self.updateViews?()
    }
}

extension CalcControllerViewModel {
    
    private func didSelectNumber(with number: Int) {
        if self.currentNumber == .firstNumber {
            
            if let firstNumber = self.firstNumber {
                var firstNumberString = firstNumber.description
                firstNumberString.append(number.description)
                self.firstNumber = Int(firstNumberString)
                self.prevNumber = Int(firstNumberString)
            } else {
                self.firstNumber = Int(number)
                self.prevNumber = Int(number)
            }
        } else {
            if let secondNumber = self.secondNumber {
                
                var secondNumberString = secondNumber.description
                secondNumberString.append(number.description)
                self.secondNumber = Int(secondNumberString)
                self.prevNumber = Int(secondNumberString)
            } else {
                self.secondNumber = Int(number)
                self.prevNumber = Int(number)
            }
        }
    }
}
