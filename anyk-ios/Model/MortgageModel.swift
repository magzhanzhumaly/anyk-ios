//
//  MortgageModel.swift
//  anyk-ios
//
//  Created by Magzhan Zhumaly on 26.09.2022.
//

import Foundation

struct MortgageModel: Equatable {
    let id: Int
    let AEIR: Double // ГЭСВ Годовая Эффективная Ставка Вознаграждения - Annual Effective Interest Rate
    let initialFee: String
    let minTerm: Int
    let maxTerm: Int
    let properties: [String]
    let firstStageRate: Double
    let maxCredit: Int
    let registrationFee: Double
    let ageOfBorrower: [Int]
    let continuousWorkExperience: String
    let whereToApply: String
}

