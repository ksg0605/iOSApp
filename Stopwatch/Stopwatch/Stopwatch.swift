//
//  Stopwatch.swift
//  Stopwatch
//
//  Created by 김선규 on 10/14/23.
//

import Foundation

class Stopwatch: NSObject {
    var counter: Double
    var timer: Timer
    
    override init() {
        counter = 0.0
        timer = Timer()
    }
}
