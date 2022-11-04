//
//  MortgageModel.swift
//  anyk-ios
//
//  Created by Magzhan Zhumaly on 26.09.2022.
//

import Foundation

struct MortgageModel: Equatable {
    var id: Int
    let name: String
    let AEIR: Double // ГЭСВ Годовая Эффективная Ставка Вознаграждения - Annual Effective Interest Rate
    let firstStageRate: Double
    let ageOfBorrower: [String]
    let initialFeePercentageString: String
    let initialFeeLowerBound: Int
    let initialFeeUpperBound: Int

    let maxCredit: Int
    let continuousWorkExperience: String
    
    let minTerm: Int
    let maxTerm: Int
    
    let feePercent: Double
    let feeInitial: Double
    
    let properties: [String]
    let whereToApply: [String]
    let details: [String]
    let detailsColors: [String]
    let detailsFull: String
    let imageName: String
}
