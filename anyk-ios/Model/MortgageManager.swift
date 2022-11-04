//
//  MortgageManager.swift
//  anyk-ios
//
//  Created by Magzhan Zhumaly on 26.09.2022.
//

import Foundation
import UIKit

protocol MortgageManagerDelegate {
    func didUpdateMortgage(_ mortgageManager: MortgageManager, mortgage: MortgageModel)
    func didFailWithError(error: Error)
}

enum ImageName: String {
    case atfBank = "atf bank"
    case zhilStroiSberBank = "zhilstroisberbank"
    case altynBank = "altyn bank"
    case bakyttyOtbasy = "bakytty otbasy"
    case bankRBK = "bank rbk"
    case baspana = "baspana"
    case forteBank = "fortebank"
    case halykBank = "halyk bank"
    case nurBank = "nurbank"
    case nurlyZher = "nurly zher"
    case orda = "orda"
    case rentQueuers = "rentQueuers"
    case rentTeens = "rentTeens"
    case samrukKazyna = "samruk kazyna"
    case sberbank = "sberbank"
}

enum ColorName: String {
    case orange = "orange"
    case purple = "purple"
    case blue = "blue"
    case green = "green"
    case orangish = "orangish"
}

class MortgageManager {
//    var delegate: MortgageManagerDelegate?
    var isPaginating = false
    
    var leftOutData = [MortgageModel]()
    
    var myOriginalData = [
        MortgageModel(id: -2,
                      name: "Ипотека от Altynbank",
                      AEIR: 13.75,
                      firstStageRate: 13.75,
                      ageOfBorrower: ["мужчины: с 21 до",
                                      "женщины: с 21 до"],
                      initialFeePercentageString: "20% - 99%",
                      initialFeeLowerBound: 20,
                      initialFeeUpperBound: 99,
                      maxCredit: 175000000,
                      continuousWorkExperience: "6 месяцев",
                      
                      minTerm: 6, maxTerm: 20,
                      
                      feePercent: 2.5, feeInitial: 10000,

                      properties: ["Первичное жилье (квартира и дом)", "Покупка вторичного жилья"],
                      whereToApply: ["Altynbank"],
                      details: ["с полным подтверждением дохода"],
                      detailsColors: [ColorName.orange.rawValue ],
                      detailsFull: "с полным подтверждением доходов\nКредиты на покупку недвижимости в городах Алматы, Нур-Султан(в радиусе 30 км) от города, Атырау и Актау с требованием полного подтверждения доходов",
                      imageName: ImageName.altynBank.rawValue),
    

        MortgageModel(id: 2,
                      name: "Ипотека от Altynbank",
                      AEIR: 18,
                      firstStageRate: 16,
                      ageOfBorrower: ["мужчины: с 21 до",
                                      "женщины: с 21 до"],
                      initialFeePercentageString: "20% - 99%",
                      initialFeeLowerBound: 20,
                      initialFeeUpperBound: 99,
                      maxCredit: 175000000,
                      continuousWorkExperience: "6 месяцев",
                      
                      minTerm: 6, maxTerm: 20,
                      feePercent: 2.5, feeInitial: 10000,
                      
                      properties: ["Первичное жилье (квартира и дом)", "Покупка вторичного жилья"],
                      whereToApply: ["Altynbank"],
                      details: ["с частичным подтверждением доходов"],
                      detailsColors: [ColorName.orange.rawValue],
                      detailsFull: "с частичным подтверждением\nКредиты на покупку недвижимости в городах Алматы, Нур-Султан(в радиусе 30 км) от города, Атырау и Актау с возможностью частичного подтверждения доходов",
                      imageName: ImageName.altynBank.rawValue),
        
        MortgageModel(id: 3,
                      name: "Ипотека от Bank RBK",
                      AEIR: 16,
                      firstStageRate: 16,
                      ageOfBorrower: ["мужчины: с 21 до",
                                      "женщины: с 21 до"],
                      initialFeePercentageString: "50% - 99%",
                      initialFeeLowerBound: 50,
                      initialFeeUpperBound: 99,
                      maxCredit: 75000000,
                      continuousWorkExperience: "6 месяцев",
                      
                      minTerm: 6, maxTerm: 15,
                      feePercent: 2, feeInitial: 0,
                      
                      properties: ["Первичное жилье (квартира и дом)", "Покупка вторичного жилья"],
                      whereToApply: ["Bank RBK"],
                      details: ["с частичным подтверждением доходов"],
                      detailsColors: [ColorName.orange.rawValue],
                      detailsFull: "с частичным подтверждением доходов\n«Нужный кредит «Ипотека» с частичным подтверждением доходов",
                      imageName: ImageName.bankRBK.rawValue),
     
        MortgageModel(id: 4,
                      name: "Ипотека от Halykbank",
                      AEIR: 17.9,
                      firstStageRate: 17,
                      ageOfBorrower: ["мужчины: с 21 до",
                                      "женщины: с 21 до"],
                      initialFeePercentageString: "50% - 99%",
                      initialFeeLowerBound: 50,
                      initialFeeUpperBound: 99,
                      maxCredit: 150000000,
                      continuousWorkExperience: "6 месяцев",
                      
                      minTerm: 6, maxTerm: 20,
                      feePercent: 1, feeInitial: 20000,
                      
                      properties: ["Первичное жилье (квартира и дом)",
                                   "Покупка вторичного жилья",
                                   "На постройку дома",
                                   "На ремонт",
                                   "На покупку участка"],
                      whereToApply: ["Народный банк Казахстана"],
                      details: ["без подтверждения дохода"],
                      detailsColors: [ColorName.orange.rawValue],
                      detailsFull: "без подтверждения дохода\nИпотека от Halykbank без подтверждения дохода",
                      imageName: ImageName.halykBank.rawValue),
        
        MortgageModel(id: 5,
                      name: "Ипотека от Nurbank",
                      AEIR: 15,
                      firstStageRate: 15,
                      ageOfBorrower: ["мужчины: с 21 до",
                                      "женщины: с 21 до"],
                      initialFeePercentageString: "35% - 99%",
                      initialFeeLowerBound: 35,
                      initialFeeUpperBound: 99,
                      maxCredit: 50000000,
                      continuousWorkExperience: "6 месяцев",
                      
                      minTerm: 6, maxTerm: 20,
                      feePercent: 2, feeInitial: 10000,
                      
                      properties: ["Первичное жилье (квартира и дом)", "Покупка вторичного жилья"],
                      whereToApply: ["Nurbank"],
                      details: ["первичное жилье", "вторичное жилье"],
                      detailsColors: [ColorName.purple.rawValue, ColorName.purple.rawValue],
                      detailsFull: "для приобретения жилья на первичном и вторичном рынке\nИпотечные кредиты физическим лицам-резидентам РК на: приобретение недвижимого имущества; рефинансирование ранее выданных ипотечных кредитов",
                      imageName: ImageName.nurBank.rawValue),
        
        MortgageModel(id: 6,
                      name: "Ипотека от Bank RBK",
                      AEIR: 14.5,
                      firstStageRate: 14.5,
                      ageOfBorrower: ["мужчины: с 21 до",
                                       "женщины: с 21 до"],
                      initialFeePercentageString: "35% - 99%",
                      initialFeeLowerBound: 35,
                      initialFeeUpperBound: 99,
                      maxCredit: 75000000,
                      continuousWorkExperience: "6 месяцев",
                      
                      minTerm: 6, maxTerm: 15,
                      feePercent: 2, feeInitial: 0,
                      
                      properties:  ["Первичное жилье (квартира и дом)", "Покупка вторичного жилья"],
                      whereToApply: ["Bank RBK"],
                      details: ["с полным подтверждением дохода"],
                      detailsColors: [ColorName.orange.rawValue],
                      detailsFull: "с полным подтверждением доходов\n«Нужный кредит «Ипотека» с полным подтверждением доходов",
                      imageName: ImageName.bankRBK.rawValue),
        
        MortgageModel(id: 7,
                      name: "Ипотека от АТФ Банка",
                      AEIR: 17.3,
                      firstStageRate: 16,
                      ageOfBorrower: ["мужчины: с 21 до",
                                      "женщины: с 21 до"],
                      initialFeePercentageString: "35% - 99%",
                      initialFeeLowerBound: 35,
                      initialFeeUpperBound: 99,
                      maxCredit: 100000000,
                      continuousWorkExperience: "6 месяцев",
                      
                      minTerm: 6, maxTerm: 20,
                      feePercent: 2, feeInitial: 0,
                      
                      properties: ["Первичное жилье (квартира и дом)", "Покупка вторичного жилья"],
                      whereToApply: ["AТФБанк"],
                      details: ["с частичным подтверждением доходов"],
                      detailsColors: [ColorName.orange.rawValue],
                      detailsFull: "с частичным подтверждением доходов\nИпотека от АТФБанка с частичным подтверждением доходов",
                      imageName: ImageName.atfBank.rawValue),
        
        MortgageModel(id: 8,
                      name: "Ипотека от АТФ Банка",
                      AEIR: 17.3,
                      firstStageRate: 16,
                      ageOfBorrower: ["мужчины: с 21 до",
                                      "женщины: с 21 до"],
                      initialFeePercentageString: "20% - 99%",
                      initialFeeLowerBound: 20,
                      initialFeeUpperBound: 99,
                      maxCredit: 100000000,
                      continuousWorkExperience: "6 месяцев",
                      
                      minTerm: 6, maxTerm: 15,
                      feePercent: 1, feeInitial: 0,
                      
                      properties: ["Первичное жилье (квартира и дом)", "Покупка вторичного жилья"],
                      whereToApply: ["АТФБанк"],
                      details: ["с полным подтверждением дохода"],
                      detailsColors: [ColorName.orange.rawValue],
                      detailsFull: "с полным подтверждением доходов\nИпотека от АТФ Банка с полным подтверждением доходов",
                      imageName: ImageName.atfBank.rawValue),
        
        MortgageModel(id: 9,
                      name: "Ипотека от Fortebank",
                      AEIR: 18.5,
                      firstStageRate: 18.5,
                      ageOfBorrower: ["мужчины: с 21 до",
                                      "женщины: с 21 до"],
                      initialFeePercentageString: "50% - 99%",
                      initialFeeLowerBound: 50,
                      initialFeeUpperBound: 99,
                      maxCredit: 150000000,
                      continuousWorkExperience: "6 месяцев",
                      
                      minTerm: 6, maxTerm: 10,
                      feePercent: 0.49, feeInitial: 1.99,
                      
                      properties: ["Первичное жилье (квартира и дом)",
                                   "Покупка вторичного жилья",
                                   "На покупку дома"],
                      whereToApply: ["ForteBank"],
                      details: ["без подтверждения дохода"],
                      detailsColors: [ColorName.orange.rawValue],
                      detailsFull: "без подтверждения дохода\nИпотека от Fortebank без подтверждения дохода",
                      imageName: ImageName.forteBank.rawValue),
        
        MortgageModel(id: 10,
                      name: "Ипотека от Fortebank",
                      AEIR: 17.5,
                      firstStageRate: 15,
                      ageOfBorrower: ["мужчины: с 21 до",
                                      "женщины: с 21 до"],
                      initialFeePercentageString: "50% - 99%",
                      initialFeeLowerBound: 50,
                      initialFeeUpperBound: 99,
                      maxCredit: 150000000,
                      continuousWorkExperience: "6 месяцев",
                      
                      minTerm: 6, maxTerm: 20,
                      feePercent: 0.49, feeInitial: 1.99,
                      
                      properties: ["Первичное жилье (квартира и дом)",
                                   "Покупка вторичного жилья",
                                   "На покупку дома"],
                      whereToApply: ["ForteBank"],
                      details: ["с полным подтверждением дохода"],
                      detailsColors: [ColorName.orange.rawValue],
                      detailsFull: "с полным подтверждением дохода\nИпотека от Fortebank с подтверждением дохода",
                      imageName: ImageName.forteBank.rawValue),

        
        MortgageModel(id: 11,
                      name: "Жилищный кредит от Сбербанка",
                      AEIR: 15.56,
                      firstStageRate: 15,
                      ageOfBorrower: ["мужчины: с 21 до",
                                      "женщины: с 21 до"],
                      initialFeePercentageString: "0%",
                      initialFeeLowerBound: 0,
                      initialFeeUpperBound: 0,
                      maxCredit: 150000000,
                      continuousWorkExperience: "6 месяцев",
                      
                      minTerm: 6, maxTerm: 20,
                      feePercent: 0, feeInitial: 0,
                      
                      properties: ["Первичное жилье (квартира и дом)",
                                   "Покупка вторичного жилья",
                                   "На покупку дома"],
                      whereToApply: ["Сбербанк"],
                      details: ["без первоначального взноса"],
                      detailsColors: [ColorName.orange.rawValue],
                      detailsFull: "без первоначального взноса\nЖилищный кредит от Сбербанка без первоначального взноса",
                      imageName: ImageName.sberbank.rawValue),
        
        MortgageModel(id: 12,
                      name: "Жилищный кредит от Сбербанка",
                      AEIR: 17.22,
                      firstStageRate: 16,
                      ageOfBorrower: ["мужчины: с 21 до",
                                      "женщины: с 21 до"],
                      initialFeePercentageString: "50% - 99%",
                      initialFeeLowerBound: 50,
                      initialFeeUpperBound: 99,
                      maxCredit: 150000000,
                      continuousWorkExperience: "6 месяцев",
                      
                      minTerm: 6, maxTerm: 15,
                      feePercent: 0, feeInitial: 0,
                      
                      properties: ["Первичное жилье (квартира и дом)",
                                   "Покупка вторичного жилья",
                                   "На покупку дома"],
                      whereToApply: ["Сбербанк"],
                      details: ["с частичным подтверждением доходов"],
                      detailsColors: [ColorName.orange.rawValue],
                      detailsFull: "с частичным подтверждением доходов\nЖилищный кредит от Сбербанка с частичным подтверждением доходов",
                      imageName: ImageName.sberbank.rawValue),
        
        
        MortgageModel(id: 13,
                      name: "Жилищный кредит от Сбербанка",
                      AEIR: 15.56,
                      firstStageRate: 15,
                      ageOfBorrower: ["мужчины: с 21 до",
                                      "женщины: с 21 до"],
                      initialFeePercentageString: "30% - 99%",
                      initialFeeLowerBound: 50,
                      initialFeeUpperBound: 99,
                      maxCredit: 150000000,
                      continuousWorkExperience: "6 месяцев",
                      
                      minTerm: 6, maxTerm: 20,
                      feePercent: 0, feeInitial: 0,
                      
                      properties: ["Первичное жилье (квартира и дом)",
                                   "Покупка вторичного жилья",
                                   "На покупку дома"],
                      whereToApply: ["Сбербанк"],
                      details: ["с полным подтверждением доходов"],
                      detailsColors: [ColorName.orange.rawValue],
                      detailsFull: "с полным подтверждением доходов\nЖилищный кредит от Сбербанка с полным подтверждением доходов",
                      imageName: ImageName.sberbank.rawValue),
        
        MortgageModel(id: 14,
                      name: "Ипотека от Halykbank",
                      AEIR: 17.9,
                      firstStageRate: 17,
                      ageOfBorrower: ["мужчины: с 21 до",
                                      "женщины: с 21 до"],
                      initialFeePercentageString: "30% - 99%",
                      initialFeeLowerBound: 30,
                      initialFeeUpperBound: 99,
                      maxCredit: 150000000,
                      continuousWorkExperience: "6 месяцев",
                      
                      minTerm: 6, maxTerm: 20,
                      feePercent: 1, feeInitial: 20000,
                      
                      properties: ["Первичное жилье (квартира и дом)",
                                   "Покупка вторичного жилья",
                                   "На постройку дома",
                                   "На ремонт",
                                   "На покупку участка"],
                      whereToApply: ["Народный банк Казахстана"],
                      details: ["с полным подтверждением дохода"],
                      detailsColors: [ColorName.orange.rawValue],
                      detailsFull: "с подтверждением дохода\nИпотека от Halykbank с подтверждением дохода",
                      imageName: ImageName.halykBank.rawValue),
        
        MortgageModel(id: 15,
                      name: "Ипотека от Halykbank",
                      AEIR: 17.9,
                      firstStageRate: 17,
                      ageOfBorrower: ["мужчины: с 21 до",
                                      "женщины: с 21 до"],
                      initialFeePercentageString: "0%",
                      initialFeeLowerBound: 0,
                      initialFeeUpperBound: 0,
                      maxCredit: 150000000,
                      continuousWorkExperience: "6 месяцев",
                      
                      minTerm: 6, maxTerm: 20,
                      feePercent: 1, feeInitial: 20000,
                      
                      properties: ["Первичное жилье (квартира и дом)",
                                   "Покупка вторичного жилья",
                                   "На постройку дома",
                                   "На ремонт",
                                   "На покупку участка"],
                      whereToApply: ["Народный банк Казахстана"],
                      details: ["с полным подтверждением дохода", "без первоначального взноса"],
                      detailsColors: [ColorName.orange.rawValue, ColorName.orange.rawValue],
                      detailsFull: "с подтверждением дохода без первоначального взноса\nИпотека от Halykbank с подтверждением дохода без первоначального взноса",
                      imageName: ImageName.halykBank.rawValue),

        MortgageModel(id: 0, // booyababybowdown
                      name: "\"Женил\" от \"Жилстройсбербанка и BI Group\"",
                      AEIR: 7.4,
                      firstStageRate: 7,
                      ageOfBorrower: ["мужчины: с 21 до",
                                      "женщины: с 21 до"],
                      initialFeePercentageString: "36% - 99%",
                      initialFeeLowerBound: 36,
                      initialFeeUpperBound: 99,
                      maxCredit: 90000000,
                      continuousWorkExperience: "7 месяцев",
                      
                      minTerm: 6, maxTerm: 25,
                      feePercent: 3, feeInitial: 0,
                      
                      properties: ["Первичное жилье (квартира и дом)"],
                      whereToApply: ["Жилстройсбербанк"],
                      details: ["первичное жилье", "для клиентов BI Group", "оформляется второй кредит по \"Стандартному\" займу"],
                      detailsColors: [ColorName.purple.rawValue, ColorName.blue.rawValue, ColorName.orange.rawValue],
                      detailsFull: "оформляется второй кредит по \"Стандарному\" займу\nПрограмма предназначена клиентам BI Group, у которых есть накопления в Жилстройсбербанке. Если клиент имеет на счету 36% от стоимости жилья, то он может оформить данную ипотеку. Особенность: открывается дополнительный второй счет (оформляется второй кредит).",
                      imageName: ImageName.halykBank.rawValue),

        MortgageModel(id: 17,
                      name: "\"Женил\" от \"Жилстройсбербанка и BI Group\"",
                      AEIR: 7.4,
                      firstStageRate: 7,
                      ageOfBorrower: ["мужчины: с 21 до",
                                       "женщины: с 21 до"],
                      initialFeePercentageString: "36% - 100%",
                      initialFeeLowerBound: 36,
                      initialFeeUpperBound: 100,
                      maxCredit: 90000000,
                      continuousWorkExperience: "7 месяцев",
                      
                      minTerm: 6, maxTerm: 9,
                      feePercent: 3, feeInitial: 0,
                      
                      properties: ["Первичное жилье (квартира и дом)"],
                      whereToApply: ["Жилстройсбербанк"],
                      details: ["первичное жилье", "для клиентов BI Group", "оформляется второй кредит по займу \"Женил\""],
                      detailsColors: [ColorName.purple.rawValue, ColorName.blue.rawValue, ColorName.orange.rawValue],
                      detailsFull: "оформляется второй кредит по займу \"Женил\"\nПрограмма предназначена клиентам BI Group, у которых есть накопления в Жилстройсбербанке. Если клиент имеет на счету 36% от стоимости жилья, то он может оформить данную ипотеку. Особенность: открывается дополнительный второй счет (оформляется второй кредит).",
                      imageName: ImageName.zhilStroiSberBank.rawValue),

        MortgageModel(id: 18,
                      name: "\"Стандартный\" заем от \"Жилстройсбербанка и BI Group\"",
                      AEIR: 7.4,
                      firstStageRate: 7,
                      ageOfBorrower: ["мужчины: с 21 до",
                                       "женщины: с 21 до"],
                      initialFeePercentageString: "36% - 100%",
                      initialFeeLowerBound: 36,
                      initialFeeUpperBound: 100,
                      maxCredit: 90000000,
                      continuousWorkExperience: "7 месяцев",
                      
                      minTerm: 6, maxTerm: 25,
                      feePercent: 3, feeInitial: 0,
                      
                      properties: ["Первичное жилье (квартира и дом)"],
                      whereToApply: ["Жилстройсбербанк"],
                      details: ["первичное жилье", "для клиентов BI Group", "оформляется второй кредит по займу \"Женил\""],
                      detailsColors: [ColorName.purple.rawValue, ColorName.blue.rawValue, ColorName.orange.rawValue],
                      detailsFull: "оформляется второй кредит по займу \"Женил\"\nПрограмма предназначена клиентам BI Group, у которых есть накопления в Жилстройсбербанке. Если клиент имеет на счету 36% от стоимости жилья, то он может оформить данную ипотеку. Особенность: открывается дополнительный второй счет (оформляется второй кредит).",
                      imageName: ImageName.zhilStroiSberBank.rawValue),
        
        MortgageModel(id: 19,
                      name: "\"Стандартный\" заем от \"Жилстройсбербанка и BI Group\"",
                      AEIR: 7.4,
                      firstStageRate: 7,
                      ageOfBorrower: ["мужчины: с 21 до",
                                       "женщины: с 21 до"],
                      initialFeePercentageString: "36% - 100%",
                      initialFeeLowerBound: 36,
                      initialFeeUpperBound: 100,
                      maxCredit: 90000000,
                      continuousWorkExperience: "7 месяцев",
                      
                      minTerm: 6, maxTerm: 25,
                      feePercent: 3, feeInitial: 0,
                      
                      properties: ["Первичное жилье (квартира и дом)"],
                      whereToApply: ["Жилстройсбербанк"],
                      details: ["первичное жилье", "для клиентов BI Group", "оформляется второй кредит по \"Стандартному\" займу"],
                      detailsColors: [ColorName.purple.rawValue, ColorName.blue.rawValue, ColorName.orange.rawValue],
                      detailsFull: "оформляется второй кредит по \"Стандарному\" займу\nПрограмма предназначена клиентам BI Group, у которых есть накопления в Жилстройсбербанке. Если клиент имеет на счету 36% от стоимости жилья, то он может оформить данную ипотеку. Особенность: открывается дополнительный второй счет (оформляется второй кредит).",
                      imageName: ImageName.zhilStroiSberBank.rawValue),

        MortgageModel(id: 20,
                      name: "\"Жас отбасы\" с типом займа \"Жеңіл\"",
                      AEIR: 6,
                      firstStageRate: 6,
                      ageOfBorrower: ["мужчины: с 21 до",
                                       "женщины: с 21 до"],
                      initialFeePercentageString: "50% - 100%",
                      initialFeeLowerBound: 50,
                      initialFeeUpperBound: 100,
                      maxCredit: 90000000,
                      continuousWorkExperience: "6 месяцев",
                      
                      minTerm: 6, maxTerm: 25,
                      feePercent: 0, feeInitial: 0,
                      
                      properties: ["Первичное жилье (квартира и дом)",
                                   "Покупка вторичного жилья",
                                   "На покупку дома"],
                      whereToApply: ["Жилстройсбербанк"],
                      details: ["программа с накоплением депозита", "для состоящих в браке не более 3 лет"],
                      detailsColors: [ColorName.green.rawValue, ColorName.blue.rawValue],
                      detailsFull: "Промежуточный заем с полным подтверждением дохода\nИпотека для молодых семей, имеющих 50% от стоимости квартиры",
                      imageName: ImageName.zhilStroiSberBank.rawValue),

        MortgageModel(id: 21,
                      name: "Ипотека \"Орда\"",
                      AEIR: 12,
                      firstStageRate: 12,
                      ageOfBorrower: ["мужчины: с 21 до 63",
                                      "женщины: с 21 до 63"],
                      initialFeePercentageString: "0%",
                      initialFeeLowerBound: 0,
                      initialFeeUpperBound: 0,
                      maxCredit: 65000000,
                      continuousWorkExperience: "6 месяцев",
                      
                      minTerm: 6, maxTerm: 20,
                      feePercent: 1, feeInitial: 0,
                      
                      properties: ["Первичное жилье (квартира и дом)",
                                   "Покупка вторичного жилья"],
                      whereToApply: ["Банк ЦентрКредит", "Евразийский Банк", "Jusanbank", "Кассанова"],
                      details: ["с полным подтверждением дохода", "без первоначального взноса"],
                      detailsColors: [ColorName.orange.rawValue, ColorName.orange.rawValue],
                      detailsFull: "с полным подтверждением дохода без первоначального взноса\nИпотека \"Орда\" от АО \"КИК\" с полным подтверждением дохода без первоначального взноса",
                      imageName: ImageName.orda.rawValue),
        
        MortgageModel(id: 22,
                      name: "Ипотека \"Орда\"",
                      AEIR: 12,
                      firstStageRate: 12,
                      ageOfBorrower: ["мужчины: с 21 до 63",
                                      "женщины: с 21 до 63"],
                      initialFeePercentageString: "30% - 99%",
                      initialFeeLowerBound: 30,
                      initialFeeUpperBound: 99,
                      maxCredit: 65000000,
                      continuousWorkExperience: "6 месяцев",
                      
                      minTerm: 6, maxTerm: 20,
                      feePercent: 1, feeInitial: 0,
                      
                      properties: ["Первичное жилье (квартира и дом)",
                                   "Покупка вторичного жилья"],
                      whereToApply: ["Банк ЦентрКредит", "Евразийский Банк", "Jusanbank", "Кассанова"],
                      details: ["с полным подтверждением дохода"],
                      detailsColors: [ColorName.orange.rawValue],
                      detailsFull: "с полным подтверждением дохода\nИпотека \"Орда\" от АО \"КИК\" с полным подтверждением дохода",
                      imageName: ImageName.orda.rawValue),

        MortgageModel(id: 23,
                      name: "Ипотека \"Орда\" от АО \"КИК\"",
                      AEIR: 14,
                      firstStageRate: 14,
                      ageOfBorrower: ["мужчины: с 21 до 63",
                                      "женщины: с 21 до 63"],
                      initialFeePercentageString: "50% - 99%",
                      initialFeeLowerBound: 50,
                      initialFeeUpperBound: 99,
                      maxCredit: 65000000,
                      continuousWorkExperience: "6 месяцев",
                      
                      minTerm: 6, maxTerm: 20,
                      feePercent: 1, feeInitial: 0,
                      
                      properties: ["Первичное жилье (квартира и дом)",
                                   "Покупка вторичного жилья"],
                      whereToApply: ["Банк ЦентрКредит", "Евразийский Банк", "Jusanbank", "Кассанова"],
                      details: ["с частичным подтверждением доходов"],
                      detailsColors: [ColorName.orange.rawValue],
                      detailsFull: "с частичным подтверждением дохода\nИпотека \"Орда\" от АО \"КИК\" с частичным подтверждением дохода",
                      imageName: ImageName.orda.rawValue),

        MortgageModel(id: 24,
                      name: "Ипотека \"Орда\" от АО \"КИК\"",
                      AEIR: 14,
                      firstStageRate: 14,
                      ageOfBorrower: ["мужчины: с 21 до 63",
                                      "женщины: с 21 до 63"],
                      initialFeePercentageString: "0%",
                      initialFeeLowerBound: 0,
                      initialFeeUpperBound: 0,
                      maxCredit: 65000000,
                      continuousWorkExperience: "6 месяцев",
                      
                      minTerm: 6, maxTerm: 20,
                      feePercent: 1, feeInitial: 0,
                      
                      properties: ["Первичное жилье (квартира и дом)",
                                   "Покупка вторичного жилья"],
                      whereToApply: ["Банк ЦентрКредит", "Евразийский Банк", "Jusanbank", "Кассанова"],
                      details: ["с частичным подтверждением доходов", "без первоначального взноса"],
                      detailsColors: [ColorName.orange.rawValue, ColorName.orange.rawValue],
                      detailsFull: "с частичным подтверждением дохода\nИпотека \"Орда\" от АО \"КИК\" с частичным подтверждением дохода",
                      imageName: ImageName.orda.rawValue),

        
        MortgageModel(id: 25, // 1
                      name: "\"Женил\" промежуточный заем для \"Свой дом\"",
                      AEIR: 7,
                      firstStageRate: 7,
                      ageOfBorrower: ["мужчины: с 21",
                                      "женщины: с 21"],
                      initialFeePercentageString: "50% - 100%",
                      initialFeeLowerBound: 50,
                      initialFeeUpperBound: 99,
                      maxCredit: 90000000,
                      continuousWorkExperience: "6 месяцев",
                      
                      minTerm: 6, maxTerm: 25,
                      feePercent: 0, feeInitial: 0,
                      
                      properties: ["Первичное жилье (квартира и дом)"],
                      whereToApply: ["Жилстройсбербанк"],
                      details: ["для покупки на этапе строительства без дополнительного залога"],
                      detailsColors: [ColorName.purple.rawValue, ColorName.purple.rawValue],
                      detailsFull: "для покупки первичного жилья без дополнительного залога\nСобственная программа Жилстройсбербанка, нацеленная на предоставление жилья в новостройках по цене ниже рыночной.",
                      imageName: ImageName.zhilStroiSberBank.rawValue),
        
        MortgageModel(id: 26, // 2
                      name: "\"Женил\" для первичного жилья",
                      AEIR: 7.4,
                      firstStageRate: 7,
                      ageOfBorrower: ["мужчины: с 21",
                                      "женщины: с 21"],
                      initialFeePercentageString: "50% - 100%",
                      initialFeeLowerBound: 50,
                      initialFeeUpperBound: 100,
                      maxCredit: 90000000,
                      continuousWorkExperience: "7 месяцев",
                      
                      minTerm: 6, maxTerm: 25,
                      feePercent: 0, feeInitial: 0,
                      
                      properties: ["Первичное жилье (квартира и дом)"],
                      whereToApply: ["Жилстройсбербанк"],
                      details: ["с полным подтверждением дохода"],
                      detailsColors: [ColorName.orange.rawValue],
                      detailsFull: "Промежуточный заем с полным подтверждением дохода\nИпотека для вкладчиков ЖССБ, быстро накопивших 50% от стоимости жилья",
                      imageName: ImageName.zhilStroiSberBank.rawValue),

        MortgageModel(id: 27, // 3
                      name: "\"Женил\" для вторичного жилья",
                      AEIR: 8.5,
                      firstStageRate: 8.5,
                      ageOfBorrower: ["мужчины: с 21",
                                      "женщины: с 21"],
                      initialFeePercentageString: "50% - 100%",
                      initialFeeLowerBound: 50,
                      initialFeeUpperBound: 100,
                      maxCredit: 90000000,
                      continuousWorkExperience: "7 месяцев",
                      
                      minTerm: 6, maxTerm: 25,
                      feePercent: 0, feeInitial: 0,
                      
                      properties: ["Покупка вторичного жилья"],
                      whereToApply: ["Жилстройсбербанк"],
                      details: ["с полным подтверждением дохода"],
                      detailsColors: [ColorName.orange.rawValue],
                      detailsFull: "Промежуточный заем с полным подтверждением дохода\nИпотека для вкладчиков ЖССБ, быстро накопивших 50% от стоимости жилья",
                      imageName: ImageName.zhilStroiSberBank.rawValue),

        MortgageModel(id: 28, // 4
                      name: "\"Женил 2\" промежуточный заем для \"Свой дом\"",
                      AEIR: 7,
                      firstStageRate: 7,
                      ageOfBorrower: ["мужчины: с 21",
                                      "женщины: с 21"],
                      initialFeePercentageString: "50% - 100%",
                      initialFeeLowerBound: 50,
                      initialFeeUpperBound: 100,
                      maxCredit: 90000000,
                      continuousWorkExperience: "6 месяцев",
                      
                      minTerm: 6, maxTerm: 25,
                      feePercent: 0, feeInitial: 0,
                      
                      properties: ["Первичное жилье (квартира и дом)"],
                      whereToApply: ["Жилстройсбербанк"],
                      details: ["для покупки на этапе строительства без дополнительного залога"],
                      detailsColors: [ColorName.purple.rawValue],
                      detailsFull: "для покупки первичного жилья без дополнительного залога\nСобственная программа Жилстройсбербанка, нацеленная на предоставление жилья в новостройках по цене ниже рыночной.",
                      imageName: ImageName.zhilStroiSberBank.rawValue),

        MortgageModel(id: 29, // 5
                      name: "\"Женил 2\" для первичного жилья",
                      AEIR: 7.4,
                      firstStageRate: 7,
                      ageOfBorrower: ["мужчины: с 21",
                                      "женщины: с 21"],
                      initialFeePercentageString: "50% - 100%",
                      initialFeeLowerBound: 50,
                      initialFeeUpperBound: 100,
                      maxCredit: 90000000,
                      continuousWorkExperience: "7 месяцев",
                      
                      minTerm: 6, maxTerm: 25,
                      feePercent: 0, feeInitial: 0,
                      
                      properties: ["Первичное жилье (квартира и дом)"],
                      whereToApply: ["Жилстройсбербанк"],
                      details: ["с полным подтверждением дохода"],
                      detailsColors: [ColorName.orange.rawValue],
                      detailsFull: "Промежуточный заем с полным подтверждением дохода\nИпотека для вкладчиков ЖССБ, быстро накопивших 50% от стоимости жилья",
                      imageName: ImageName.zhilStroiSberBank.rawValue),

        MortgageModel(id: 30, // 6
                      name: "\"Женил 2\" для вторичного жилья",
                      AEIR: 8,
                      firstStageRate: 8,
                      ageOfBorrower: ["мужчины: с 21",
                                      "женщины: с 21"],
                      initialFeePercentageString: "50% - 100%",
                      initialFeeLowerBound: 50,
                      initialFeeUpperBound: 100,
                      maxCredit: 90000000,
                      continuousWorkExperience: "7 месяцев",
                      
                      minTerm: 6, maxTerm: 25,
                      feePercent: 0, feeInitial: 0,
                      
                      properties: ["Покупка вторичного жилья"],
                      whereToApply: ["Жилстройсбербанк"],
                      details: ["с полным подтверждением дохода"],
                      detailsColors: [ColorName.orange.rawValue],
                      detailsFull: "Промежуточный заем с полным подтверждением дохода\nИпотека для вкладчиков ЖССБ, быстро накопивших 50% от стоимости жилья",
                      imageName: ImageName.zhilStroiSberBank.rawValue),

        MortgageModel(id: 31, // 7
                      name: "\"Стандартный\" промежуточный заем для \"Свой дом\"",
                      AEIR: 7,
                      firstStageRate: 7,
                      ageOfBorrower: ["мужчины: с 21",
                                      "женщины: с 21"],
                      initialFeePercentageString: "50% - 100%",
                      initialFeeLowerBound: 50,
                      initialFeeUpperBound: 100,
                      maxCredit: 90000000,
                      continuousWorkExperience: "6 месяцев",
                      
                      minTerm: 6, maxTerm: 25,
                      feePercent: 0, feeInitial: 0,
                      
                      properties: ["Первичное жилье (квартира и дом)"],
                      whereToApply: ["Жилстройсбербанк"],
                      details: ["для покупки на этапе строительства без дополнительного залога"],
                      detailsColors: [ColorName.purple.rawValue],
                      detailsFull: "для покупки первичного жилья без дополнительного залога\nСобственная программа Жилстройсбербанка, нацеленная на предоставление жилья в новостройках по цене ниже рыночной.",
                      imageName: ImageName.zhilStroiSberBank.rawValue),

        MortgageModel(id: 32, // 8
                      name: "\"Стандартный\" для первичного жилья",
                      AEIR: 7.4,
                      firstStageRate: 7,
                      ageOfBorrower: ["мужчины: с 21",
                                      "женщины: с 21"],
                      initialFeePercentageString: "50% - 100%",
                      initialFeeLowerBound: 50,
                      initialFeeUpperBound: 100,
                      maxCredit: 90000000,
                      continuousWorkExperience: "7 месяцев",
                      
                      minTerm: 6, maxTerm: 25,
                      feePercent: 0, feeInitial: 0,
                      
                      properties: ["Первичное жилье (квартира и дом)"],
                      whereToApply: ["Жилстройсбербанк"],
                      details: ["с полным подтверждением дохода"],
                      detailsColors: [ColorName.orange.rawValue],
                      detailsFull: "Промежуточный заем с полным подтверждением дохода\nИпотека для вкладчиков ЖССБ, быстро накопивших 50% от стоимости жилья",
                      imageName: ImageName.zhilStroiSberBank.rawValue),

        MortgageModel(id: 33, // 9
                      name: "\"Стандартный\" для вторичного жилья",
                      AEIR: 7.5,
                      firstStageRate: 7.5,
                      ageOfBorrower: ["мужчины: с 21",
                                      "женщины: с 21"],
                      initialFeePercentageString: "50% - 100%",
                      initialFeeLowerBound: 50,
                      initialFeeUpperBound: 100,
                      maxCredit: 90000000,
                      continuousWorkExperience: "7 месяцев",
                      
                      minTerm: 6, maxTerm: 25,
                      feePercent: 0, feeInitial: 0,
                      
                      properties: ["Покупка вторичного жилья"],
                      whereToApply: ["Жилстройсбербанк"],
                      details: ["с полным подтверждением дохода"],
                      detailsColors: [ColorName.orange.rawValue],
                      detailsFull: "Промежуточный заем с полным подтверждением дохода\nИпотека для вкладчиков ЖССБ, быстро накопивших 50% от стоимости жилья",
                      imageName: ImageName.zhilStroiSberBank.rawValue),

        MortgageModel(id: 34, // 10
                      name: "Жилищный заем \"Баспана\"",
                      AEIR: 5,
                      firstStageRate: 5,
                      ageOfBorrower: ["мужчины: с 21",
                                      "женщины: с 21"],
                      initialFeePercentageString: "50% - 100%",
                      initialFeeLowerBound: 50,
                      initialFeeUpperBound: 100,
                      maxCredit: 100000000,
                      continuousWorkExperience: "7 месяцев",
                      
                      minTerm: 6, maxTerm: 25,
                      feePercent: 0, feeInitial: 0,
                      
                      properties: ["Первичное жилье (квартира и дом)",
                                   "Покупка вторичного жилья",
                                   "На постройку дома",
                                   "На ремонт",
                                   "На покупку участка"],
                      whereToApply: ["Жилстройсбербанк"],
                      details: ["программа с накоплением депозита", "для вкладчиков отбасы банк с достаточным оценочным показателем"],
                      detailsColors: [ColorName.green.rawValue, ColorName.green.rawValue],
                      detailsFull: "для вкладчиков ЖССБ с достаточным Оценочным показателем депозита\nЖилищный заем в рамках программы \"Баспана\", предоставляется только для вкладчиков ЖССБ",
                      imageName: ImageName.baspana.rawValue),

        MortgageModel(id: 35,
                      name: "Баспана ХИТ",
                      AEIR: 10.75,
                      firstStageRate: 10.75,
                      ageOfBorrower: ["мужчины: с 21 до 63",
                                      "женщины: с 21 до 63"],
                      initialFeePercentageString: "20% - 90%",
                      initialFeeLowerBound: 50,
                      initialFeeUpperBound: 100,
                      maxCredit: 35000000,
                      continuousWorkExperience: "6 месяцев",
                      
                      minTerm: 6, maxTerm: 15,
                      feePercent: 0, feeInitial: 0,
                      
                      properties: ["Первичное жилье (квартира и дом)",
                                   "Покупка вторичного жилья"],
                      whereToApply: ["Банк ЦентрКредит",
                                     "Сбербанк",
                                     "Евразийский Банк",
                                     "АТФБанк",
                                     "Jusanbank",
                                     "Bank RBK",
                                     "Народный банк Казахстана",
                                     "Forte Bank"],
                      details: ["вторичное жилье"],
                      detailsColors: [ColorName.purple.rawValue],
                      detailsFull: "для приобретения жилья на первичном и вторичном рынке\nИпотека для первички и вторички от оператора 72025",
                      imageName: ImageName.baspana.rawValue),

        MortgageModel(id: 36,
                      name: "72025",
                      AEIR: 7,
                      firstStageRate: 7,
                      ageOfBorrower: ["мужчины: с 21 до 63",
                                      "женщины: с 21 до 63"],
                      initialFeePercentageString: "20% - 95%",
                      initialFeeLowerBound: 20,
                      initialFeeUpperBound: 95,
                      maxCredit: 25000000,
                      continuousWorkExperience: "6 месяцев",
                      
                      minTerm: 6, maxTerm: 25,
                      feePercent: 0, feeInitial: 0,
                      
                      properties: ["Первичное жилье (квартира и дом)"],
                      whereToApply: ["Банк ЦентрКредит",
                                     "Сбербанк",
                                     "Евразийский Банк",
                                     "АТФБанк",
                                     "Jusanbank",
                                     "Bank RBK",
                                     "Народный банк Казахстана",
                                     "Forte Bank"],
                      details: ["первичное жилье"],
                      detailsColors: [ColorName.purple.rawValue],
                      detailsFull: "для приобретения жилья на первичном рынке (от застройщика) с требованиями отсутствия жилья\nCоциальная программа для граждан РК, предоставлляющая новые возможности покупки жилья на первичном рынке с доступными условиями кредитования.",
                      imageName: ImageName.zhilStroiSberBank.rawValue),

        
        //   unseeable mortgages
        MortgageModel(id: 37,
                      name: "\"Женил 2\" заем для \"Нұрлы жер\"",
                      AEIR: 5.2,
                      firstStageRate: 5,
                      ageOfBorrower: ["мужчины: с 21",
                                      "женщины: с 21"],
                      initialFeePercentageString: "50% - 100%",
                      initialFeeLowerBound: 50,
                      initialFeeUpperBound: 100,
                      maxCredit: 175000000,
                      continuousWorkExperience: "6 месяцев",
                      
                      minTerm: 6, maxTerm: 25,
                      feePercent: 0, feeInitial: 0,
                      
                      properties: ["Первичное жилье (квартира и дом)"],
                      whereToApply: ["Жилстройсбербанк"],
                      details: ["для очередников с депозитом в отбасы банк"],
                      detailsColors: [ColorName.green.rawValue],
                      detailsFull: "для покупки квартир, распределенных по конкурсу среди вкладчиков ЖССБ с обязательным подтверждением дохода\nГосударственная программа жилищно-коммунального развития «Нурлы жер» на 2020-2025 годы",
                      imageName: ImageName.nurlyZher.rawValue),
        
        MortgageModel(id: 38,
                      name: "\"Стандартный\" заем для \"Нұрлы жер\"",
                      AEIR: 5.2,
                      firstStageRate: 5,
                      ageOfBorrower: ["мужчины: с 21",
                                      "женщины: с 21"],
                      initialFeePercentageString: "50% - 100%",
                      initialFeeLowerBound: 50,
                      initialFeeUpperBound: 100,
                      maxCredit: 175000000,
                      continuousWorkExperience: "6 месяцев",
                      
                      minTerm: 6, maxTerm: 25,
                      feePercent: 0, feeInitial: 0,
                      
                      properties: ["Первичное жилье (квартира и дом)"],
                      whereToApply: ["Жилстройсбербанк"],
                      details: ["для очередников с депозитом в отбасы банк"],
                      detailsColors: [ColorName.green.rawValue],
                      detailsFull: "для покупки квартир, распределенных по конкурсу среди вкладчиков ЖССБ с обязательным подтверждением дохода\nГосударственная программа жилищно-коммунального развития «Нурлы жер» на 2020-2025 годы",
                      imageName: ImageName.nurlyZher.rawValue),

        MortgageModel(id: 39,
                      name: "Предварительный заем \"Нұрлы жер\"",
                      AEIR: 5.2,
                      firstStageRate: 5,
                      ageOfBorrower: ["мужчины: с 21",
                                      "женщины: с 21"],
                      initialFeePercentageString: "20% - 49%",
                      initialFeeLowerBound: 20,
                      initialFeeUpperBound: 49,
                      maxCredit: 175000000,
                      continuousWorkExperience: "6 месяцев",
                      
                      minTerm: 3, maxTerm: 19,
                      feePercent: 0, feeInitial: 0,
                      
                      properties: ["Первичное жилье (квартира и дом)"],
                      whereToApply: ["Жилстройсбербанк"],
                      details: ["для очередников с депозитом в отбасы банк"],
                      detailsColors: [ColorName.green.rawValue],
                      detailsFull: "для покупки квартир, распределенных по конкурсу среди вкладчиков ЖССБ с обязательным подтверждением дохода\nГосударственная программа жилищно-коммунального развития «Нурлы жер» на 2020-2025 годы",
                      imageName: ImageName.nurlyZher.rawValue),

        MortgageModel(id: 40,
                      name: "Жилищный заем по программе \"Нұрлы жер\"",
                      AEIR: 5.2,
                      firstStageRate: 5,
                      ageOfBorrower: ["мужчины: с 21",
                                      "женщины: с 21"],
                      initialFeePercentageString: "50% - 100%",
                      initialFeeLowerBound: 50,
                      initialFeeUpperBound: 100,
                      maxCredit: 175000000,
                      continuousWorkExperience: "6 месяцев",
                      
                      minTerm: 6, maxTerm: 25,
                      feePercent: 0, feeInitial: 0,
                      
                      properties: ["Первичное жилье (квартира и дом)"],
                      whereToApply: ["Жилстройсбербанк"],
                      details: ["для очередников с достаточным оценочным показателем в отбасы банк", "программа с накоплением депозита"],
                      detailsColors: [ColorName.green.rawValue, ColorName.green.rawValue],
                      detailsFull: "для покупки квартир, распределенных по конкурсу среди вкладчиков ЖССБ с требованием подтверждения дохода\nГосударственная программа жилищно-коммунального развития «Нурлы жер» на 2020-2025 годы",
                      imageName: ImageName.nurlyZher.rawValue),


        MortgageModel(id: -1,  // booyababybowdown
                      name: "\"Женил 2\" для военных",
                      AEIR: 6,
                      firstStageRate: 6,
                      ageOfBorrower: ["мужчины: с 21",
                                      "женщины: с 21"],
                      initialFeePercentageString: "50% - 100%",
                      initialFeeLowerBound: 50,
                      initialFeeUpperBound: 100,
                      maxCredit: 90000000,
                      continuousWorkExperience: "6 месяцев",
                      
                      minTerm: 6, maxTerm: 25,
                      feePercent: 0, feeInitial: 0,
                      
                      properties: ["Первичное жилье (квартира и дом)", "Покупка вторичного жилья"],
                      whereToApply: ["Жилстройсбербанк"],
                      details: ["военные", "с полным подтверждением дохода"],
                      detailsColors: [ColorName.blue.rawValue, ColorName.orange.rawValue],
                      detailsFull: "Промежуточный заем с полным подтверждением дохода\nИпотека для военных, имеющих 50% от стоимости квартиры",
                      imageName: ImageName.zhilStroiSberBank.rawValue),

        MortgageModel(id: 42,
                      name: "\"Женил\" для военных",
                      AEIR: 6,
                      firstStageRate: 6,
                      ageOfBorrower: ["мужчины: с 21",
                                      "женщины: с 21"],
                      initialFeePercentageString: "50% - 100%",
                      initialFeeLowerBound: 50,
                      initialFeeUpperBound: 100,
                      maxCredit: 90000000,
                      continuousWorkExperience: "6 месяцев",
                      
                      minTerm: 6, maxTerm: 25,
                      feePercent: 0, feeInitial: 0,
                      
                      properties: ["Первичное жилье (квартира и дом)", "Покупка вторичного жилья"],
                      whereToApply: ["Жилстройсбербанк"],
                      details: ["военные", "с полным подтверждением дохода"],
                      detailsColors: [ColorName.blue.rawValue, ColorName.orange.rawValue],
                      detailsFull: "Промежуточный заем с полным подтверждением дохода\nИпотека для военных, имеющих 50% от стоимости квартиры",
                      imageName: ImageName.zhilStroiSberBank.rawValue),

        MortgageModel(id: 43,
                      name: "\"Стандартный\" для военных",
                      AEIR: 6,
                      firstStageRate: 6,
                      ageOfBorrower: ["мужчины: с 21",
                                      "женщины: с 21"],
                      initialFeePercentageString: "50% - 100%",
                      initialFeeLowerBound: 50,
                      initialFeeUpperBound: 100,
                      maxCredit: 90000000,
                      continuousWorkExperience: "6 месяцев",
                      
                      minTerm: 6, maxTerm: 25,
                      feePercent: 0, feeInitial: 0,
                      
                      properties: ["Первичное жилье (квартира и дом)", "Покупка вторичного жилья"],
                      whereToApply: ["Жилстройсбербанк"],
                      details: ["военные", "с полным подтверждением дохода"],
                      detailsColors: [ColorName.blue.rawValue, ColorName.orange.rawValue],
                      detailsFull: "Промежуточный заем с полным подтверждением дохода\nИпотека для военных, имеющих 50% от стоимости квартиры",
                      imageName: ImageName.zhilStroiSberBank.rawValue),

        MortgageModel(id: 44,
                      name: "Военная ипотека",
                      AEIR: 8,
                      firstStageRate: 8,
                      ageOfBorrower: ["мужчины: с 21",
                                      "женщины: с 21"],
                      initialFeePercentageString: "15% - 49%",
                      initialFeeLowerBound: 100,
                      initialFeeUpperBound: 49,
                      maxCredit: 0,
                      continuousWorkExperience: "5 месяцев",
                      
                      minTerm: 6, maxTerm: 23,
                      feePercent: 0, feeInitial: 0,
                      
                      properties: ["Первичное жилье (квартира и дом)", "Покупка вторичного жилья"],
                      whereToApply: ["Жилстройсбербанк"],
                      details: ["для военных получивших смс"],
                      detailsColors: [ColorName.blue.rawValue],
                      detailsFull: "только для получивших СМС об участии в программе\nИпотека для военных, получивших SMS об участии в военной программе на 2020 год",
                      imageName: ImageName.zhilStroiSberBank.rawValue),
        
        MortgageModel(id: 45,
                      name: "\"Бақытты отбасы\"",
                      AEIR: 2.1,
                      firstStageRate: 2,
                      ageOfBorrower: ["мужчины: с 21",
                                      "женщины: с 21"],
                      initialFeePercentageString: "10% - 49%",
                      initialFeeLowerBound: 10,
                      initialFeeUpperBound: 49,
                      maxCredit: 15000000,
                      continuousWorkExperience: "6 месяцев",
                      
                      minTerm: 3, maxTerm: 19,
                      feePercent: 0, feeInitial: 0,
                      
                      properties: ["Первичное жилье (квартира и дом)", "Покупка вторичного жилья"],
                      whereToApply: ["Жилстройсбербанк"],
                      details: ["многодетные семьи", "неполные семьи", "семьи с ребенком-инвалидом"],
                      detailsColors: [ColorName.blue.rawValue, ColorName.blue.rawValue, ColorName.blue.rawValue],
                      detailsFull: "для лиц, состоящих в очереди на жилье как многодетная семья, неполная семья или семья, воспитывающая детей-инвалидов\nПрограмма кредитования семей с невысоким доходом для приобретения жилья",
                      imageName: ImageName.bakyttyOtbasy.rawValue),

        MortgageModel(id: 1,  // booyababybowdown
                      name: "\"5-10-20\"",
                      AEIR: 5,
                      firstStageRate: 5,
                      ageOfBorrower: ["мужчины: с 21 до 63",
                                      "женщины: с 21 до 58"],
                      initialFeePercentageString: "10% - 49%",
                      initialFeeLowerBound: 10,
                      initialFeeUpperBound: 49,
                      maxCredit: 18000000,
                      continuousWorkExperience: "0 месяцев",
                      
                      minTerm: 3, maxTerm: 19,
                      feePercent: 0, feeInitial: 0,
                      
                      properties: ["Первичное жилье (квартира и дом)"],
                      whereToApply: ["Жилстройсбербанк"],
                      details: ["для очередников до 2020"],
                      detailsColors: [ColorName.blue.rawValue],
                      detailsFull: "для лиц, состоящих в очереди на жилье до 2010 года\nДля вкладчиков ЖССБ, состоящих в очереди на жилье МИО (с требованием подтверждения дохода)",
                      imageName: ImageName.zhilStroiSberBank.rawValue)
    ]
    
    var rentals = [
        MortgageModel(id: 47,
                      name: "Арендное жилье от АО \"Самрук-Казына\"",
                      AEIR: -1,
                      firstStageRate: 0,
                      ageOfBorrower: ["АО «Фонд недвижимости «Самрук-Казына»",
                                      "Арендное жилье с правом выкупа со сроком до 15 лет",
                                      "Претенденты",
                                      " • очередники\n\t • сироты и дети, оставшиеся без попечения родителей;\n\t • лица, приравненные к инвалидам и участникам Великой Отечественной войны;\n\t • семьи, имеющие или воспитывающие детей-инвалидов;\n\t • пенсионеры по возрасту;\n\t • оралманы;\n\t • лица, лишившиеся жилища в результате экологических бедствий, ЧС природного и техногенного характера;\n\t • многодетные и неполные семьи;\n\t • госслужащие;\n\t • сотрудники бюджетных организаций;\n\t • военные;\n\t • кандидаты в космонавты;\n\t • космонавты;\n\t • работники специальных госорганов;\n\t • лица, занимающие государственные выборные должности.\n\n • обычные граждане",
                                      "Требования к претендетам",
                                      " • Подтверждение постановки очередника на учет нуждающихся на получение жилья и статуса, нуждающегося в жилье в соответствии с действующим жилищным законодательством Республики Казахстан;\n • Подтверждение платежеспособности.\n • Наличие дохода за последний год;\n • Возраст участников не имеет значения — купить квартиру от «Самрук-Казына» могут все совершеннолетние казахстанцы с достаточным доходом.\n • Фонду не важны семейное положение и место работы участника.",
                                      "Параметры программы",
                                      " • Условия предоставления жилья в аренду с выкупом определяются внутренними документами Samruk-Kazyna Construction;\n • Жилье предоставляется в аренду с выкупом до 15 (пятнадцати) лет, при этом максимальный срок может быть изменен в зависимости от условий рынка и финансовой устойчивости Samruk-Kazyna Construction. Арендаторы имеют право на досрочное приобретение жилья в собственность;\n • После полного исполнения арендатором своих обязательств по договору жилое помещение передается в собственность арендатора;\n • Размер арендной платы и срок аренды с выкупом определяются, исходя из принципов возвратности выделенных средств на финансирование строительства и финансовой устойчивости Samruk-Kazyna Construction.",
                                      "Размер стоимости арендной платы",
                                      "Арендный платеж за 1 кв.м. в городах Астана и Алматы (при себестоимости строительства 150 000 тенге за 1 кв.м.):\n\n • При сроке аренды в 5 лет — 3160 тг\n • При сроке аренды в 7 лет — 2469 тг\n • При сроке аренды в 10 лет — 1965 тг\n • При сроке аренды в 15 лет — 1598 тг\n\nАрендный платеж за 1 кв.м. в регионах РК (при себестоимости строительства 120 000 тенге за 1 кв.м.)\n\n • При сроке аренды в 5 лет — 2528 тг\n • При сроке аренды в 7 лет — 1975 тг\n • При сроке аренды в 10 лет — 1572 тг\n • При сроке аренды в 15 лет — 1278 тг",
                                      "Порядок рассмотрения документов",
                                      "\n • Отобранные претенденты подтверждают платежеспособность в соответствии с внутренними документами Samruk-Kazyna Construction. Для претендентов, подтвердивших выкуп жилья за счет собственности\n • Местный исполнительный орган утверждает пул претендентов, подтвердивших платежеспособность, соразмерно количеству квартир.\n • Samruk-Kazyna Construction предоставляет претендентам возможность выбора квартир согласно очередности, определяемой порядковым номером в предоставленных списках МИО.\n • При распределении арендных квартир АО «Samruk-Kazyna Construction» отдает предпочтение очередникам акиматов, для которых это жилье и строилось. При этом невостребованные квартиры без первоначального взноса в аренду с последующим выкупом могут взять и другие категории граждан, которых нет в списке, имеющих право стать очередником акиматов. Это, например, работники частных структур, индивидуальные предприниматели и другие.\n • В Фонде уточняют, что квартиры для очередников распределяются на основании полученных списков, утвержденных жилищной комиссией акимата. Невостребованные МИО квартиры реализуются в два этапа через интернет путем принятия электронных заявок на сайте Фонда.\n • В первом этапе участвуют граждане, не имеющие своего жилья. Если после первого этапа остаются невостребованные квартиры, то они реализуются на втором этапе для всех категорий граждан. По условиям программы реализация арендных квартир без выкупа не предусмотрена.",
                                      "Как подавать заявку",
                                      " 1. Дождаться окончания строительства и ввода в эксплуатацию жилья, строящегося по линии АО«Самрук-Казына».Информация о приеме заявок в городах будет опубликована на сайте www.fnsk.kz за пару месяцев.\n 2. Для подачи заявки на получение арендного жилья нужно зарегистрироваться на сайте Фонда недвижимости АО «Самрук-Казына» www.fnsk.kz. Для регистрации и подачи заявки вам понадобится электронная цифровая подпись (ЭЦП).\n 3. В процессе подачи заявки необходимо выбрать город и жилой комплекс,затем количество комнат в планируемой квартире и ознакомиться с местоположением и планировками. Далее необходимо указать тип заявления «Прямая покупка» или «Аренда с выкупом» — второе именно то, что нам необходимо. На экране вы увидите статус вашей заявки, ее идентификационный номер и дату завершения конкурса, количество поданных заявок, а также очередь в реальном времени по этому конкурсу.\n 4. Подать документы на арендное жилье с выкупом.Как только будет окончен срок приема заявок, опубликованный на сайте, и будет сформирован список очередников на арендное жилье, указанным претендентам необходимо будет обратиться со списком необходимых документов непосредственно в Управляющую компанию Фонда недвижимости."], // 14
                      initialFeePercentageString: "",
                      initialFeeLowerBound: 0,
                      initialFeeUpperBound: 0,
                      maxCredit: -1,
                      continuousWorkExperience: "",
                      
                      minTerm: 0, maxTerm: 0,
                      feePercent: 0, feeInitial: 0,
                      
                      properties: ["1598 ₸ / м²", "1278 ₸ / м²", "до 15 лет"],
                      whereToApply: [" • Выдается очередникам только при наступлении их очередности",
                                     " • Не требует первоначального взноса",
                                     " • Отсутствие собственного жилья",
                                     " • Могут участвовать все граждани достигшие возраста 18 лет"],
                      details: ["с правом выкупа"],
                      detailsColors: [ColorName.orangish.rawValue],
                      detailsFull: "",
                      imageName: ImageName.samrukKazyna.rawValue),
        
        MortgageModel(id: 48,
                      name: "Арендное жилье для молодежи",
                      AEIR: -1,
                      firstStageRate: 0,
                      ageOfBorrower: ["Арендное жилье для молодежи",
                                      "Арендное жилье без права выкупа только на 5 лет для\nмолодежи до 28 лет (включительно)",
                                      "Требования к претендетам",
                                      " • работающая молодежь – граждане Республики Казахстан, не достигшие возраста двадцати девяти лет, освоившие образовательные учебные программы общеобразовательных школ и (или) организаций технического и профессионального и (или) послесреднего, и (или) высшего, и (или) послевузовского образования и осуществляющие трудовую деятельность;\n • отсутствие собственного жилья;",
                                      "Размер стоимости арендной платы",
                                      " • 150 тенге за 1 кв.м для крупных городов\n • 117 тенге за 1 кв.м для регионов",
                                      "Ежемесячная арендная плата за квартиру",
                                      "Нур-Султан, Алматы, Актау, Атырау :\n\n • за 40 кв.м. - 6 000 тг\n • за 60 кв.м. - 8 000 тг\n • за 80 кв.м -12 000 тг\n\nОстальные регионы :\n\n • за 40 кв.м. - 4 667 тг\n • за 60 кв.м. - 7 000 тг\n • за 80 кв.м - 9 333 тг\n\nКоммунальные услуги и налоги оплачиваются арендатором",
                                      "Как подавать заявку",
                                      " • необходимо обратиться в акимат",
                                      "Документы",
                                      " 1. заявление по форме согласно приложению к настоящим Правилам;\n 2. копия документа, удостоверяющего личность заявителя (оригинал представляется для идентификации личности);\n 3. копия документа об образовании;\n 4. копия свидетельства о заключении брака (при наличии);\n 5. копия свидетельств(а) о рождении детей (при наличии);\n 6. справка об отсутствии (наличии) недвижимого имущества на заявителя и всех членов семьи;\n 7. справка с места работы;\n 8. справка о доходах за последние шесть месяцев, подтверждающая ежемесячных доход заявителя в размере не менее 40 (сорока) месячных расчетных показателей;\n 9. документы, подтверждающие трудовой стаж в соответствии со статьей 35 Трудового кодекса Республики Казахстан;\n 10. справка о наличии и номере банковского счета и выписка об остатке и движении денег по банковскому счету;\n 11. документы, подтверждающие личные достижения заявителя в различных сферах деятельности (при наличии).",
                                      "Порядок рассмотрение документов",
                                      " 1. Уполномоченный орган публикует на интернет-ресурсе местного исполнительного органа области, города республиканского значения объявление о предоставлении арендного жилища без права выкупа для работающей молодежи с указанием даты начала и окончания приема заявлений.\n 2. Арендное жилище без права выкупа предоставляется работающей молодежи в соответствии с требованиями установленными Государственной программой жилищного строительства «Нұрлы жер», утвержденной постановлением Правительства Республики Казахстан от 22 июня 2018 года № 372.\n 3. Заявитель для получения арендного жилища без права выкупа предоставляет в уполномоченный орган вышеуказанные документы.\n 4. После завершения приема документов уполномоченный орган в течение 5 (пяти) рабочих дней проверяет полноту документов и их соответствие пунктам 1 и 2 настоящих Правил.\n 5. В случае предоставления заявителем неполного пакета документов согласно перечню, предусмотренному пунктом 4 настоящих Правил, заявителю предоставляется возможность в течение 1 (одного) рабочего дня дополнительно представить отсутствующие документы.\n 6. В случае несоответствия заявителя, требованиям пунктам 1 и 2 настоящих Правил, уполномоченный орган отказывает в предоставлении арендного жилища без права выкупа в письменном виде.\n 7. Уполномоченный орган в течение 10 (десяти) рабочих дней производит подсчет баллов и формирует список претендентов на получение арендного жилища без права выкупа по наибольшему количеству баллов.\n 8. Подсчет баллов осуществляется по балльной системе:\n 9. заявителю, освоившему профессию согласно перечню 100 (ста) наиболее востребованных рынком специальностей, утвержденному уполномоченным органом по вопросам занятости населения в соответствии с Государственной программой развития продуктивной занятости и массового предпринимательства на 2017 – 2021 годы «Еңбек», утвержденной поставнолением Правительства Республики Казахстан от 13 ноября 2018 года № 746 – 10 баллов;\n 10. при наличии семьи – 5 баллов, за каждый год в зарегистрированном браке – 2 балла;\n 11. при наличии 1 (одного) ребенка – 1 балл, за каждого последующего ребенка – 2 балла;\n 12. при осуществлении индивидуальной предпринимательской деятельности не менее 1 года – 5 баллов, за каждый год – 1 балл;\n 13. при наличии личных достижений заявителя в различных сферах деятельности – 2 балла;\n 14. за трудовую деятельность в бюджетных организациях (государственных учреждениях и государственных предприятиях) – 5 баллов, за каждый год стажа – 1 балл;\n 15. за каждый год накоплений на сберегательных счетах (депозитах) в банках второго уровня – 2 балла.\n 16. При равенстве баллов преимущество имеют претенденты, подавшие заявления раннее по дате подачи заявления.\n 17. Решение о предоставлении арендного жилища без права выкупа принимается уполномоченным органом и подписывается первым руководителем местного исполнительного органа области, города республиканского значения.\n 18. После принятия уполномоченным органом решения о предоставлении арендного жилища без права выкупа, в течение 15 (пятнадцати) календарных дней заключается договор найма жилища между заявителем и уполномоченным органом.\n 19. Арендное жилище без права выкупа предоставляется на срок – 5 (пять) лет."], // 14
                      initialFeePercentageString: "",
                      initialFeeLowerBound: 0,
                      initialFeeUpperBound: 0,
                      maxCredit: 0,
                      continuousWorkExperience: "",
                      
                      minTerm: 0, maxTerm: 0,
                      feePercent: 0, feeInitial: 0,
                      
                      properties: ["150 ₸ / м²", "117 ₸ / м²", "до 5 лет"],
                      whereToApply: [" • Заявители не достигшие возраста 29 лет",
                                     " • Отсутствие собственного жилья"],
                      details: ["без права выкупа"],
                      detailsColors: [ColorName.orangish.rawValue],
                      detailsFull: "",
                      imageName: ImageName.rentTeens.rawValue),

        MortgageModel(id: 49,
                      name: "Арендное жилье для очередников",
                      AEIR: -1,
                      firstStageRate: 0,
                      ageOfBorrower: ["Арендное жилье для очередников",
                                     "Арендное жилье без права выкупа с неограниченным\nсроком, но с необходимостью продлевать договор займа каждые 5 лет",
                                     "Претенденты",
                                     " • инвалиды и участники Великой Отечественной войны;\nлица, приравненные к инвалидам и участникам Великой Отечественной войны;\n • инвалиды I и II групп;\n • семьи, которые имеют или воспитывают детей-инвалидов;\n • лица, страдающие тяжелыми формами некоторых хронических заболеваний, которые перечислены в списке заболеваний, утверждаемом правительством РК;\n • пенсионеры по возрасту;\n • дети-сироты и дети, оставшиеся без попечения родителей, не достигшие 29 лет, потерявшие родителей до 18 лет (при призыве таких лиц на воинскую службу возраст продлевается на срок прохождения срочной воинской службы);\n • оралманы;\n • граждане, которые лишились жилища в результате экологических бедствий, чрезвычайных ситуаций природного и техногенного характера;\n • многодетные семьи;\n • семьи граждан, погибших (умерших) при исполнении государственных или общественных обязанностей, воинской службы, при подготовке или осуществлении полета в космическое пространство, при спасении человеческой жизни, при охране правопорядка;\n • неполные семьи.",
                                     "Требования к претендетам",
                                     " • должны иметь совокупный среднемесячный доход за последние 12 месяцев перед обращением о предоставлении жилища на каждого члена семьи ниже 1 размера прожиточного минимума, установленного на соответствующий финансовый год законом о республиканском бюджете за исключением детей-инвалидов.\n • совершенные члены семьи, указанные в договоре найма, имеют право переоформить договор на свое имя после смерти основного нанимателя",
                                     "Размер стоимости арендной платы",
                                     " • 150 тенге за 1 кв.м для городов Нур-Султан, Алматы, Актау, Атырау\n • 117 тенге за 1 кв.м для регионов",
                                     "Ежемесячная арендная плата за квартиру",
                                     "Нур-Султан, Алматы, Актау, Атырау :\n\n • за 40 кв.м. - 6 000 тг\n • за 60 кв.м. - 8 000 тг\n • за 80 кв.м -12 000 тг\n\nОстальные регионы :\n\n • за 40 кв.м. - 4 667 тг\n • за 60 кв.м. - 7 000 тг\n • за 80 кв.м - 9 333 тг\n\nКоммунальные услуги и налоги оплачиваются арендатором",
                                     "Как подавать заявку",
                                      " • необходимо обратиться в акимат для постановки на учет как нуждающийся\n • обратиться в Правительство для граждан (ЦОН) по месту жительства",
                                     "Документы",
                                     "Претендентам следует отслеживать на сайте акимата или управлений жилья информацию о приеме документов от очередников. При наличии электронной цифровой подписи (ЭЦП) документы можно сдать на портале электронного правительства.\n\nВ Государственную корпорацию «Правительство для граждан» услугополучатель (либо его представитель по нотариально заверенной доверенности) должен сдать:\n\n • заявление о постановке на учет граждан, нуждающихся в жилище из коммунального жилищного фонда, с указанием согласия на проверку услугодателем о наличии или отсутствия жилища из коммунального жилищного фонда;\n • документ, удостоверяющий личность (требуется для идентификации личности);\n • документ, подтверждающий факт проживания в городах республиканского значения, столице не менее трех лет (только для граждан Республики Казахстан, проживающих в городах республиканского значения, столице);\n • свидетельства о заключении (расторжении) брака (до 1 июня 2008 года), о смерти членов семьи (до 13 августа 2007 года), о рождении детей (до 13 августа 2007 года) оригинал представляется для идентификации личности);\n • справка соответствующего местного исполнительного органа, если единственное жилище признано аварийным;\n\nВ случае обращения услугополучателя, относящегося к социально уязвимым слоям населения (за исключением детей-сирот, детей, оставшихся без попечения родителей, и детей-инвалидов), дополнительно представляется:\n\n • справка о доходах за последние двенадцать месяцев перед обращением на каждого члена семьи.\n\nВ случае обращения услугополучателя, относящегося к категории государственных служащих, работников бюджетных организаций, военнослужащих, сотрудников специальных государственных органов и лиц, занимающие государственные выборные должности, дополнительно представляется:\n\n • справка с места работы (службы).\n\nВ случаях, когда жилище, в котором проживает семья, не отвечает установленным санитарным и техническим требованиям, либо когда в смежных, неизолированных жилых помещениях проживают две и более семей, либо когда в составе семьи имеются больные, страдающие тяжелыми формами некоторых хронических заболеваний, при которых совместное проживание с ними в одном помещении (квартире) становится невозможным, услугополучатель дополнительно представляет:\n\n • справки соответствующих уполномоченных органов. \n\nСведения документов, удостоверяющих личность, свидетельства о заключении или расторжении брака (после 1 июня 2008 года), о смерти (после 13 августа 2007 года), о рождении детей (после 13 августа 2007 года), справки о наличии или отсутствии жилища (по Республике Казахстан), принадлежащего им на праве собственности, адресной справки, решение суда о признании других лиц членами семьи услугополучателя, документов, подтверждающих принадлежность услугополучателя к социально уязвимым слоям населения, предоставляются услугодателю на всех членов семьи из соответствующих государственных информационных систем через шлюз «электронного правительства».\n\nЖилище из жилищного фонда государственного учреждения предоставляется согласно заключенному договору найма"], // 14
                      initialFeePercentageString: "",
                      initialFeeLowerBound: 0,
                      initialFeeUpperBound: 0,
                      maxCredit: 0,
                      continuousWorkExperience: "",
                      
                      minTerm: 0, maxTerm: 0,
                      feePercent: 0, feeInitial: 0,
                                            
                      properties: ["150 ₸ / м²", "150 ₸ / м²", "без ограничений"],
                      whereToApply: [" • Выдается очередникам без наступления очереди",
                                     " • Необходимо продлевать договор займа каждые 5 лет",
                                     " • Могут участвовать заявители у которых жилище признано аварийным"],
                      details: ["без права выкупа"],
                      detailsColors: [ColorName.orangish.rawValue],
                      detailsFull: "",
                      imageName: ImageName.rentQueuers.rawValue),
    ]

    func fetchLeftOutData(completion: @escaping (Result<[MortgageModel], Error>) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now(), execute: {
            completion(.success(self.leftOutData))
        })
    }
    
    func fetchRentals(completion: @escaping (Result<[MortgageModel], Error>) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now(), execute: {
            completion(.success(self.rentals))
        })
    }

                                          
    func fetchData(textField1: String,
                   textField2: String,
                   textField3: String,
                   textField4: String,
                   textField6_1: String,
                   textField6_2: String,
                   textField6_3: String,
                   textField8_1: String,
                   textField8_2: String,
                   textField8_3: String,
                   segCtrl1Choice: Int,
                   segCtrl2Choice: Int,
                   segCtrl3Choice: Int,
                   segCtrl4Choice: Int,
                   completion: @escaping (Result<[MortgageModel], Error>) -> Void) {
        
        // filtering
        
        var feePercent = 0

        var array = myOriginalData.filter({
            
            if $0.initialFeePercentageString.count > 2 {
                feePercent = Int("\($0.initialFeePercentageString.prefix(2))")!
            } else {
                feePercent = 0
            }
            
            var bool1 = $0.maxCredit >= Int(textField1) ?? 0
            var txtfld2 = Int(textField2) ?? 0

            var bool2 = true
            if textField1 != "" {
                bool2 = txtfld2 * feePercent >= $0.maxCredit * feePercent
            }
            
            var bool3 = $0.maxTerm > Int(textField3) ?? 0

            var bool4 = true
            if textField4 == "Не состою в очереди" {
                for s in $0.details {
                    if s.contains("очередн") || s.contains("военн") || s.contains("семьи") || s.contains("военн") {
                        bool4 = false
                    }
                }
            } else if textField4 == "Военный" {
//                for s in $0.details {        too consuming
//                    if s.contains("семьи") {
//                        bool4 = false
//                    }
//                }

                if $0.id == 45 {
                    bool4 = false
                }
            } else if textField4 == "Неполная семья" || textField4 == "Многодетная семья" || textField4 == "Семья с ребёнком инвалидом" {
                for s in $0.details {
                    if s.contains("военн") {
                        bool4 = false
                    }
                }
            }
            
            var bool5 = true
            if segCtrl1Choice == 1 {
                if !$0.properties.contains("Первичное жилье (квартира и дом)") {
                    bool5 = false
                }
            } else if segCtrl1Choice == 2 {
                if !$0.properties.contains("Покупка вторичного жилья") {
                    bool5 = false
                }
            }
                  
            var bool6 = true
            if segCtrl2Choice == 1 {
                // NOT CLEAR HOW THEY AFFECT THE SEARCH: THEY DON'T AFFECT IT IN THE WEBSITE
//                textField6_1
//                textField6_2
//                textField6_3
            } else if segCtrl2Choice == 2 {
                if $0.details.contains("с частичным подтверждением доходов") || $0.details.contains("без подтверждения дохода") || $0.id == 34 {
                    bool6 = false
                }
            }
            
            
            
            var bool7 = true
            if segCtrl3Choice == 1 {
                if $0.name == "5-10-20" || $0.name == "72025" || $0.name.contains("отбасы") {
                    bool7 = false
                }
                
                for s in $0.details {
                    if s.contains("военн") || s.contains("отбасы") {
                        bool7 = false
                    }
                }
            }
            
            var bool8 = true
            if segCtrl4Choice == 1 {
                
            }
            
            var finalBool = bool1 && bool2 && bool3 && bool4 && bool5 && bool6 && bool7 && bool8
            if !finalBool {
                leftOutData.append($0)
            }
            
            return finalBool
        })
        
        array = array.sorted(by: { $0.id < $1.id })
        
        DispatchQueue.global().asyncAfter(deadline: .now(), execute: {
            completion(.success(array))
        })        
    }
}
