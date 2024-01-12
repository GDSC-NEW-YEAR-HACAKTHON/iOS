//
//  CheckChallengeContentDataManager.swift
//  Profess
//
//  Created by 정민지 on 1/13/24.
//

import Alamofire

class CheckChallengeContentDataManager {
    func CheckChallengeContentDataManager(_ viewController: WatchHomeViewController) {
        let headers: HTTPHeaders = [
                    "Authorization": "Bearer + 토큰",
                    "Accept": "application/json"
                ]
        
        // 날짜 포맷 설정
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

                // JSONDecoder의 날짜 디코딩 전략 설정
                let dateDecoder = JSONDecoder()
                dateDecoder.dateDecodingStrategy = .formatted(dateFormatter)

        
        AF.request("http://192.168.8.191:8080/api/challenge", method: .get).validate().responseDecodable(of: CheckChallengeContentModel.self, decoder: dateDecoder) { response in
            print("Response: \(response)")
            
            switch response.result {
            case .success(let result):
                viewController.successAPI(result)
                print("성공")
            case .failure(let error):
                print(error.localizedDescription)
                print("실패")
            }
        }
    }
}
