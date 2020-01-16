//
//  AppPresenter.swift
//  MVP
//
//  Created by ZeKun Li on 2020/1/16.
//  Copyright © 2020 ZeKun Li. All rights reserved.
//

import UIKit

struct AppPresenter {
    let controller:UIViewController;
    
    init(controller:UIViewController) {
        self.controller = controller
        
        // 创建 View
        let appView = AppView()
        appView.frame = CGRect(x: 100, y: 100, width: 100, height: 150);
        controller.view.addSubview(appView)
        
        // 创建 Model
        let appModel = AppModel(name: "weChat", icon: "AppIcon")
        appView.iconImageView?.image = UIImage(named: appModel.icon)
        appView.nameLabel?.text = appModel.name
        
            
        
        
    }
}
