//
//  ApplicationViewController.swift
//  ResinDashboard
//
//  Created by Alex Kerney on 2/25/18.
//  Copyright © 2018 Alex Kerney. All rights reserved.
//

import UIKit

class ApplicationViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var collapsedApplications: Bool = false
    var highlightOnline: Bool = false
    
    let apps = ["gage", "gage-test", "hackathon", "test1", "test2", "test3", "test4", "test5", "test6", "test7", "test8", "test9", "test10"]
    let devices = ["bull-branch", "swift", "cathance", "cold brook", "sheepscot", "sawyer", "ellis", "sandy stream"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        layout?.sectionHeadersPinToVisibleBounds = true
        layout?.sectionInsetReference = .fromSafeArea
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier! {
        case Segue.settings.rawValue:
            showSettings(segue: segue)
        case Segue.overviewToDevice.rawValue:
            showDevice(segue: segue)
        default:
            print("Specific segue is not yet added")
        }
    }
}


// MARK: - Private Extension
extension ApplicationViewController {
    func showSettings(segue: UIStoryboardSegue) {
        guard let navVC = segue.destination as? UINavigationController, let settingVC = navVC.topViewController as? SettingsTableViewController else { return }
        
        settingVC.collapsedApplications = collapsedApplications
        
    }
    
    func showDevice(segue: UIStoryboardSegue) {
        guard let navController = segue.destination as? UINavigationController, let vc = navController.topViewController as? SingleDeviceTableViewController else { return }
        
        vc.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
        vc.navigationItem.leftItemsSupplementBackButton = true
    }
    
    @IBAction func unwindFromSaveSettings(for unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        guard let settingsVC = unwindSegue.source as? SettingsTableViewController, let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }

        if settingsVC.applicationDisplayControl.selectedSegmentIndex == 1 {
            collapsedApplications = true
            layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        } else {
            collapsedApplications = false
            layout.sectionInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        }
        collectionView.reloadData()
    }
    
    @IBAction func unwindFromCancelSettings(for unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        
    }
}


// MARK: - UICollectionViewDataSource
extension ApplicationViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return apps.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collapsedApplications {
            return 0
        } else {
            return devices.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "device", for: indexPath) as! DeviceCollectionViewCell
        //cell.backgroundColor = UIColor(named: "Safe-Gray")
        
        let device = devices[indexPath.row]
        cell.nameLabel.text = device
        
        cell.indicatorView.layer.cornerRadius = cell.indicatorView.frame.height / 4
        cell.indicatorView.layer.masksToBounds = true
        
        if indexPath.row % 2 == 0 {
            cell.nameLabel.textColor = UIColor(named: "Safe-Red")
            cell.indicatorView.isHidden = true
        } else if highlightOnline {
            cell.nameLabel.textColor = .white
            cell.indicatorView.isHidden = false
        } else {
            cell.nameLabel.textColor = .black
            cell.indicatorView.isHidden = true
        }
        
        
        /*cell.contentView.layer.cornerRadius = 25 //cell.frame.height / 2
        //cell.backgroundView?.layer.cornerRadius = cell.frame.height / 2
        //cell.backgroundView?.clipsToBounds = true
        //cell.backgroundView?.layer.masksToBounds = true
        cell.contentView.layer.masksToBounds = true
        cell.contentView.clipsToBounds = true*/
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! ApplicationCollectionReusableView
        
        let app = apps[indexPath.section]
        header.nameLabel.text = app
        
        // make it so that the labels stay within the safe area on an iPhone X
        header.insetsLayoutMarginsFromSafeArea = true
        //header.backgroundColor = UIColor(named: "Resin-Yellow")
        
        return header
    }
}

// MARK: - UICollectionViewDelegate
extension ApplicationViewController: UICollectionViewDelegate {
    
}
