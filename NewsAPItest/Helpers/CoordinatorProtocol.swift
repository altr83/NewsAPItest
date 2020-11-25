//
//  CoordinatorProtocol.swift
//  NewsAPItest
//
//  Created by V on 24.11.2020.
//

import Foundation
import UIKit

protocol CoordinatorProtocol {
    var parentViewController: UIViewController { get }
    var navigationViewController: UINavigationController { get }
    func start()
}
