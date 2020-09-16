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
        
        concurrentInterview4()

    }
    
    // MARK: - serialInterview
    /// 串行同步
    func serialInterview1() {
        
        // 在串行队列上进行同步操作，所有任务将顺序发生，所以第一段的打印结果一定是 1234；都在主线程完成，同步任务不会开启新的线程
        
        let serialQueue = DispatchQueue.init(label: "serialQueue")
        // 串行同步都是在主线程
        serialQueue.sync {
          print("执行任务1 -- \(Thread.current)")
        }
        print("执行任务2 -- \(Thread.current)")
        serialQueue.sync {
          print("执行任务3 -- \(Thread.current)")
        }
        print("执行任务4 -- \(Thread.current)")
    }
    
    /// 串行异步
    func serialInterview2() {
        
        // TODO: 1,2,3,4  1,2,4,3  2,1,3,4  2,1,4,3  2,4,1,3
        // FIXME: 2,4,3,1  2,3,1,4  2,3,4,1
        // !!!:  1 一定在 3 之前打印出来,因为前者在后者之前派发，串行队列一次只能执行一个任务，所以一旦派发完成就执行。同理 2 一定在 4 之前打印 2 一定在 3 之前打印。
        
        let serialQueue = DispatchQueue.init(label: "serialQueue")

        serialQueue.async {
          print("执行任务1 -- \(Thread.current)")
        }
        print("执行任务2 -- \(Thread.current)")
        serialQueue.async {
          print("执行任务3 -- \(Thread.current)")
        }
        print("执行任务4 -- \(Thread.current)")
        
    }
    
    
    /// 串行异步中嵌套同步
    func serialInterview3() {
        
        // 对同一个串行队列中进行异步、同步嵌套。这里会构成死锁
        // !!!: 在串行队列上执行同步操作容易造成死锁，在并发队列上则不用担心。
        // TODO: 1,2,5 1,5,2
        let serialQueue = DispatchQueue.init(label: "serialQueue")
        
        print("执行任务1 -- \(Thread.current)")
        serialQueue.async {
            print("执行任务2 -- \(Thread.current)")
            serialQueue.sync {
                print("执行任务3 -- \(Thread.current)")
            }
            print("执行任务4 -- \(Thread.current)")
        }
        print("执行任务5 -- \(Thread.current)")
        
        
    }
    
    /// 串行同步中嵌套异步
    func serialInterview4() {
        // !!!: 1一定在最前，2 一定在 4 前，4 一定在 5 前
        // TODO: 1,2,3,4,5  1,2,4,5,3  1,2,4,3,5
        let serialQueue = DispatchQueue.init(label: "serialQueue")
        
        print("执行任务1 -- \(Thread.current)")
        serialQueue.sync {
            print("执行任务2 -- \(Thread.current)")
            serialQueue.async {
                print("执行任务3 -- \(Thread.current)")
            }
            print("执行任务4 -- \(Thread.current)")
        }
        print("执行任务5 -- \(Thread.current)")
        
        
    }
    
    // MARK: - concurrentInterview
    /// 并发同步
    func concurrentInterview1() {
        
        // 并行同步都是在主线程
        // TODO:1,2,3,4
        let concurrentlQueue = DispatchQueue.init(label: "concurrentQueue", attributes: .concurrent)
        
        concurrentlQueue.sync {
          print("执行任务1 -- \(Thread.current)")
        }
        print("执行任务2 -- \(Thread.current)")
        concurrentlQueue.sync {
          print("执行任务3 -- \(Thread.current)")
        }
        print("执行任务4 -- \(Thread.current)")
    }
    
    /// 并发异步
    
    func concurrentInterview2() {
        
        // TODO: 1,2,3,4  1,2,4,3  2,1,3,4  2,3,1,4  2,3,4,1  2,4,1,3  2,1,4,3  2,1,3,4
        // !!!:  只能保证 24 顺序执行,2肯定在 3 前面
        
        let concurrentQueue = DispatchQueue.init(label: "concurrentQueue", attributes: .concurrent)

        concurrentQueue.async {
          print("执行任务1 -- \(Thread.current)")
        }
        print("执行任务2 -- \(Thread.current)")
        concurrentQueue.async {
          print("执行任务3 -- \(Thread.current)")
        }
        print("执行任务4 -- \(Thread.current)")
        
    }
    
    /// 并发异步中嵌套同步
    func concurrentInterview3() {
        
        // !!!: 3一定会在 4 前面，1、5在主线程 其他在子线程 1会优先输出，5的顺序不确定
        // TODO: 1,2,3,4,5  1,5,2,3,4  1,2,5,3,4 1,2,3,5,4
        // ???: 12534，12354
        let concurrentQueue = DispatchQueue.init(label: "concurrentQueue", attributes: .concurrent)
    
        let semaphore = DispatchSemaphore(value: 0)
        print("执行任务1 -- \(Thread.current)")
        concurrentQueue.async {
            print("执行任务2 -- \(Thread.current)")
            concurrentQueue.sync {
                print("执行任务3 -- \(Thread.current)")
            }
            semaphore.signal()
            print("执行任务4 -- \(Thread.current)")
        }
        semaphore.wait()
        print("执行任务5 -- \(Thread.current)")
        
    }
    
    
    // 并发同步中嵌套异步
    func concurrentInterview4() {
        // !!!: 1一定在最前，2 一定在 4 前，4 一定在 5 前
        // TODO: 1,2,3,4,5  1,2,4,5,3  1,2,4,3,5
        let concurrentQueue = DispatchQueue.init(label: "concurrentQueue", attributes: .concurrent)
        
        print("执行任务1 -- \(Thread.current)")
        concurrentQueue.sync {
            print("执行任务2 -- \(Thread.current)")
            concurrentQueue.async {
                print("执行任务3 -- \(Thread.current)")
            }
            print("执行任务4 -- \(Thread.current)")
        }
        print("执行任务5 -- \(Thread.current)")
        
    }
    
    //MARK: -  iOS 并发编程中的三大问题
    /// 竞态条件（Race Condition）。指两个或两个以上线程对共享的数据进行读写操作时，最终的数据结果不确定的情况。
    func interViewQuestion1() {
        var num = 0
        DispatchQueue.global().async {
            for _ in 1...10000 {
            num += 1
          }
        }

        for _ in 1...10000 {
          num += 1
        }
        
    }
    
    // 优先倒置（Priority Inverstion）:指低优先级的任务会因为各种原因先于高优先级任务执行
    func interViewQuestion2() {
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

        highPriorityQueue.async {
          semaphore.wait()
          for i in 11...20 {
            print(i)
          }
          semaphore.signal()
        }
    }
    
    /// 死锁问题（Dead Lock）:指两个或两个以上的线程，它们之间互相等待彼此停止执行，以获得某种资源，但是没有一方会提前退出的情况。iOS 中有个经典的例子就是两个 Operation 互相依赖：
    func interViewQuestion3() {
        let operationA = BlockOperation {
            print("operationA")
        }
        let operationB = BlockOperation {
            print("operationB")
        }

        operationA.addDependency(operationB)
        operationB.addDependency(operationA)
        
        operationA.start()
        operationB.start()
    }

    
}

