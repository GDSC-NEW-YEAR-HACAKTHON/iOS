//
//  ChallengeStepCheckDataManager.swift
//  Profess
//
//  Created by 정민지 on 1/13/24.
//

import Alamofire

class ChallengeStepCheckDataManager {
    func ChallengeStepCheckDataManager(_ viewController: ChallengerHomeViewController, _ parameter: ChallengeStepCheckInput) {
        
        
        AF.request("http://192.168.8.191:8080/api/challenge/check", method: .post, parameters: parameter, encoder: JSONParameterEncoder.default, headers: nil).validate().responseDecodable(of: InviteCodeModel.self) { response in
            print("Response: \(response)")
            
            switch response.result {
            case .success(_):
                    print("성공")

            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
