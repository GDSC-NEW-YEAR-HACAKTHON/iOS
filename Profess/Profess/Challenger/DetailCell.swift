//
//  DetailCell.swift
//  Profess
//
//  Created by byeoungjik on 1/13/24.
//

import UIKit

class DetailCell: UITableViewCell {

    @IBOutlet weak var detailTime: UIDatePicker!
    @IBOutlet weak var detailDate: UIDatePicker!
    @IBOutlet weak var detailContents: UITextField!
    @IBOutlet weak var stepTitle: UILabel!
    static let identifier = "DetailCardView"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        detailContents.layer.cornerRadius = 8
//        configure()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with step: challengeSteps, at index: Int) {
        self.stepTitle.text = "STEP \(index + 1)"
    }

}
