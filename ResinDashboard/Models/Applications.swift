//
//  Applications.swift
//  ResinDashboard
//
//  Created by Alex Kerney on 2/19/18.
//  Copyright © 2018 Alex Kerney. All rights reserved.
//

import Foundation

struct Application: Codable {
    let id: String // or Int
    var uri: String
    var actor: String // or Int
    var name: String
    var application: String?
    var commit: String
    var deviceType: String
    var gitRepository: String
    var shouldTrackLatestRelease: Bool
    var supportExpiryDate: Date
    
    var devices: [String] = []
}

struct Applications: Codable {
    let applications: [Applications]
}
