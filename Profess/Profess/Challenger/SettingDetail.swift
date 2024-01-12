//
//  SettingDetail.swift
//  Profess
//
//  Created by byeoungjik on 1/12/24.
//

import UIKit

class SettingDetail: UIViewController {

    var numSteps: Int? = 0
    @IBOutlet weak var detailCardTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        detailCardTableView()
    }
    
    private func detailCardTableView() {
        // delegate 연결
        detailCardTable.delegate = self
        detailCardTable.dataSource = self
        
        // cell 등록
        detailCardTable.register(UINib(nibName: "DetailCard", bundle: nil), forCellReuseIdentifier: DetailCardViewController.identifier)
        detailCardTable.register(UINib(nibName: "LockStepTableViewCell", bundle: nil), forCellReuseIdentifier: LockStepTableViewCell.identifier)
    }
}

extension SettingDetail: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numSteps ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // DetailCardViewController를 반환
        guard let card = tableView.dequeueReusableCell(withIdentifier: DetailCardViewController.identifier, for: indexPath) as? DetailCardViewController else {
            fatalError("Could not dequeue DetailCardViewController")
        }
        // 셀 구성하기
        card.stepTitle.text = "Step \(indexPath.row + 1)"
//        return card 
    }
}
