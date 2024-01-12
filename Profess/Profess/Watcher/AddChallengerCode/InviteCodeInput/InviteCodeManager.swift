//
//  InviteCodeManager.swift
//  Profess
//
//  Created by 정민지 on 1/13/24.
//
import Alamofire

class InviteCodeDataManager {
    func posts(_ viewController: AddChallengerViewController, _ parameter: InviteCodeInput) {
        AF.request("/api/watcher", method: .post, parameters: parameter, encoder: JSONParameterEncoder.default, headers: nil).validate().responseDecodable(of: InviteCodeModel.self) { response in
            switch response.result {
            case .success(_):
                    print("성공")

            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
