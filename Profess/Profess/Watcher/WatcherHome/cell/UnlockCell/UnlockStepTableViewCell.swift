//
//  UnlockStepTableViewCell.swift
//  Profess
//
//  Created by 정민지 on 1/12/24.
//

import UIKit

class UnlockStepTableViewCell: UITableViewCell {
    static let identifier = "UnlockStepTableViewCell"
    
    @IBOutlet weak var stepLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var stepDetailBackgroundView: UIView!
    @IBOutlet weak var stepExplanationLabel: UILabel!
    @IBOutlet weak var stepDeadlineLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}



