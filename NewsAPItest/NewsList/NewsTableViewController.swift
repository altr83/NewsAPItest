//
//  ViewController.swift
//  NewsAPItest
//
//  Created by V on 23.11.2020.
//

import UIKit
import SnapKit
import RealmSwift

class NewsTableViewController: UIViewController {
    
    private var vm: NewsTabelViewModelProtocol!
    private var tv: UITableView!
    private var res: Results<News>!
    private var indc: UIActivityIndicatorView!
    private var refreshNewsControl: UIRefreshControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        vm = NewsTableViewModel()
        tv = UITableView()
        indc = UIActivityIndicatorView()
//        refreshNewsControl = UIRefreshControl()
//        refreshNewsControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
//        refreshNewsControl.addTarget(self, action: #selector(self.refreshData), for: .valueChanged)
//        tv.addSubview(refreshNewsControl)
        tv.delegate = self
        tv.dataSource = self
        indc.color = .black
        tv.isHidden = true
        refreshData()
        initUI()
    }
    
    private func initUI() {
        self.view.addSubview(tv)
        self.view.addSubview(indc)
        indc.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        tv.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        self.tv.rowHeight = 70
    }
    
    @objc private func refreshData() {
        vm.fetchData()
        res = vm.retriveData()
        self.tv.reloadData()
        indc.isHidden = true
        tv.isHidden = false
    }
}

extension NewsTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return res?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = NewsCell()
        if indexPath.row < res.count {
            cell.data = res[indexPath.row]
            return cell
        } else {
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tv.deselectRow(at: indexPath, animated: true)
        let newsPage = NewsPageViewController()
        newsPage.url = res[indexPath.row].url
        self.present(newsPage, animated: true)
    }
}

