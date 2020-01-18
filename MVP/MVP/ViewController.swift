//
//  ViewController.swift
//  MVP
//
//  Created by ZeKun Li on 2020/1/16.
//  Copyright © 2020 ZeKun Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var presenter :AppPresenter?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let presenter = AppPresenter(controller: self)
        self.presenter = presenter
        
        
        
    }


}

