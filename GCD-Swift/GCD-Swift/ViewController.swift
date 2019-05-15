//
//  ViewController.swift
//  GCD-Swift
//
//  Created by 李泽昆 on 2019/5/16.
//  Copyright © 2019 personal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //        var num = 0
        //        DispatchQueue.global().async {
        //            for _ in 1...10000 {
        //                num += 1
        //            }
        //            print(num)
        //        }
        //
        //        for _ in 1...10000 {
        //            num += 1
        //        }
        
        //        let multiTasks = BlockOperation()
        
        //        multiTasks.completionBlock = {
        //            print("所有任务完成!")
        //        }
        //
        //        multiTasks.addExecutionBlock {  print("任务1开始"); sleep(1) }
        //        multiTasks.addExecutionBlock {  print("任务2开始"); sleep(2) }
        //        multiTasks.addExecutionBlock {  print("任务3开始"); sleep(3) }
        //
        //        multiTasks.start()
        
        
        let multiTaskQueue = OperationQueue()
        
        multiTaskQueue.addOperation { print("任务1开始"); sleep(1) }
        multiTaskQueue.addOperation { print("任务2开始"); sleep(2) }
        multiTaskQueue.addOperation { print("任务3开始"); sleep(3) }
        
        multiTaskQueue.waitUntilAllOperationsAreFinished()
        
        
        let highPriorityQueue = DispatchQueue.global(qos: .userInitiated)
        let lowPriorityQueue = DispatchQueue.global(qos: .utility)
        
        
        
        
        let semaphore = DispatchSemaphore(value: 1)
        
        lowPriorityQueue.async {
            semaphore.wait()
            for i in 0...10 {
                print(i)
            }
            semaphore.signal()
        }
        
        print(100)
        highPriorityQueue.async {
            print(200)
            highPriorityQueue.sync {
                print(300)
            }
            print(400)
        }
        
        highPriorityQueue.async {
            semaphore.wait()
            for i in 11...20 {
                print(i)
            }
            semaphore.signal()
        }
        
        
        
        
    }


}

