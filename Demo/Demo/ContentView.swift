//
//  ContentView.swift
//  Demo
//
//  Created by Daniel Saidi on 2025-06-19.
//  Copyright © 2025 Daniel Saidi. All rights reserved.
//

import SwiftUI
import ScanCodes

struct ContentView: View {

    @AppStorage("TextInput") var text = ""

    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("Type something here...", text: $text)
                }
                Section {
                    ScanCode(value: text, type: .qr, scale: 25)
                }
            }
            .frame(minHeight: 650)
            .navigationTitle("Demo")
        }

    }
}

#Preview {
    ContentView()
}
