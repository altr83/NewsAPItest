//
//  NewsTableViewModelProtocol.swift
//  NewsAPItest
//
//  Created by V on 23.11.2020.
//

import Foundation
import RealmSwift

protocol NewsTabelViewModelProtocol: class {
    func fetchData()
    func saveData()
    func retriveData() -> Results<News>
}
