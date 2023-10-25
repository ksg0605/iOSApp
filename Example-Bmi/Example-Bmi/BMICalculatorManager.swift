//
//  BMICalculatorManager.swift
//  Example-Bmi
//
//  Created by 김선규 on 10/25/23.
//

import UIKit

struct BMICalculatorManager {
    
    func calculateBMI(height: String, weight: String) -> BMI {
        guard let h = Double(height), let w = Double(weight) else { return BMI(value: 0.0, advice: "문제발생", matchColor: .white) }
        
        var bmiNum = w / (h * h) * 10000
        bmiNum = round(bmiNum * 10) / 10
        
        switch bmiNum {
            case ..<18.6:
                let color = UIColor(displayP3Red: 22/255,
                                    green: 231/255,
                                    blue: 207/255,
                                    alpha: 1)
                return BMI(value: bmiNum, advice: "저체중", matchColor: color)
                
            case 18.6..<23.0:
                let color = UIColor(displayP3Red: 212/255,
                                    green: 251/255,
                                    blue: 121/255,
                                    alpha: 1)
                return BMI(value: bmiNum, advice: "표준", matchColor: color)
                
            case 23.0..<25.0:
                let color = UIColor(displayP3Red: 218/255,
                                    green: 127/255,
                                    blue: 163/255,
                                    alpha: 1)
                return BMI(value: bmiNum, advice: "과체중", matchColor: color)
                
            case 25.0..<30.0:
                let color = UIColor(displayP3Red: 255/255,
                                    green: 150/255,
                                    blue: 141/255,
                                    alpha: 1)
                return BMI(value: bmiNum, advice: "중도비만", matchColor: color)
                
            case 30.0...:
                let color = UIColor(displayP3Red: 255/255,
                                    green: 100/255,
                                    blue: 78/255,
                                    alpha: 1)
                return BMI(value: bmiNum, advice: "고도비만", matchColor: color)
                
            default:
                return BMI(value: 0.0, advice: "문제발생", matchColor: UIColor.white)
        }
    }
}

