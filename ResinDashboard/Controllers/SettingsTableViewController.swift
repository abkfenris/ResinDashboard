//
//  SettingsTableViewController.swift
//  ResinDashboard
//
//  Created by Alex Kerney on 2/25/18.
//  Copyright © 2018 Alex Kerney. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    @IBOutlet weak var applicationDisplayControl: UISegmentedControl!
    @IBOutlet weak var tokenField: UITextView!
    @IBOutlet weak var keychainSwitch: UISwitch!
    @IBOutlet weak var idSwitch: UISwitch!
    
    @IBOutlet weak var biometricAuthLabel: UILabel!
    
    var collapsedApplications: Bool?
    var savedToken: Bool?
    var tokenInKeychain: Bool?
    var keychainProtectedWithBiometricAuth: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let collapsedApplications = collapsedApplications {
            applicationDisplayControl.selectedSegmentIndex = collapsedApplications ? 1 : 0
        }
        
        // if savedToken show placeholder in textfield
        // if tokenInKeychain set keychainSwitch = true
        // if keychainProtectedWithBiometricAuth set idSwitch = true
        
        // if faceID change label of biometric auth
    }
}
