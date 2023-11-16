//
//  PowerAdapterInfoApp.swift
//  PowerAdapterInfo
//
//  Created by Junichi Kakisako on 2023/11/15.
//

import SwiftUI

@main
struct PowerAdapterInfoApp: App {
    @StateObject private var powerSourceInfo = PowerSourceInfo()
    
    var body: some Scene {
        MenuBarExtra {
            MenuView(powerSourceInfo: powerSourceInfo)
        } label: {
            Image(systemName: powerSourceInfo.acConnected ? "bolt.fill" : "bolt.slash.fill")
            Text(" \(powerSourceInfo.wattage)W")
        }
        /*
        Settings {
            SettingsView()
        }*/
    }
}
