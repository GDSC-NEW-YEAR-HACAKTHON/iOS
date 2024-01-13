//
//  ViewController.swift
//  Profess
//
//  Created by byeoungjik on 1/12/24.
//
import UIKit
import Alamofire
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Kakao SDK 초기화
        //KakaoSDKCommon.initSDK(appKey: "YOUR_APP_KEY")
    }

    @IBAction func kakaoLoginButtonTouchUpInside(_ sender: UIButton) {
        // 카카오톡 설치 여부 확인
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk { (oauthToken, error) in
                if let error = error {
                    print(error)
                } else {
                    print("loginWithKakaoTalk() success.")
                    // 여기에서 oauthToken.accessToken을 사용하여 토큰을 가져올 수 있습니다.
                    let accessToken = oauthToken?.accessToken
                    print("AccessToken: \(accessToken ?? "")")
                    // 토큰을 이용하여 추가적인 작업 수행
//                    self.getUserInfo()
                }
            }
        }
        if let tabBarController = self.tabBarController {
                   tabBarController.selectedIndex = 0 // 1은 두 번째 탭을 의미합니다.
               }
    }

    func getUserInfo() {
        // 토큰을 사용하여 사용자 정보 가져오기
        UserApi.shared.me() { (user, error) in
            if let error = error {
                print(error)
            } else {
                print("User ID: \(user!.id!)")
                print("User Nickname: \(user?.kakaoAccount?.profile?.nickname ?? "")")
                // 여기에서 사용자 정보(user)를 이용하여 추가적인 작업 수행
            }
        }
    }
}
func sendPostRequest() {
        // 요청할 URL
        let url = "https://your-api-endpoint.com/your-endpoint"
        
        // HTTP Body 설정
        let parameters: [String: Any] = ["personalToken": "chicken-token"]
        
        // Alamofire를 사용하여 POST 요청 보내기
//        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil)
//            .responseJSON { response in
//                switch response.result {
//                case .success(let value):
//                    // 성공적으로 응답을 받았을 때의 처리
//                    print("Response JSON: \(value)")
//                case .failure(let error):
//                    // 요청이 실패했을 때의 처리
//                    print("Error: \(error)")
//                }
//            }
    }


