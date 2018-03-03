//
//  ApplicationCollectionReusableView.swift
//  ResinDashboard
//
//  Created by Alex Kerney on 2/25/18.
//  Copyright © 2018 Alex Kerney. All rights reserved.
//

import UIKit

class ApplicationCollectionReusableView: UICollectionReusableView {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var deviceCountLabel: UILabel!
    
    func set(application: Application, splitDisclosure: Bool) {
    }
}
