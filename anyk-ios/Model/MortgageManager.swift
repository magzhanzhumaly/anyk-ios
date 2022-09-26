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

class MortgageManager  {
    var delegate: MortgageManagerDelegate?
    var isPaginating = false
    
    func fetchData(pagination: Bool = false, completion: @escaping (Result<[String], Error>) -> Void) {
        if pagination {
            isPaginating = true
        }
        
        DispatchQueue.global().asyncAfter(deadline: .now() + (pagination ? 3 : 2), execute: {
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
            let originalData = [
                "72025",
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
            ]
            /*
            let originalData = [
                "Apple",
                "Google",
                "Facebook",
                "Apple",
                "Google",
                "Facebook",
                "Apple",
                "Google",
                "Apple",
                "Google",
                "Facebook",
                "Apple",
                "Google",
                "Facebook",
                "Apple",
                "Google",
                "Apple",
                "Google",
                "Facebook",
                "Apple",
                "Google",
                "Facebook",
                "Apple",
                "Google"
            ]
            */
            let newData = [
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
            /*
            let newData = [
                "Banana",
                "Oranges",
                "Grapes",
                "Food"
            ]*/
            completion(.success( pagination ? newData : originalData))
            if pagination {
                self.isPaginating = false
            }
        })
        
    }
    /*
    func getMortage() {
        
        let mortgages: [MortgageData]
        let transports: [TransportData] = try! JSONDecoder().decode([TransportData].self, from: safeData)
        print("transports.count = \(transports.count)") // Prints: 5
        for transport in transports {
            //                    print("transport = \(transport)")
            let transportModel = TransportModel(id: transport.id, latitude: transport.latitude, longitude: transport.longitude, type: transport.type, brand: transport.brand)
            self.delegate?.didUpdateTransport(self, transport: transportModel)
            //                    print("delegated")
            
    }
    
    func deleteTransport(_ id: Int) {
        guard let url =  URL(string:"http://localhost:8080/api/transport/delete/\(id)")
        else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                self.delegate?.didFailWithError(error: error!)
                return
            }

            if let safeData = data {
                print("delete, safedata = \(safeData)")
            }
        }
        task.resume()
    }
    
    func moveRequest(id: String, latitude: String, longitude: String) -> Bool {
        guard let url =  URL(string:"http://localhost:8080/api/transport/move")
        else { return false }
        
        let session = URLSession(configuration: .default)
        
        let body: [String: String] = ["id": id, "latitude": latitude, "longitude": longitude]
        let finalBody = try? JSONSerialization.data(withJSONObject: body)
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.httpBody = finalBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = session.dataTask(with: request) { data, response, error in
            
            if error != nil {
                self.delegate?.didFailWithError(error: error!)
                return
            }
            
            if let safeData = data {
                print("moveRequest, safedata = \(safeData)")
            }
        }
        task.resume()
        return false
    }
    
    func reserveRequest(_ id: Int) {
        guard let url =  URL(string:"http://localhost:8080/api/transport/reserve/\(id)")
        else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                self.delegate?.didFailWithError(error: error!)
                return
            }

            if let safeData = data {
                print("reserveRequest, safedata = \(safeData)")
            }
        }
        task.resume()
    }
*/
}
