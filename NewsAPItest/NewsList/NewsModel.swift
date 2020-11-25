//
//  NewsModel.swift
//  NewsAPItest
//
//  Created by V on 23.11.2020.
//

import Foundation
import RealmSwift

class News: Object {
    @objc dynamic var src: String = ""
    @objc dynamic var author: String = ""
    @objc dynamic var title: String = ""
    @objc dynamic var descr: String = ""
    @objc dynamic var url: String = ""
    @objc dynamic var urlToImage: String = ""
    @objc dynamic var publishedAt: String = ""
}
