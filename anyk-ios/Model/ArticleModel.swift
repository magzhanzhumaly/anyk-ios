//
//  ArticleModel.swift
//  anyk-ios
//
//  Created by Magzhan Zhumaly on 03.11.2022.
//

import Foundation

struct ArticleModel: Equatable {
    var id: Int
    var articleType: String
    var tags: [String]
    var title: String
    var imageName: String
    var author: String
    var authorPhotoName: String
    var text: [String:String]
    var day: Int
    var month: Int
    var year: Int
}
