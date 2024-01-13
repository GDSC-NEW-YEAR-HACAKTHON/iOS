//
//  ChallengerHomeViewController.swift
//  Profess
//
//  Created by 정민지 on 1/13/24.
//

import UIKit

class ChallengerHomeViewController: UIViewController {
    //MARK: -Properties
    @IBOutlet weak var TitleNavigationBar: UINavigationBar!
    @IBOutlet weak var StepTableView: UITableView!
    var challengeContent : CheckChallengeContentModel?
    
    //MARK: -Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        fetchChallengerContent()
        
        checkAndNavigateIfEmpty()
    }
    //MARK: -API호출
    private func fetchChallengerContent() {
            let dataManager = ChallengerContentDataManager()
            dataManager.ChallengerContentDataManager(self)
        }
    
    //MARK: -Navigator
    private func checkAndNavigateIfEmpty() {
            if challengeContent?.challengeSteps?.isEmpty ?? true {
                navigateToAddChallengerViewController()
            }
        }

        private func navigateToAddChallengerViewController() {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let addChallengerVC = storyboard.instantiateViewController(withIdentifier: "AddChallengerViewController") as? AddChallengerViewController {
                self.navigationController?.pushViewController(addChallengerVC, animated: true)
            }
        }
    
    
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

extension ChallengerHomeViewController {
    func successAPI2(_ result: CheckChallengeContentModel) {
        challengeContent = result
        if let goal = challengeContent?.goal {
                    self.navigationItem.title = goal
                }
        StepTableView.reloadData()
    }
}

    
    //MARK: - UITableViewDelegate, UITableViewDataSource
extension ChallengerHomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return challengeContent?.challengeSteps?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let step = challengeContent?.challengeSteps?[indexPath.row] else {
                    fatalError("Could not find step for indexPath")
                }
        
        // 완료된 셀 반환x
        if step.completed {
            return UITableViewCell()
            // 완료되지 않은 셀 반환
        } else {
            if let firstIncompleteStep = challengeContent?.challengeSteps?.first(where: { !$0.completed }) {
                    if step.challengeStepId == firstIncompleteStep.challengeStepId {
                        guard let cell = tableView.dequeueReusableCell(withIdentifier: UnlockStepTableViewCell.identifier, for: indexPath) as? UnlockStepTableViewCell else {
                            fatalError("Could not dequeue UnlockStepTableViewCell")
                        }
                        cell.configure(with: step, at: indexPath.row)
                        return cell
                    }
                }
                
                guard let cell = tableView.dequeueReusableCell(withIdentifier: LockStepTableViewCell.identifier, for: indexPath) as? LockStepTableViewCell else {
                    fatalError("Could not dequeue LockStepTableViewCell")
                }
                cell.configure(with: step, at: indexPath.row)
                return cell
                }
        }
}
