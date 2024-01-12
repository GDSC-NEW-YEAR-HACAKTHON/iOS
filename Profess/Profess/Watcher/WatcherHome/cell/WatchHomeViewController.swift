//
//  WatchHomeViewController.swift
//  Profess
//
//  Created by 정민지 on 1/12/24.
//

import UIKit

class WatchHomeViewController: UIViewController {
    //MARK: -Properties
    @IBOutlet weak var StepTableView: UITableView!
    
    //MARK: -Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
    }
    
    
    
    
    //MARK: -Actions
    
    
    //MARK: -Helpers
    private func setupTableView() {
        //delegate 연결
        StepTableView.delegate = self
        StepTableView.dataSource = self
        
        //cell 등록
        StepTableView.register(UINib(nibName: "UnlockStepTableViewCell", bundle: nil), forCellReuseIdentifier: UnlockStepTableViewCell.identifier)
        StepTableView.register(UINib(nibName: "LockStepTableViewCell", bundle: nil), forCellReuseIdentifier: LockStepTableViewCell.identifier)
    }
}

    
    //MARK: - UITableViewDelegate, UITableViewDataSource
extension WatchHomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if indexPath.row == 0 {
                // UnlockStepTableViewCell을 반환
                guard let cell = tableView.dequeueReusableCell(withIdentifier: UnlockStepTableViewCell.identifier, for: indexPath) as? UnlockStepTableViewCell else {
                    fatalError("Could not dequeue UnlockStepTableViewCell")
                }
                // 셀 구성하기
                cell.stepLabel.text = "Step \(indexPath.row + 1)"
                return cell
                
            } else {
                // LockStepTableViewCell을 반환
                guard let cell = tableView.dequeueReusableCell(withIdentifier: LockStepTableViewCell.identifier, for: indexPath) as? LockStepTableViewCell else {
                    fatalError("Could not dequeue lockStepTableViewCell")
                }
                // 셀 구성하기
                cell.stepLabel.text = "Step \(indexPath.row + 1)"
                return cell
            }
        }

    
    
}

