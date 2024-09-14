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
    
    var output: Double {
        let pounds = input * 2.205
        return pounds
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("kg").textCase(.none)) {
                    TextField("kg", value: $input, format: .number)
                }
                Section(header: Text("pounds").textCase(.none)) {
                    Text(output, format: .number)
                }
            } // Form
        } // NavigationStack
    } // View


}


#Preview {
    MassView(subscreen: .mymass)
}
