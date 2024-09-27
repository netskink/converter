//
//  LengthView.swift
//  converter
//
//  Created by john davis on 9/14/24.
//

import Foundation

import SwiftUI


struct LengthView: View {

    // Which subscreen is this for?
    var subscreen: SubScreen.Screens
    
    let possibleSystemUnits: [SystemUnits.System] = [.imperial, .metric]
    let possibleMetricLengthUnits: [CommonLengthEnum] = [.metric(.mm), .metric(.cm), .metric(.m), .metric(.km)]
    let possibleImperialLengthUnits: [CommonLengthEnum] = [.imperial(.inch), .imperial(.foot), .imperial(.yard), .imperial(.mile)]


    @State private var input = 0.0

    
    // 25.4 mm == 1.0 inch
    @FocusState private var inputIsFocused: Bool
    // input
    @State private var inputSystem = SystemUnits.System.metric
    @State private var inputUnit = CommonLengthEnum.metric(.mm)
    // output
    @State private var outputSystem = SystemUnits.System.imperial
    @State private var outputUnit = CommonLengthEnum.imperial(.inch)



    var output: Double {
        
        var intermediate: Double
        var result: Double
        
        // convert all inputs to metric.mm
        switch inputUnit {
        case .metric(.mm):
            intermediate = input
        case .metric(.cm):
            intermediate = input * 10.0
        case .metric(.m):
            intermediate = input * 1000
        case .metric(.km):
            intermediate = input * 1000000
        case .imperial(.inch):
            intermediate = input * 25.4
        case .imperial(.foot):
            intermediate = input * 304.8
        case .imperial(.yard):
            intermediate = input * 914.4
        case .imperial(.mile):
            intermediate = input * 1.609e+6
        }
 
        // convert intermediate (celsius) to variable output
        switch outputUnit {
        case .metric(.mm):
            result = intermediate
        case .metric(.cm):
            result = intermediate / 10.0
        case .metric(.m):
            result = intermediate / 1000
        case .metric(.km):
            result = intermediate / 1000000
        case .imperial(.inch):
            result = intermediate / 25.4
        case .imperial(.foot):
            result = intermediate / 304.8
        case .imperial(.yard):
            result = intermediate / 914.4
        case .imperial(.mile):
            result = intermediate / 1.609e+6
        }

        return result
    }

    
    var body: some View {
        
        // Use hotkey cmd-shift-L and on the star tab are symbols.
        Label(
            title: { Text("") },
            icon: { Image(systemName: "ruler") }
        )

        
        NavigationStack {
                        
            Form {
                ZStack {
                    Color.green.opacity(0.25)
                        VStack {
                        //
                        // input metric or imperial
                        //
                        Section(header: Text("Choose input system").textCase(.none)) {
                            Picker("Input system", selection: $inputSystem) {
                                ForEach(possibleSystemUnits, id: \.self) { unit in
                                    Text(unit.description)
                                }
                            }
                            .pickerStyle(.segmented)
//                            .onChange(of: inputSystem) { newValue in
//                                if inputSystem == .imperial {
//                                    inputUnit = possibleImperialLengthUnits.first!
//                                } else {
//                                    inputUnit = possibleMetricLengthUnits.first!
//                                }
//                            }
                            .onChange(of: inputSystem, initial: true) { oldValue, newValue in
                                if inputSystem == .imperial {
                                    inputUnit = possibleImperialLengthUnits.first!
                                } else {
                                    inputUnit = possibleMetricLengthUnits.first!
                                }
                            }
                        }
                        //
                        // input units:  metric(mm, cm, ...) or imperial(inch, foot, ...)
                        //
                        Section(header: Text("Choose input unit").textCase(.none)) {
                            Picker("Input unit", selection: $inputUnit) {
                                if inputSystem == .imperial {
                                    ForEach(possibleImperialLengthUnits, id: \.self) { unit in
                                        Text(unit.description)
                                    }
                                }
                                if inputSystem == .metric {
                                    ForEach(possibleMetricLengthUnits, id: \.self) { unit in
                                        Text(unit.description)
                                    }
                                }
                            }
                            .pickerStyle(.segmented)
                        }

                        
                        
                        Section(header: Text("Convert From:").textCase(.none)) {
                            TextField("", value: $input, format: .number)
                                .keyboardType(.decimalPad)
                                .focused($inputIsFocused)

                        }
                    } // vstack
                } // zstack

                ZStack {
                    Color.blue.opacity(0.25)
                    VStack {
                        
                        
                        //
                        // output metric or imperial
                        //
                        Section(header: Text("Choose output system").textCase(.none)) {
                            Picker("Output system", selection: $outputSystem) {
                                ForEach(possibleSystemUnits, id: \.self) { unit in
                                    Text(unit.description)
                                }
                            }
                            .pickerStyle(.segmented)
//                            .onChange(of: outputSystem) { newValue in
//                                if outputSystem == .imperial {
//                                    outputUnit = possibleImperialLengthUnits.first!
//                                } else {
//                                    outputUnit = possibleMetricLengthUnits.first!
//                                }
//                            }
                            .onChange(of: outputSystem, initial: true) { oldValue, newValue in
                                if outputSystem == .imperial {
                                    outputUnit = possibleImperialLengthUnits.first!
                                } else {
                                    outputUnit = possibleMetricLengthUnits.first!
                                }
                            }

                        }
                        //
                        // output units:  metric(mm, cm, ...) or imperial(inch, foot, ...)
                        //
                        Section(header: Text("Choose output unit").textCase(.none)) {
                            Picker("Output unit", selection: $outputUnit) {
                                if outputSystem == .imperial {
                                    ForEach(possibleImperialLengthUnits, id: \.self) { unit in
                                        Text(unit.description)
                                    }
                                }
                                if outputSystem == .metric {
                                    ForEach(possibleMetricLengthUnits, id: \.self) { unit in
                                        Text(unit.description)
                                    }
                                }
                            }
                            .pickerStyle(.segmented)
                        }
                        
                        
                        Section(header: Text("Convert to:").textCase(.none)) {
                            Text(output, format: .number)
                            .multilineTextAlignment(.leading)  // TODO: why is this not left justified?
                        }
                    } // vstack
                } // zstack
            } // Form
            .navigationTitle("Length")
            // This does nothing
            //.dialogIcon(Image(systemName: "ruler"))
            // property?
            .toolbar {
                if inputIsFocused {
                    Button("Done") {
                        inputIsFocused = false
                    }
                } // if inputIsFocused
            } // .toolbar

        } // NavigationStack
    } // body
    

}


#Preview {
    LengthView(subscreen: .mylength)
}
