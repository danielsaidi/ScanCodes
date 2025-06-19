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
    @AppStorage("ScanCodeType") var scanCodeType = ScanCodeType.qr

    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("Type something here...", text: $text)
                        .textInputAutocapitalization(.never)
                }
                Section {
                    ScanCode(
                        value: text,
                        type: scanCodeType,
                        scale: 25
                    )
                }
            }
            #if os(macOS)
            .frame(minHeight: 650)
            #endif
            .navigationTitle("Demo")
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Picker(selection: $scanCodeType) {
                        ForEach(ScanCodeType.allCases) { type in
                            Text(type.name).tag(type)
                        }
                    } label: {
                        Label("Scan Code Type", systemImage: "qrcode")
                    }
                    .pickerStyle(.segmented)
                }
            }
        }

    }
}

#Preview {
    ContentView()
}
