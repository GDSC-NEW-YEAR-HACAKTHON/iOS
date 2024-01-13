//
//  SettingGoal.swift
//  Profess
//
//  Created by byeoungjik on 1/12/24.
//

import UIKit

protocol DataTransferDelegate: AnyObject {
    func sendData(data: String)
}

class SettingGoal: UIViewController {
    @IBOutlet weak var createGoalButton: UIButton!
    @IBOutlet weak var finalDate: UIDatePicker!
    @IBOutlet weak var finalTime: UIDatePicker!
    @IBOutlet weak var goalTitle: UITextField!
    @IBOutlet weak var numSteps: UITextField!
    
    var selectedTime: String = ""
    var selectedDate: String = ""
    var selectedTitle: String? = ""
    var selectedNumSteps: Int? = 0
    var delegate: DataTransferDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        finalDate.addTarget(self, action: #selector(dateValueChanged), for: .valueChanged)
//        finalTime.addTarget(self, action: #selector(timeValueChanged), for: .valueChanged)
        goalTitle.addTarget(self, action: #selector(goalTitleChanged), for: .editingChanged)
        numSteps.addTarget(self, action: #selector(numStepsChanged), for: .editingChanged)

        createGoalButton.layer.cornerRadius = 8
        goalTitle.borderStyle = .none
        numSteps.borderStyle = .none
    }

//    @objc func dateValueChanged() {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd"
//        selectedDate = dateFormatter.string(from: finalDate.date)
//        print("Selected Date: \(selectedDate)")
//    }
    @IBAction func dateValueChange(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        selectedDate = dateFormatter.string(from: finalDate.date)
        print("Selected Date: \(selectedDate)")
    }
    
    @IBAction func timeValueChange(_ sender: Any) {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm"
        selectedTime = timeFormatter.string(from: finalTime.date)
        print("Selected Time: \(selectedTime)")
    }
//    @objc func timeValueChanged() {
//        let timeFormatter = DateFormatter()
//        timeFormatter.dateFormat = "HH:mm"
//        selectedTime = timeFormatter.string(from: finalTime.date)
//        print("Selected Time: \(selectedTime)")
//    }

    @objc func goalTitleChanged() {
        selectedTitle = goalTitle.text
    }

    @objc func numStepsChanged() {
        selectedNumSteps = Int(numSteps.text!)
    }

    @IBAction func showSettingDetailView(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(identifier: "SettingDetail") as? SettingDetail else {
            return
        }
        vc.numSteps = selectedNumSteps
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
