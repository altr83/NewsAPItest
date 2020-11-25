//
//  FetchData.swift
//  NewsAPItest
//
//  Created by V on 23.11.2020.
//

import Foundation
import Moya

enum FetchData {
    case news
}

extension FetchData: TargetType {
    var baseURL: URL {
        return URL(string: "https://newsapi.org/v2/top-headlines?country=ua&apiKey=78aef833ef4049c5bc3b92120c88a2ac")!
    }
    
    var path: String {
        switch self {
        case .news:
            return ""
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json",
                "Accept": "application/json"]
    }
}
