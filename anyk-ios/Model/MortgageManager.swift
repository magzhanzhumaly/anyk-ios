//
//  MortgageManager.swift
//  anyk-ios
//
//  Created by Magzhan Zhumaly on 26.09.2022.
//

import Foundation

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
}
class MortgageManager  {
    var delegate: MortgageManagerDelegate?
    var isPaginating = false
    
    func fetchData(pagination: Bool = false, completion: @escaping (Result<[MortgageModel], Error>) -> Void) {
        if pagination {
            isPaginating = true
        }
        
        
//        DispatchQueue.global().asyncAfter(deadline: .now() + (pagination ? 0 : 0), execute: {

        DispatchQueue.global().asyncAfter(deadline: .now(), execute: {

            /*
             let dataArray = ["72025",
             "Баспана ХИТ",
             "Жилищный заем \"Баспана\"",
             "5-10-20",
             "Бақытты отбасы",
             "\"Стандартный\" для вторичного жилья",
             "\"Стандартный\" для первичного жилья",
             "\"Стандартный\" промежуточный заем для \"Свой дом\"",
             "\"Женил 2\" для вторичного жилья",
             "\"Женил 2\" для первичного жилья",
             "\"Женил 2\" для промежуточный заем для \"Свой дом\"",
             "\"Женил\" для вторичного жилья",
             "\"Женил\" для первичного жилья",
             "\"Женил\" для промежуточный заем для \"Свой дом\"",
             "Ипотека \"Орда\" от АО \"КИК\"",
             "Ипотека \"Орда\"",
             "Военная ипотека",
             "\"Стандартный\" для военных",
             "\"Женил\" для военных",
             "\"Женил 2\" для военных",
             "Жилищный заем по программе \"Нұрлы жер\"",
             "\"Стандартный\" заем для \"Нұрлы жер\"",
             "\"Женил 2\" заем для \"Нұрлы жер\"",
             "\"Жас отбасы\" с типом займа \"Жеңіл\"",
             "\"Стандартный\" заем от \"Жилстройсбербанка и BI Group\"",
             "\"Женил\" от \"Жилстройсбербанка и BI Group\"",
             
             
             "Ипотека от Halykbank с подтверждением дохода без первоначального взноса",
             "Ипотека от Halykbank с подтверждением дохода",
             "Жилищный кредит от Сбербанка с полным подтверждением доходов",
             "Жилищный кредит от Сбербанка с частичным подтверждением доходов",
             "Ипотека от Fortebank с подтверждением дохода",
             "Ипотека от Fortebank без подтверждения дохода",
             "Ипотека от АТФ Банка с полным подтверждением доходов",
             "Ипотека от АТФ Банка с частичным подтверждением доходов",
             "Ипотека от Bank RBK",
             "Ипотека Nurbank",
             "Ипотека от Halykbank без подтверждения дохода",
             "Ипотека от Altynbank с полным подтверждением доходов",
             "Ипотека от Altynbank с частичным подтверждением доходов"
             ]
             */
            
            let myOriginalData = [
                MortgageModel(id: 1,
                              name: "Ипотека от Altynbank",
                              AEIR: 13.75,
                              firstStageRate: 13.75,
                              ageOfBorrower: ["мужчины: с 21 до",
                                              "женщины: с 21 до"],
                              initialFee: "20% - 99%",
                              maxCredit: 175000000,
                              continuousWorkExperience: "6 месяцев",
                              
                              minTerm: 6, maxTerm: 20,
                              
                              feePercent: 2.5, feeInitial: 10000,

                              properties: ["Первичное жилье (квартира и дом)", "Покупка вторичного жилья"],
                              whereToApply: ["Altynbank"],
                              details: ["с полным подтверждением дохода"],
                              detailsColors: [ColorName.orange.rawValue],
                              detailsFull: "с полным подтверждением доходов\nКредиты на покупку недвижимости в городах Алматы, Нур-Султан(в радиусе 30 км) от города, Атырау и Актау с требованием полного подтверждения доходов",
                              imageName: ImageName.altynBank.rawValue),
            

                MortgageModel(id: 2,
                              name: "Ипотека от Altynbank",
                              AEIR: 18,
                              firstStageRate: 16,
                              ageOfBorrower: ["мужчины: с 21 до",
                                              "женщины: с 21 до"],
                              initialFee: "20% - 99%",
                              maxCredit: 175000000,
                              continuousWorkExperience: "6 месяцев",
                              
                              minTerm: 6, maxTerm: 20,
                              feePercent: 2.5, feeInitial: 10000,
                              
                              properties: ["Первичное жилье (квартира и дом)", "Покупка вторичного жилья"],
                              whereToApply: ["Altynbank"],
                              details: ["с частичным подтверждением дохода"],
                              detailsColors: [ColorName.orange.rawValue],
                              detailsFull: "с частичным подтверждением\nКредиты на покупку недвижимости в городах Алматы, Нур-Султан(в радиусе 30 км) от города, Атырау и Актау с возможностью частичного подтверждения доходов",
                              imageName: ImageName.altynBank.rawValue),
                
                MortgageModel(id: 3,
                              name: "Ипотека от Bank RBK",
                              AEIR: 16,
                              firstStageRate: 16,
                              ageOfBorrower: ["мужчины: с 21 до",
                                              "женщины: с 21 до"],
                              initialFee: "50% - 99%",
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
                              initialFee: "50% - 99%",
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
                              initialFee: "35% - 99%",
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
                              initialFee: "35% - 99%",
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
                              initialFee: "35% - 99%",
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
                              initialFee: "20% - 99%",
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
                              initialFee: "50% - 99%",
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
                              initialFee: "50% - 99%",
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
                              initialFee: "0%",
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
                              initialFee: "50% - 99%",
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
                              initialFee: "30% - 99%",
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
                              initialFee: "30% - 99%",
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
                              initialFee: "0%",
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

                MortgageModel(id: 16,
                              name: "\"Женил\" от \"Жилстройсбербанка и BI Group\"",
                              AEIR: 7.4,
                              firstStageRate: 7,
                              ageOfBorrower: ["мужчины: с 21 до",
                                              "женщины: с 21 до"],
                              initialFee: "36% - 99%",
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
                              initialFee: "36% - 100%",
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
                              initialFee: "36% - 100%",
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
                              initialFee: "36% - 100%",
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
                              initialFee: "50% - 100%",
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
                              initialFee: "0%",
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
                              initialFee: "30% - 99%",
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
                              initialFee: "50% - 99%",
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
                              initialFee: "0%",
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
                              initialFee: "50% - 100%",
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
                              initialFee: "50% - 100%",
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
                              initialFee: "50% - 100%",
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
                              initialFee: "50% - 100%",
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
                              initialFee: "50% - 100%",
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
                              initialFee: "50% - 100%",
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
                              initialFee: "50% - 100%",
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
                              initialFee: "50% - 100%",
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
                              initialFee: "50% - 100%",
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
                              initialFee: "50% - 100%",
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
                              initialFee: "20% - 90%",
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
                              initialFee: "20% - 95%",
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
                              initialFee: "50% - 100%",
                              maxCredit: 0,
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
                              initialFee: "50% - 100%",
                              maxCredit: 0,
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
                              initialFee: "20% - 49%",
                              maxCredit: 0,
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
                              name: "\"Стандартный\" заем для \"Нұрлы жер\"",
                              AEIR: 5.2,
                              firstStageRate: 5,
                              ageOfBorrower: ["мужчины: с 21",
                                              "женщины: с 21"],
                              initialFee: "50% - 100%",
                              maxCredit: 0,
                              continuousWorkExperience: "6 месяцев",
                              
                              minTerm: 6, maxTerm: 25,
                              feePercent: 0, feeInitial: 0,
                              
                              properties: ["Первичное жилье (квартира и дом)"],
                              whereToApply: ["Жилстройсбербанк"],
                              details: ["для очередников с достаточным оценочным показателем в отбасы банк", "программа с накоплением депозита"],
                              detailsColors: [ColorName.green.rawValue, ColorName.green.rawValue],
                              detailsFull: "для покупки квартир, распределенных по конкурсу среди вкладчиков ЖССБ с требованием подтверждения дохода\nГосударственная программа жилищно-коммунального развития «Нурлы жер» на 2020-2025 годы",
                              imageName: ImageName.nurlyZher.rawValue),


                MortgageModel(id: 41,
                              name: "\"Женил 2\" для военных",
                              AEIR: 6,
                              firstStageRate: 6,
                              ageOfBorrower: ["мужчины: с 21",
                                              "женщины: с 21"],
                              initialFee: "50% - 100%",
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
                              initialFee: "50% - 100%",
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
                              initialFee: "50% - 100%",
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
                              initialFee: "15% - 49%",
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
                              initialFee: "10% - 49%",
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

                MortgageModel(id: 46,
                              name: "\"5-10-20\"",
                              AEIR: 5,
                              firstStageRate: 5,
                              ageOfBorrower: ["мужчины: с 21 до 63",
                                              "женщины: с 21 до 58"],
                              initialFee: "10% - 49%",
                              maxCredit: 18000000,
                              continuousWorkExperience: "0 месяцев",
                              
                              minTerm: 3, maxTerm: 19,
                              feePercent: 0, feeInitial: 0,
                              
                              properties: ["Первичное жилье (квартира и дом)"],
                              whereToApply: ["Жилстройсбербанк"],
                              details: ["для очередников до 2020"],
                              detailsColors: [ColorName.blue.rawValue],
                              detailsFull: "для лиц, состоящих в очереди на жилье до 2010 года\nДля вкладчиков ЖССБ, состоящих в очереди на жилье МИО (с требованием подтверждения дохода)",
                              imageName: ImageName.zhilStroiSberBank.rawValue),
                /*
                MortgageModel(id: 47,
                              name: "\"5-10-20\"", // name
                              AEIR: -1,
                              firstStageRate: -1,
                              ageOfBorrower: ["мужчины: с 21 до 63", // 2details
                                              "женщины: с 21 до 58"],
                              initialFee: "10% - 49%",
                              maxCredit: -1,
                              continuousWorkExperience: "0 месяцев",
                              
                              minTerm: -1, maxTerm: -1,
                              feePercent: -1, feeInitial: -1,
                              
                              properties: ["Первичное жилье (квартира и дом)"], // 3details
                              whereToApply: ["Жилстройсбербанк"],
                              details: ["для очередников до 2020"],  // details
                              detailsColors: [ColorName.blue.rawValue], // detailColors
                              detailsFull: "для лиц, состоящих в очереди на жилье до 2010 года\nДля вкладчиков ЖССБ, состоящих в очереди на жилье МИО (с требованием подтверждения дохода)",
                              imageName: ImageName.zhilStroiSberBank.rawValue) // imagename
                 */

            ]
            completion(.success(myOriginalData))

            if pagination {
                self.isPaginating = false
            }
        })
        
    }
}
