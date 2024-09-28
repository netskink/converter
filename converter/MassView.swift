//
//  MassView.swift
//  converter
//
//  Created by john davis on 9/14/24.
//

import Foundation

import SwiftUI

struct MassView: View {
    
    // Which subscreen is this detail for
    var subscreen: SubScreen.Screens


    let possibleSystemUnits: [SystemUnits.System] = [.imperial, .metric]
    let possibleMetricMassUnits: [CommonMassEnum] = [.metric(.g), .metric(.kg)]
    let possibleImperialMassUnits: [CommonMassEnum] = [.imperial(.oz), .imperial(.lb)]

    
    // 1 kg = 2.2 pounds
    
    @State private var input = 0.0
    @FocusState private var inputIsFocused: Bool

    // input
    @State private var inputSystem = SystemUnits.System.metric
    @State private var inputUnit = CommonMassEnum.metric(.g)
    // output
    @State private var outputSystem = SystemUnits.System.imperial
    @State private var outputUnit = CommonMassEnum.imperial(.oz)

    // 5 oz * 28.3495231 = 141.7475 g
    // 3 lb * 453.592 = 1360.776 g
    
    
    var output: Double {
        
        var intermediate: Double
        var result: Double
        
        // convert all inputs to metric.g
        switch inputUnit {
        case .metric(.g):
            intermediate = input
        case .metric(.kg):
            intermediate = input * 1000.0
        case .imperial(.oz):
            intermediate = input * 28.3495231
        case .imperial(.lb):
            intermediate = input * 453.592
        }
 
        // convert intermediate (g) to variable output
        switch outputUnit {
        case .metric(.g):
            result = intermediate
        case .metric(.kg):
            result = intermediate / 1000.0
        case .imperial(.oz):
            result = intermediate / 28.3495231
        case .imperial(.lb):
            result = intermediate / 453.592
        }

        return result
    }

    var body: some View {

        // Use hotkey cmd-shift-L and on the star tab are symbols.
        Label(
            title: { Text("") },
            icon: { Image(systemName: "scalemass") }
        )


        
        NavigationStack {
            Form {

                //////////////////////////////////////////////////////////////////////////
                // output
                //////////////////////////////////////////////////////////////////////////

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
                                    inputUnit = possibleImperialMassUnits.first!
                                } else {
                                    inputUnit = possibleMetricMassUnits.first!
                                }
                            }
                        }

                        //
                        // input units:  metric(mm, cm, ...) or imperial(inch, foot, ...)
                        //
                        Section(header: Text("Choose input unit").textCase(.none)) {
                            Picker("Input unit", selection: $inputUnit) {
                                if inputSystem == .imperial {
                                    ForEach(possibleImperialMassUnits, id: \.self) { unit in
                                        Text(unit.description)
                                    }
                                }
                                if inputSystem == .metric {
                                    ForEach(possibleMetricMassUnits, id: \.self) { unit in
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
                
                //////////////////////////////////////////////////////////////////////////
                // output
                //////////////////////////////////////////////////////////////////////////

                
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
                                    outputUnit = possibleImperialMassUnits.first!
                                } else {
                                    outputUnit = possibleMetricMassUnits.first!
                                }
                            }

                        }
                        
                        
                        //
                        // output units:  metric(mm, cm, ...) or imperial(inch, foot, ...)
                        //
                        Section(header: Text("Choose output unit").textCase(.none)) {
                            Picker("Output unit", selection: $outputUnit) {
                                if outputSystem == .imperial {
                                    ForEach(possibleImperialMassUnits, id: \.self) { unit in
                                        Text(unit.description)
                                    }
                                }
                                if outputSystem == .metric {
                                    ForEach(possibleMetricMassUnits, id: \.self) { unit in
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
            .navigationTitle("Mass")
            // property?
            .toolbar {
                if inputIsFocused {
                    Button("Done") {
                        inputIsFocused = false
                    }
                } // if inputIsFocused
            } // .toolbar
        } // NavigationStack
    } // View


}


#Preview {
    MassView(subscreen: .mymass)
}
