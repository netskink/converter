//
//  SystemUnits.swift
//  converter
//
//  Created by john davis on 9/19/24.
//

import Foundation



//
// Metric or Imperial
//
struct SystemUnits: Hashable {
    
    enum System  {
        case metric
        case imperial
    }
    
    var screen = System.metric

}

extension SystemUnits.System: Describable {
    
    var description: String {
        switch self {
        case .metric:
            return "Metric"
        case .imperial:
            return "Imperial"
        }
    }
}


//
// Metric length
//
struct MetricLengthUnits: Hashable {
    
    enum System  {
        case mm
        case cm
        case m
        case km
    }
    
    var screen = System.mm

}

extension MetricLengthUnits.System: Describable {
    
    var description: String {
        switch self {
        case .mm:
            return "Millimeter"
        case .cm:
            return "Centimeter"
        case .m:
            return "Meter"
        case .km:
            return "Kilometer"
        }
    }
}
