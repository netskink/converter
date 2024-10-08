//
//  ResolutionView.swift
//  converter
//
//  Created by john davis on 9/14/24.
//

import Foundation

import SwiftUI

struct ResolutionView: View {
    
    // Which subscreen is this detail for
    var subscreen: SubScreen.Screens

    
    // 144 ppi == 5.6690 pixels/mm
    
    @State private var input = 0.0
    @FocusState private var inputIsFocused: Bool

    var output: Double {
        let inch = input * 25.4
        return inch
    }
    
    var body: some View {
        
        // Use hotkey cmd-shift-L and on the star tab are symbols.
        Label(
            title: { Text("") },
            icon: { Image(systemName: "photo") }
        )


        
        
        NavigationStack {
            
            Form {
                ZStack {
                    Color.green.opacity(0.25)
                    VStack {
                        
                        Section(header: Text("pixels per mm").textCase(.none)) {
                            TextField("mm", value: $input, format: .number)
                                .keyboardType(.decimalPad)
                                .focused($inputIsFocused)
                            
                        }
                    }
                }
                ZStack {
                    Color.blue.opacity(0.25)
                    VStack {
                        
                        Section(header: Text("pixels(dot) per inch").textCase(.none)) {
                            Text(output, format: .number)
                        }
                    }
                }
                
            } // Form
            .navigationTitle("Resolution")
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
    ResolutionView(subscreen: .myresolution)
}
