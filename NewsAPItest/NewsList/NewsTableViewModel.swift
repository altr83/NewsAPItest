//
//  NewsTableViewModel.swift
//  NewsAPItest
//
//  Created by V on 23.11.2020.
//

import Foundation
import Moya
import SwiftyJSON
import RealmSwift

class NewsTableViewModel: NewsTabelViewModelProtocol {
    let realm = try! Realm()
    var news = [News]()
    
    func fetchData() {
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        let provider = MoyaProvider<FetchData>()
        provider.request(.news) { result in
            switch result {
            case let .success(moyaResponse):
                let data = moyaResponse.data
                do {
                    let json = try JSON(data: data)
                    self.parseJSON(j: json)
                } catch {
                    print(error)
                }
            case let .failure(error):
                print("error: \(error)")
            }
        }
    }
    
    func saveData() {
        try! realm.write {
            for n in news {
                realm.add(n, update: .all)
            }
        }
    }
    
    func retriveData() -> Results<News> {
        let t = realm.objects(News.self)
        return t
    }
    
    func parseJSON(j:JSON) {
        realm.autorefresh = true
        if let articles = j["articles"].array {
            for f in articles {
                let newn = News()
                newn.author = f["author"].stringValue
                newn.title = f["title"].stringValue
                newn.descr = f["description"].stringValue
                newn.url = f["url"].stringValue
                newn.urlToImage = f["urlToImage"].stringValue
                newn.publishedAt = f["publishedAt"].stringValue
                newn.src = f["source"]["name"].stringValue
                self.news.append(newn)
            }
        }
        self.saveData()
    }
}
