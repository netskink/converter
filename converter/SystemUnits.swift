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



//
// Imperial length
//
struct ImperialLengthUnits: Hashable {
    
    enum System  {
        case inch
        case foot
        case yard
        case mile
    }
    
    var screen = System.inch

}

extension ImperialLengthUnits.System: Describable {
    
    var description: String {
        switch self {
        case .inch:
            return "Inch"
        case .foot:
            return "Foot"
        case .yard:
            return "Yard"
        case .mile:
            return "Mile"
        }
    }
}


///////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////
//
// Common Length
//

enum CommonLengthEnum: Hashable {
    case metric(MetricLengthUnits.System)
    case imperial(ImperialLengthUnits.System)
}

extension CommonLengthEnum: Describable {
    
    var description: String {
        switch self {
        case .metric(.mm):
            return "Millimeter"
        case .metric(.cm):
            return "Centimeter"
        case .metric(.m):
            return "Meter"
        case .metric(.km):
            return "Kilometer"
        case .imperial(.inch):
            return "Inch"
        case .imperial(.foot):
            return "Foot"
        case .imperial(.yard):
            return "Yard"
        case .imperial(.mile):
            return "Mile"
        }
    }
}






