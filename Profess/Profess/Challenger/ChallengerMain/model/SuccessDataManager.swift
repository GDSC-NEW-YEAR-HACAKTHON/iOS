//
//  SuccessDataManager.swift
//  Profess
//
//  Created by 정민지 on 1/13/24.
//

import Alamofire

class SuccessDataManager {
    func SuccessDataManager() {
        let headers: HTTPHeaders = [
            "Authorization": "Bearer YOUR_TOKEN",
            "Accept": "application/json"
        ]

        let url = "http://192.168.8.191:8080/api/challenge/success"

        AF.request(url, method: .delete, headers: headers).response { response in
            switch response.result {
            case .success:
                print("챌린지 성공 전송")
            case .failure(let error):
                print("챌린지 성공 전송 실패: \(error.localizedDescription)")
            }
        }
    }
}

