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

    
    // 1 kg = 2.2 pounds
    
    @State private var input = 0.0
    @FocusState private var inputIsFocused: Bool

    var output: Double {
        let pounds = input * 2.205
        return pounds
    }
    
    var body: some View {

        // Use hotkey cmd-shift-L and on the star tab are symbols.
        Label(
            title: { Text("Convert") },
            icon: { Image(systemName: "scalemass") }
        )


        
        NavigationStack {
            Form {
                ZStack {
                    Color.green.opacity(0.25)
                    VStack {
                        
                        Section(header: Text("kg").textCase(.none)) {
                            TextField("kg", value: $input, format: .number)
                                .keyboardType(.decimalPad)
                                .focused($inputIsFocused)
                            
                        }
                    }
                }
                ZStack {
                    Color.blue.opacity(0.25)
                    VStack {
                        
                        Section(header: Text("pounds").textCase(.none)) {
                            Text(output, format: .number)
                        }
                    }
                }
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
