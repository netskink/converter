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

    
    // 23 C = 73.4 F
    
    @State private var input = 0.0
    @FocusState private var inputIsFocused: Bool
    
    var output: Double {
        let fahrenheit = (input * (9.0/5.0)) + 32
        return fahrenheit
    }
    
    var body: some View {
        
        // Use hotkey cmd-shift-L and on the star tab are symbols.
        Label(
            title: { Text("Convert") },
            icon: { Image(systemName: "medical.thermometer") }
        )


        
        NavigationStack {
            Form {
                Section(header: Text("celsius").textCase(.none)) {
                    TextField("mm", value: $input, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($inputIsFocused)
                }
                Section(header: Text("fahrenheit").textCase(.none)) {
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
