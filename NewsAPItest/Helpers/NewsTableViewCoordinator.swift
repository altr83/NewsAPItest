//
//  MainCoordinator.swift
//  NewsAPItest
//
//  Created by V on 24.11.2020.
//

import Foundation
import UIKit

class NewsTableViewCoordinator: CoordinatorProtocol {
    var navigationViewController: UINavigationController
    var parentViewController: UIViewController
    
    init(navigationViewController: UINavigationController) {
        self.navigationViewController = navigationViewController
        self.parentViewController = UIViewController()
    }
    
    func start() {
        let newsViewController = NewsTableViewController()
        navigationViewController.present(newsViewController, animated: true)
    }
}
