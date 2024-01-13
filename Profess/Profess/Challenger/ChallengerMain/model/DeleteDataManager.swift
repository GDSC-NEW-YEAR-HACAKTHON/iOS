//
//  DeleteDataManager.swift
//  Profess
//
//  Created by 정민지 on 1/13/24.
//

import Alamofire

class DeleteDataManager {
    func DeleteDataManager() {
        let headers: HTTPHeaders = [
            "Authorization": "Bearer YOUR_TOKEN",
            "Accept": "application/json"
        ]

        let url = "http://192.168.8.191:8080/api/challenge/fail"

        AF.request(url, method: .delete, headers: headers).response { response in
            switch response.result {
            case .success:
                print("삭제 성공")
            case .failure(let error):
                print("삭제 실패: \(error.localizedDescription)")
            }
        }
    }
}
