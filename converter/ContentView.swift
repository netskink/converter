//
//  ContentView.swift
//  converter
//
//  Created by john davis on 9/7/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var input = 0.0
    
    var output: Double {
        // this is wrong. this is the dpi value
        // for 5.669 mm/pixel
        let inch = input / 25.4
        return inch
    }
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("mm").textCase(.none)) {
                    TextField("mm", value: $input, format: .number)
                }
                Section(header: Text("inch").textCase(.none)) {
                    Text(output, format: .number)
                }
                Section(header: Text("mm per pixel").textCase(.none)) {
                    TextField("mm", value: $input, format: .number)
                }
                Section(header: Text("inch").textCase(.none)) {
                    Text(output, format: .number)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
