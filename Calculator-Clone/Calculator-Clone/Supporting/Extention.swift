//
//  Extention.swift
//  Calculator-Clone
//
//  Created by 김선규 on 10/10/23.
//

import Foundation

extension Double {
    var toInt: Int? {
        return Int(self)
    }
}

extension String {
    var toDouble: Double? {
        return Double(self)
    }
}

extension FloatingPoint {
    var isInteger: Bool {
        return rounded() == self
    }
}
