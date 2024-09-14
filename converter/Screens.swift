//
//  Screens.swift
//  converter
//
//  Created by john davis on 9/14/24.
//

import Foundation


protocol Describable {
    var description: String { get }
}

struct SubScreen: Hashable {
    
    enum Screens  {
        case mylength
        case myresolution
        case mymass
        case mytemp
    }
    
    var screen = Screens.mylength

}

extension SubScreen.Screens: Describable {
    
    var description: String {
        switch self {
        case .mylength:
            return "Length"
        case .myresolution:
            return "Resolution"
        case .mymass:
            return "Mass"
        case .mytemp:
            return "Temp"
        }
    }
}
