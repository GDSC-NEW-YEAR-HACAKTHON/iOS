//
//  LockStepTableViewCell.swift
//  Profess
//
//  Created by 정민지 on 1/12/24.
//

import UIKit

class LockStepTableViewCell: UITableViewCell {
    static let identifier = "LockStepTableViewCell"
    
    @IBOutlet weak var stepLabel: UILabel!
    @IBOutlet weak var stepDetailBackgroundView: UIView!
    @IBOutlet weak var lockImage: UIImageView!
    @IBOutlet weak var lockExplanationLabel: UILabel!
    @IBOutlet weak var lockButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupAttribute()
    }
    
    private func setupAttribute() {
        stepDetailBackgroundView.layer.cornerRadius = 10
    }
}
