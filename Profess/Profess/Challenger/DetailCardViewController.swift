//
//  DetailCardViewController.swift
//  Profess
//
//  Created by byeoungjik on 1/13/24.
//

import UIKit

class DetailCardViewController: UIViewController {
    @IBOutlet weak var stepTitle: UILabel!
    static let identifier = "DetailCardView"
    @IBOutlet weak var stepBoxView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        stepBoxView.layer.cornerRadius = 8
    }

}
