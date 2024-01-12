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
    
    var countdownTimer: Timer?
    var deadline: Date?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - UnlockStepTableViewCell Configuration
    func configure(with step: challengeSteps, at index: Int) {
        self.stepLabel.text = "STEP \(index + 1)"
        self.stepExplanationLabel.text = step.content
        
        updateDeadlineLabel(with: step.deadline)
        startTimer()
        
    }
    
    func updateDeadlineLabel(with deadline: Date) {
            let currentTime = Date()
            let timeInterval = deadline.timeIntervalSince(currentTime)
            
            if timeInterval <= 0 {
                // 시간이 지났다면 타이머를 중지하고 00:00:00을 표시합니다.
                self.stepDeadlineLabel.text = "00:00:00"
                countdownTimer?.invalidate()
                countdownTimer = nil
            } else {
                // 남은 시간을 포맷에 맞춰 문자열로 변환합니다.
                self.stepDeadlineLabel.text = timeString(time: timeInterval)
            }
        }

        // 타이머를 시작하는 메서드입니다.
        func startTimer() {
            // 이전에 실행 중인 타이머가 있으면 종료합니다.
            countdownTimer?.invalidate()
            
            // 타이머를 설정합니다.
            countdownTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        }

        // 타이머에 의해 호출되는 메서드입니다.
        @objc func updateTime() {
            guard let deadline = self.deadline else { return }
            updateDeadlineLabel(with: deadline)
        }

        // 남은 시간을 문자열로 변환하는 메서드입니다.
        func timeString(time: TimeInterval) -> String {
            let hours = Int(time) / 3600
            let minutes = Int(time) / 60 % 60
            let seconds = Int(time) % 60
            return String(format: "%02i:%02i:%02i", hours, minutes, seconds)
        }

        // 셀이 재사용될 준비가 될 때 호출됩니다.
        override func prepareForReuse() {
            super.prepareForReuse()
            countdownTimer?.invalidate()
            countdownTimer = nil
            stepDeadlineLabel.text = "00:00:00"
    }
}





