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


    @State private var input = 0.0

    
    // 25.4 mm == 1.0 inch
    @FocusState private var inputIsFocused: Bool
    @State private var inputSystem = SystemUnits.System.metric
    @State private var outputSystem = SystemUnits.System.metric
    @State private var inputUnit = SystemUnits.System.metric


    var output: Double {
        let inch = input / 25.4
        return inch
    }

    
    var body: some View {
        
        // Use hotkey cmd-shift-L and on the star tab are symbols.
        Label(
            title: { Text("") },
            icon: { Image(systemName: "ruler") }
        )

        
        NavigationStack {
                        
            Form {
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
                }

                
                
                Section(header: Text("mm").textCase(.none)) {
                    TextField("mm", value: $input, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($inputIsFocused)

                }

                //
                // input metric or imperial
                //
                Section(header: Text("Choose output system").textCase(.none)) {
                    Picker("Output system", selection: $outputSystem) {
                        ForEach(possibleSystemUnits, id: \.self) { unit in
                            Text(unit.description)
                        }
                    }
                    .pickerStyle(.segmented)
                }


                Section(header: Text("inch").textCase(.none)) {
                    Text(output, format: .number)
                }
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
