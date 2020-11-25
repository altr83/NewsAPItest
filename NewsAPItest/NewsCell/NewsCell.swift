//
//  NewsCell.swift
//  NewsAPItest
//
//  Created by V on 24.11.2020.
//

import UIKit
import SnapKit
import SDWebImage

class NewsCell: UITableViewCell {
    
    var data: News? {
        didSet {
            titleLabel.text = data?.title
            srcLabel.text = data?.src
            imgView.sd_setImage(with: URL(string: data?.urlToImage ?? ""))
        }
    }
    var containerView = UIView()
    var titleLabel = UILabel()
    var srcLabel = UILabel()
    var imgView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func initUI() {
        self.addSubview(containerView)
        self.containerView.addSubview(titleLabel)
        self.containerView.addSubview(srcLabel)
        self.containerView.addSubview(imgView)
        
        containerView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        titleLabel.numberOfLines = 2
        imgView.sizeToFit()
        
        imgView.snp.makeConstraints { (make) in
            make.height.width.equalTo(60)
            make.left.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(10)
        }
        
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(imgView.snp.right).offset(10)
            make.right.equalToSuperview()
            make.top.equalToSuperview().offset(10)
        }
        
        srcLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom)
            make.right.equalToSuperview().offset(-10)
        }
    }
}
