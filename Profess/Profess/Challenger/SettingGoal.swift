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
    //    private let datePicker = UIDatePicker()
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
        
        finalDate.addTarget(self, action: #selector(dateValueChanged(_:)), for: .valueChanged)
        finalTime.addTarget(self, action: #selector(timeValueChanged(_:)), for: .valueChanged)
        createGoalButton.layer.cornerRadius = 8
    }
    

    @objc func dateValueChanged(_ sender: UIDatePicker) {
            // datePicker의 값을 "yyyy-MM-dd" 형식의 문자열로 변환합니다.
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"

            selectedDate = dateFormatter.string(from: sender.date)
            print("Selected Date: \(selectedDate)")
            
            // 이제 selectedDate를 필요한 변수에 저장하거나 다른 작업에 활용할 수 있습니다.
        }
    @objc func timeValueChanged(_ sender: UIDatePicker) {
            let timeFormatter = DateFormatter()
            timeFormatter.dateFormat = "HH:mm:ss"

            selectedTime = timeFormatter.string(from: sender.date)
            print("Selected Date: \(selectedDate)")
        }
    @objc func goalTitleChanged() {
        selectedTitle = goalTitle.text
        }
    @objc func numStepsChanged() {
        selectedNumSteps = Int(numSteps.text!)
        }

    @IBAction func showSettingDetailView(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(identifier: "SettingDetailStoryboard") as? SettingDetail else {
            return
        }
        vc.numSteps = selectedNumSteps
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
