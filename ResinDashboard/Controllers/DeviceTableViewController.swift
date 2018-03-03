//
//  DeviceTableViewController.swift
//  ResinDashboard
//
//  Created by Alex Kerney on 2/25/18.
//  Copyright © 2018 Alex Kerney. All rights reserved.
//

import UIKit

class DeviceTableViewController: UITableViewController {
    
    let devices = ["bull-branch", "swift", "cathance"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return devices.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableDeviceCell", for: indexPath)

        let device = devices[indexPath.row]
        // Configure the cell...
        cell.textLabel?.text = device

        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier! {
        case Segue.deviceListToDevice.rawValue:
            showDevice(segue: segue)
        default:
            print("Specific segue is not yet added")
        }
    }
}

extension DeviceTableViewController {
    func showDevice(segue: UIStoryboardSegue) {
        guard let navController = segue.destination as? UINavigationController, let vc = navController.topViewController as? SingleDeviceTableViewController else { return }
        
        vc.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
        vc.navigationItem.leftItemsSupplementBackButton = true
    }
}
