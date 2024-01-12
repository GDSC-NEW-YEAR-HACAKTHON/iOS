//
//  CheckChallengeContentModel.swift
//  Profess
//
//  Created by 정민지 on 1/13/24.
//

import Foundation

struct CheckChallengeContentModel : Decodable {
    var goal : String
    var deadline : Date
    var code : String
    var challengeSteps : [challengeSteps]?
}

struct challengeSteps : Decodable {
    var challengeStepId : Int
    var content : String
    var deadline : Date
    var completed : Bool
}

