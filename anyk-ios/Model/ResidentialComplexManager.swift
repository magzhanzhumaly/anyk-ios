//
//  ResidentialComplexManager.swift
//  anyk-ios
//
//  Created by Magzhan Zhumaly on 05.11.2022.
//

import Foundation
import UIKit

protocol ResidentialComplexManagerDelegate {
    func didUpdateArticle(_ articleManager: ArticleManager, article: ArticleModel)
    func didFailWithError(error: Error)
}

class ResidentialComplexesManager {

    var myOriginalData = [
        
        ResidentialComplexModel(id: 1,
                                name: "ЖК Достар-2 в Актобе",
                                city: "Актобе",
                                address: "Казахстан, Актобе, микрорайон Батыс-2, участок 29",
                                dict: [1 : 5000000, 2 : 9662500, 3 : 10250000],
                                company: "ТОО FSPC",
                                is72025: true),
        
        ResidentialComplexModel(id: 2,
                                name: "ЖК Еркен в Актобе",
                                city: "Актобе",
                                address: "Казахстан, Актобе, улица Бокенбай Батыра, 133",
                                dict: [1 : 5220000],
                                company: "Center Group",
                                is72025: true),
        
        ResidentialComplexModel(id: 3,
                                name: "ЖК Достар в Актобе",
                                city: "Актобе",
                                address: "Казахстан, Актобе, микрорайон Батыс-2, участок 41 В",
                                dict: [1 : 5460000, 2 : 10327200, 3 : 13702000],
                                company: "ТОО FSPC",
                                is72025: true),
        
        ResidentialComplexModel(id: 4,
                                name: "ЖК в мкр Аэропорт в Костанае",
                                city: "Костанай",
                                address: "Казахстан, Костанайская область, Костанай, микрорайон Аэропорт",
                                dict: [1 : 5517400, 2 : 8097600, 3 : 10976000],
                                company: "Аппарат акима Костанай области",
                                is72025: true),
        
        ResidentialComplexModel(id: 5,
                                name: "ЖК GoldSquare",
                                city: "Актобе",
                                address: "Казахстан, Актобе, улица Маресьева, д. 31 А",
                                dict: [1 : 7579800],
                                company: "ТОО \"СтройНафтаСервис-М\"",
                                is72025: true),
        
        ResidentialComplexModel(id: 6,
                                name: "ЖК Abyroy в Актобе",
                                city: "Актобе",
                                address: "Казахстан, Актобе, микрорайон Батыс-2, 49д",
                                dict: [1 : 7560000, 2 : 10458000],
                                company: "K7 Group",
                                is72025: true),
        
        ResidentialComplexModel(id: 7,
                                name: "ЖК TAVANGAR",
                                city: "Актобе",
                                address: "Казахстан, Актобе, микрорайон Батыс-2, 38В",
                                dict: [1 : 6500000, 2: 8000000],
                                company: "ТОО Завод Светотехника",
                                is72025: true),
        
        ResidentialComplexModel(id: 8,
                                name: "МЖК в Кызылжар",
                                city: "Акмолинская область",
                                address: "Казахстан, Акмолинская область, Целиноградский район, село Кызылжар",
                                dict: [1 : 6800000, 2 : 10200000],
                                company: "ТОО WEST STANDARD",
                                is72025: true),
    ]

    func fetchData(completion: @escaping (Result<[ResidentialComplexModel], Error>) -> Void) {
        
//        // filtering
//        var array = myOriginalData.filter({
//            if $0.articleType == articleType || articleType == "Все статьи" {
//                return true
//            }
//            return false
//        })
     
        self.myOriginalData = self.myOriginalData.sorted(by: { $0.id < $1.id })
        
        DispatchQueue.global().asyncAfter(deadline: .now(), execute: {
            completion(.success(self.myOriginalData))
        })
    }
}
