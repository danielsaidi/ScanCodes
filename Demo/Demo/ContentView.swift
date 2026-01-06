//
//  ContentView.swift
//  Demo
//
//  Created by Daniel Saidi on 2025-06-19.
//  Copyright © 2025-2026 Daniel Saidi. All rights reserved.
//

import SwiftUI
import ScanCodes

struct ContentView: View {

    @AppStorage("TextInput") var value = ""
    @AppStorage("ScanCodeType") var scanCodeType = ScanCodeType.qr

    var body: some View {
        NavigationStack {
            List {
                Section("Scan Code Type") {
                    Picker(selection: $scanCodeType) {
                        ForEach(ScanCodeType.allCases) { type in
                            Text(type.name).tag(type)
                        }
                    } label: {
                        Label("Scan Code Type", systemImage: "qrcode")
                    }
                    .pickerStyle(.segmented)
                    .listRowBackground(Color.clear)
                    .listRowInsets(.init())
                }
                Section("Value") {
                    TextField("Type here to generate a scan code...", text: $value)
                        #if os(iOS)
                        .textInputAutocapitalization(.never)
                        #endif
                }
                if !value.isEmpty {
                    Section {
                        ScanCode(
                            value: value,
                            type: scanCodeType,
                            scale: 25
                        )
                    }
                }
            }
            #if os(macOS)
            .frame(minHeight: 650)
            #else
            .navigationBarTitleDisplayMode(.inline)
            #endif
            .navigationTitle("ScanCodes")
        }
    }
}

#Preview {
    ContentView()
}
