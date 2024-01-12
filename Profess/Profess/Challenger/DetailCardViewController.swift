//
//  DetailCardViewController.swift
//  Profess
//
//  Created by byeoungjik on 1/13/24.
//

import UIKit

class DetailCardViewController: UIViewController {

    @IBOutlet weak var stepBoxView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        stepBoxView.layer.cornerRadius = 8
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
