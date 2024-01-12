//
//  AddChallengerViewController.swift
//  Profess
//
//  Created by 정민지 on 1/12/24.
//

import UIKit

class AddChallengerViewController: UIViewController {
    //MARK: -Properties

    @IBOutlet weak var addExplainLabel: UILabel!
    @IBOutlet weak var inviteCodeLabel: UILabel!
    @IBOutlet weak var inputInviteCodeTextField: UITextField!
    @IBOutlet weak var inviteCodeExplainLabel: UILabel!
    @IBOutlet weak var attendInviteCodeButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: -Actions
    @IBAction func attendInviteCodeButtonTapped(_ sender: UIButton) {
            let inviteCode = inputInviteCodeTextField.text ?? ""

            let inviteCodeInput = InviteCodeInput(challengeCode: inviteCode)
        
            let dataManager = InviteCodeDataManager()
            dataManager.posts(self, inviteCodeInput)
        }

        func navigateToWatchHomeViewController() {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let watchHomeVC = storyboard.instantiateViewController(withIdentifier: "WatchHomeViewController") as? WatchHomeViewController {
                self.navigationController?.pushViewController(watchHomeVC, animated: true)
            }
        }


}

