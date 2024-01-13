//
//  InviteCodeModel.swift
//  Profess
//
//  Created by 정민지 on 1/13/24.
//

import Foundation

struct InviteCodeModel: Decodable {
    var goal : String
    var deadline : Date
    var postChallengeSteps : [postChallengeSteps]?
}

struct postChallengeSteps : Decodable {
    var content : String
    var deadline : Date
    var completed : Bool
}
