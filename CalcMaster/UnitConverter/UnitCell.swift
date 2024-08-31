//
//  UnitCell.swift
//  CalcMaster
//
//  Created by Priyansh Parekh on 8/29/24.
//

import UIKit

class UnitCell: UITableViewCell {

    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var unitNameLabel: UILabel!
    @IBOutlet weak var unitSymbolLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
