//
//  AppView.swift
//  MVP
//
//  Created by ZeKun Li on 2020/1/16.
//  Copyright © 2020 ZeKun Li. All rights reserved.
//

import UIKit

class AppView: UIView {
    
    weak var iconImageView: UIImageView?
    weak var nameLabel: UILabel?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let iconImageView = UIImageView()
        iconImageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        addSubview(iconImageView)
        self.iconImageView = iconImageView
        
        let nameLabel = UILabel()
        nameLabel.textAlignment = .center
        nameLabel.frame = CGRect(x: 0, y: 100, width: 100, height: 30)
        addSubview(nameLabel)
        self.nameLabel = nameLabel
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
