//
//  ApplicationTableViewController.swift
//  ResinDashboard
//
//  Created by Alex Kerney on 2/22/18.
//  Copyright © 2018 Alex Kerney. All rights reserved.
//

import UIKit

class ApplicationTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
        self.navigationItem.leftItemsSupplementBackButton = true

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
}
