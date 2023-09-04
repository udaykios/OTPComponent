//
//  ContentView.swift
//  OTPComponent
//
//  Created by UDAY on 04/09/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            OTPfieldView()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
