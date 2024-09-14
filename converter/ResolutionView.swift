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
    
    var output: Double {
        let inch = input * 25.4
        return inch
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("pixels per mm").textCase(.none)) {
                    TextField("mm", value: $input, format: .number)
                }
                Section(header: Text("pixels(dot) per inch").textCase(.none)) {
                    Text(output, format: .number)
                }
            } // Form
        } // NavigationStack
    } // View


}


#Preview {
    ResolutionView(subscreen: .myresolution)
}
