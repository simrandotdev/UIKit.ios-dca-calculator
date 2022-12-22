//
//  CalculatorTableViewController.swift
//  ios-dca-calculator
//
//  Created by Kelvin Fok on 5/11/20.
//

import UIKit

class CalculatorTableViewController: UITableViewController {
    
    @IBOutlet weak var currentValueLabel: UILabel!
    @IBOutlet weak var investmentAmountLabel: UILabel!
    @IBOutlet weak var gainLabel: UILabel!
    @IBOutlet weak var yieldLabel: UILabel!
    @IBOutlet weak var annualReturnLabel: UILabel!
    
    @IBOutlet weak var initialInvestmentAmountTextField: UITextField!
    @IBOutlet weak var monthlyDollarCostAveragingTextField: UITextField!
    @IBOutlet weak var initialDateOfInvestmentTextField: UITextField!
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet var currencyLabels: [UILabel]!
    @IBOutlet weak var investmentAmountCurrencyLabel: UILabel!
    @IBOutlet weak var dateSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
