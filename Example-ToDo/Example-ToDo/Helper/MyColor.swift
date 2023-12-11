//
//  MyColor.swift
//  Example-ToDo
//
//  Created by 김선규 on 11/22/23.
//

import UIKit

enum MyColor: Int64 {
    case red      = 1
    case green    = 2
    case blue     = 3
    case purple   = 4
    
    var backgroundColor: UIColor {
        switch self {
        case .red:
            return UIColor(red: 239/255, green: 217/255, blue: 212/255, alpha: 1)
        case .green:
            return UIColor(red: 194/255, green: 237/255, blue: 234/255, alpha: 1)
        case .blue:
            return UIColor(red: 196/255, green: 228/255, blue: 242/255, alpha: 1)
        case .purple:
            return UIColor(red: 212/255, green: 212/255, blue: 245/255, alpha: 1)
        }

    }
    
    var buttonColor: UIColor {
        switch self {
        case .red:
            return UIColor(red: 232/255, green: 163/255, blue: 153/255, alpha: 1)
        case .green:
            return UIColor(red: 89/255, green: 190/255, blue: 183/255, alpha: 1)
        case .blue:
            return UIColor(red: 88/255, green: 181/255, blue: 236/255, alpha: 1)
        case .purple:
            return UIColor(red: 118/255, green: 103/255, blue: 228/255, alpha: 1)
        }
    }
}
