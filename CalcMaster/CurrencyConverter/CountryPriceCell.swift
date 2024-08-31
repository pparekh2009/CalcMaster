//
//  CountryPriceCell.swift
//  Calculator
//
//  Created by Priyansh Parekh on 8/13/24.
//

import UIKit

class CountryPriceCell: UITableViewCell {

    static let identifier = "CountryPriceCell"
    
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var countryCodeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    static func nib() -> UINib {
        return UINib(nibName: "CountryPriceCell", bundle: nil)
    }
    
    func configure(name: String, code: String, price: String) {
        rateLabel.text = price
        countryNameLabel.text = name
        countryCodeLabel.text = code
    }
}
