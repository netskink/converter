//
//  ContentView.swift
//  converter
//
//  Created by john davis on 9/7/24.
//

import SwiftUI

struct ContentView: View {
    
    let screens: [SubScreen.Screens] = [.mylength, .myresolution, .mymass, .mytemp]
    @State private var selection: SubScreen.Screens? = nil // nothing selected by default
    
    var body: some View {
        
        // a property?
        NavigationSplitView {
            
            Label(
                title: { Text("Converter") },
                icon: { Image("titleImage") }
            )

            List(screens, id: \.self, selection: $selection) { screen in
                NavigationLink(screen.description, value: screen)
            } // List
        } // NavigationSplitView
        
        // a property
        detail: {
            if let screen = selection {
                
                switch screen {
                case .mylength:
                    LengthView(subscreen: screen)
                case .myresolution:
                    ResolutionView(subscreen: screen)
                case .mymass:
                    MassView(subscreen: screen)
                case .mytemp:
                    TempView(subscreen: screen)
                }
            } else {
                Text("Pick a screen")
            }
        } // resolutionView
        
    }// body
    
}  // View

#Preview {
    ContentView()
}
