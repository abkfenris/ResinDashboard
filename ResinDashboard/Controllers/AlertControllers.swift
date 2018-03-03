//
//  AlertControllers.swift
//  ResinDashboard
//
//  Created by Alex Kerney on 2/22/18.
//  Copyright © 2018 Alex Kerney. All rights reserved.
//

import Foundation
import UIKit

func deviceAlertController(deviceID: String, deviceName: String) -> UIAlertController {
    let alert = UIAlertController(title: "Actions", message: nil, preferredStyle: .actionSheet)
    
    let blinkLed = UIAlertAction(title: "Blink LED on \(deviceName)", style: .default, handler: nil)
    alert.addAction(blinkLed)
    
    let reboot = UIAlertAction(title: "Reboot", style: .destructive, handler: nil)
    alert.addAction(reboot)
    
    let restart = UIAlertAction(title: "Restart Application", style: .default, handler: nil)
    alert.addAction(restart)
    
    let publicURL = UIAlertAction(title: "Public URL", style: .default, handler: nil)
    alert.addAction(publicURL)
    
    let updateLocking = UIAlertAction(title: "Update Locking", style: .default, handler: nil)
    alert.addAction(updateLocking)
    
    let move = UIAlertAction(title: "Move device to another application", style: .default, handler: nil)
    alert.addAction(move)
    
    let supportAccess = UIAlertAction(title: "Grant Support Access", style: .default, handler: nil)
    alert.addAction(supportAccess)
    
    let purgeData = UIAlertAction(title: "Purge Data", style: .destructive, handler: nil)
    alert.addAction(purgeData)
    
    let delete = UIAlertAction(title: "Delete Device", style: .destructive, handler: nil)
    alert.addAction(delete)
    
    return alert
}


func applicationAlertController(applicationID: String, applicationName: String) -> UIAlertController {
    let alert = UIAlertController(title: "Actions for all \(applicationName) devices?", message: nil, preferredStyle: .actionSheet)
    
    let publicURL = UIAlertAction(title: "Public URL", style: .default, handler: nil)
    alert.addAction(publicURL)
    
    let restart = UIAlertAction(title: "Restart Application", style: .default, handler: nil)
    alert.addAction(restart)
    
    let supportAccess = UIAlertAction(title: "Grant Support Access", style: .default, handler: nil)
    alert.addAction(supportAccess)
    
    let purgeData = UIAlertAction(title: "Purge Data", style: .destructive, handler: nil)
    alert.addAction(purgeData)
    
    let reboot = UIAlertAction(title: "Reboot", style: .destructive, handler: nil)
    alert.addAction(reboot)
    
    let shutdown = UIAlertAction(title: "Shutdown", style: .destructive, handler: nil)
    alert.addAction(shutdown)
    
    let delete = UIAlertAction(title: "Delete Application", style: .destructive, handler: nil)
    alert.addAction(delete)
    
    let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    alert.addAction(cancel)
    
    return alert
}
