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

    @State private var input = 0.0

    
    // 25.4 mm == 1.0 inch
    
    var output: Double {
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
            }
        }
    }
    

}


#Preview {
    LengthView(subscreen: .mylength)
}
