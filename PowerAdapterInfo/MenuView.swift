//
//  MenuView.swift
//  PowerAdapterInfo
//
//  Created by Junichi Kakisako on 2023/11/15.
//

import SwiftUI

struct MenuView: View {
    @ObservedObject var powerSourceInfo: PowerSourceInfo
    
    var body: some View {
        Text("Wattage: \(powerSourceInfo.wattage)W")
        Text("Current: \(String(format: "%.1f", powerSourceInfo.current))A")
        Text("Voltage: \(String(format: "%.1f", powerSourceInfo.voltage))V")
        Divider()
        /*
        Button("設定") {
            showSettingsWindow()
        }.keyboardShortcut(",")
         */
        Button("PowerAdapterInfoについて") {
            showAbout()
        }
        Button("終了") {
            quitApp()
        }.keyboardShortcut("Q")
    }
    
    private func showSettingsWindow() {
        NSApp.sendAction(Selector(("showSettingsWindow:")), to: nil, from: nil)
        NSApp.activate(ignoringOtherApps: true)
    }
    
    private func showAbout() {
        NSApp.activate(ignoringOtherApps: true)
        NSApp.orderFrontStandardAboutPanel()
    }
    
    private func quitApp() {
        NSApplication.shared.terminate(nil)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(powerSourceInfo: PowerSourceInfo())
    }
}
