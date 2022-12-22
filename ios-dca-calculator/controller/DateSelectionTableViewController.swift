//
//  DateSelectionTableViewController.swift
//  ios-dca-calculator
//
//  Created by Kelvin Fok on 30/11/20.
//

import UIKit

class DateSelectionTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

class DateSelectionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var monthsAgoLabel: UILabel!
}
