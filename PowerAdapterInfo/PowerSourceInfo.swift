//
//  PowerAdapter.swift
//  PowerAdapterInfo
//
//  Created by Junichi Kakisako on 2023/11/15.
//

import Foundation
import IOKit.ps

class PowerSourceInfo: ObservableObject {
    @Published var wattage: Int = 0
    @Published var current: Float = 0
    @Published var voltage: Float = 0
    @Published var acConnected: Bool = false

    init() {
        updateACPowerInfo()
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { _ in
            self.updateACPowerInfo()
        }
    }

    func updateACPowerInfo() {
        if let acPowerDetails = getACPowerAdapterDetails() {
            self.wattage = acPowerDetails[kIOPSPowerAdapterWattsKey] as! Int
            self.current = acPowerDetails[kIOPSPowerAdapterCurrentKey] as! Float / 1000
            self.voltage = acPowerDetails["AdapterVoltage"] as! Float / 1000
            self.acConnected = true
        } else {
            self.wattage = 0
            self.current = 0
            self.voltage = 0
            self.acConnected = false
        }
    }
    
    func getACPowerAdapterDetails() -> [String: Any]? {
        guard let details = IOPSCopyExternalPowerAdapterDetails()?.takeRetainedValue() as? [String: Any] else {
            return nil
        }
        return details
    }
    
}
