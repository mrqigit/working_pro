//
//  GCDOrThreadCtrl.swift
//  CLX
//
//  Created by MrQi on 2024/5/8.
//

import UIKit

class GCDOrThreadCtrl: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        main_async()
        thread_async()
    }
}

extension GCDOrThreadCtrl {
    func main_async() {
        let queue = DispatchQueue(label: "com.trade.async")
        queue.asyncAfter(deadline: DispatchTime(uptimeNanoseconds: 2), execute: DispatchWorkItem(block: {
            print("----------1-----")
        }))
        
        queue.async {
            print("---------2------")
        }
    }
    
    func thread_async() {
        let thread = Thread(target: self, selector: #selector(threadAction), object: nil)
        thread.start()
        
        performSelector(onMainThread: #selector(mainThreadUntilAction), with: nil, waitUntilDone: true)
        performSelector(onMainThread: #selector(mainThreadAction), with: nil, waitUntilDone: false)
        
        perform(#selector(modelsThreadAction), with: nil, afterDelay: 5, inModes: [.common])

        
    }
    
    @objc
    func threadAction() {
        print("---------3------")
        
        perform(#selector(childThreadUntilAction), on: Thread.current, with: nil, waitUntilDone: true)
        perform(#selector(childThreadAction), on: Thread.current, with: nil, waitUntilDone: false)
        
        perform(#selector(modelsChildThreadAction), on: Thread.current, with: nil, waitUntilDone: true, modes: ["common"])
    }
    
    @objc
    func mainThreadUntilAction() {
        print("---------4------")
    }
    
    @objc
    func mainThreadAction() {
        print("---------5------")
    }
    
    @objc
    func childThreadUntilAction() {
        print("---------6------")
    }
    
    @objc
    func childThreadAction() {
        print("---------7------")
    }
    
    @objc
    func modelsThreadAction() {
        print("---------8------")
    }
    
    @objc
    func modelsChildThreadAction() {
        print("---------9------")
    }
}
