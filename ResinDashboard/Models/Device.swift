//
//  Device.swift
//  ResinDashboard
//
//  Created by Alex Kerney on 2/19/18.
//  Copyright © 2018 Alex Kerney. All rights reserved.
//

import Foundation


struct Device {
    let id: String // or int
    
    var name: String
    var note: String?
    let uri: String
    
    let application: String // or int
    let build: String?
    let commit: String
    let device: String
    let deviceType: String
    
    let createdAt: Date
    var lastConnectivityEvent: Date
    var lastSeenTime: Date
    var supportExpiryDate: Date
    
    var latitude: Float
    var longitude: Float
    var customLatitude: Float
    var customLongitude: Float
    var location: String

    let downloadProgress: Float
    var ipAddress: String // Swift probably has an IP address type buried somewhere
    var isOnline: Bool
    var isWebAccessible: Bool
    var localId: String
    var logsChannel: String
    var osVariant: String
    var osVersion: String
    var provisioningProcess: Float?
    var provisioningState: String?
    var publicAddress: String // Swift IP type if avaliable
    var serviceInstance: String
    var status: String
    var supervisorRelease: String?
    var supervisiorVersion: String
    var user: String
    var uuid: String
    var vpnAddress: String?
}
