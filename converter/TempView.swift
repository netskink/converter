//
//  TempView.swift
//  converter
//
//  Created by john davis on 9/14/24.
//

import Foundation

import SwiftUI

struct TempView: View {
    
    // Which subscreen is this detail for
    var subscreen: SubScreen.Screens
    
    let possibleUnits = ["celsius", "fahrenheit"]
    


    
    // 23 C = 73.4 F
    
    @State private var input = 0.0
    @State private var inputUnit = "celsius"
    @State private var outputUnit = "fahrenheit"

    @FocusState private var inputIsFocused: Bool
    
    var output: Double {
        
        var intermediate: Double
        
        
        // convert all inputs to celsius
        if inputUnit == "celsius" {
            intermediate = input
        } else {
            // convert fahrenheight to celsius
            intermediate = (input - 32) *  (5.0/9.0)
        }
        
        // convert intermediate (celsius) to variable output
        if outputUnit == "fahrenheit" {
            let fahrenheit = (intermediate * (9.0/5.0)) + 32
            return fahrenheit
        } else {
            return intermediate
        }

        
        
    }
    
    var body: some View {
        
        // Use hotkey cmd-shift-L and on the star tab are symbols.
        Label(
            title: { Text("") },
            icon: { Image(systemName: "medical.thermometer") }
        )


        
        NavigationStack {
            Form {
                
                Section(header: Text("Choose input units").textCase(.none)) {
                    Picker("Input units", selection: $inputUnit) {
                        ForEach(possibleUnits, id: \.self) { unit in
                            Text(unit)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section(header: Text(inputUnit).textCase(.none)) {
                    TextField("", value: $input, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($inputIsFocused)
                }

                Section(header: Text("Choose output units").textCase(.none)) {
                    Picker("Output units", selection: $outputUnit) {
                        ForEach(possibleUnits, id: \.self) { unit in
                            Text(unit)
                        }
                    }
                    .pickerStyle(.segmented)
                }



                Section(header: Text(outputUnit).textCase(.none)) {
                    Text(output, format: .number)
                }
            } // Form
            .navigationTitle("Temp")
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
    TempView(subscreen: .mytemp)
}
