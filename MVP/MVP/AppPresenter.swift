//
//  AppPresenter.swift
//  MVP
//
//  Created by ZeKun Li on 2020/1/16.
//  Copyright © 2020 ZeKun Li. All rights reserved.
//

import UIKit

class AppPresenter: NSObject {
    var controller:UIViewController?
    
    init(controller:UIViewController) {
        super.init()
        
        self.controller = controller

        // 创建 View
        let appView = AppView()
        appView.frame = CGRect(x: 100, y: 100, width: 100, height: 150);
        appView.delegate = self
        controller.view.addSubview(appView)

        // 创建 Model
        let appModel = AppModel(name: "weChat", icon: "AppIcon")
        appView.setup(name: appModel.name, imageName: appModel.icon)



    }
    
}

extension AppPresenter : AppViewDelegate {
    func appViewDidClick() {
        print("调用成功了")
    }
    


}

