//
//  MortgageData.swift
//  anyk-ios
//
//  Created by Magzhan Zhumaly on 26.09.2022.
//

import Foundation

struct MortgageData: Codable {
    let id: Int
    let AEIR: Double // ГЭСВ Годовая Эффективная Ставка Вознаграждения - Annual Effective Interest Rate
    let initialFee: String
    let minTerm: Int
    let maxTerm: Int
    let properties: [String]
    let firstStageRate: Double
    let maxCredit: Int
    let registrationFeeText: String
    let feePercent: Double
    let feeInitial: Int
    let ageOfBorrower: [String]
    let continuousWorkExperience: String
    let whereToApply: [String]
    let details: [String]
}
