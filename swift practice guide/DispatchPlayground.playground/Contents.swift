import UIKit
import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

//let queue = DispatchQueue.global(qos: .userInitiated)
//queue.async {
//    Thread.isMainThread
//    print("非同期の処理")
//}

let quere = DispatchQueue.global(qos: .userInitiated)
quere.async {
    Thread.isMainThread
    print("非同期")
    let queue = DispatchQueue.main
    queue.async {
        Thread.isMainThread
        print("メインスレッド")
    }
}

func runAsynchronousTask(handler: @escaping (Int) -> Void) {
    let globalQueue = DispatchQueue.global()
    globalQueue.async {
        let result = Array(0...10000).reduce(0, +)
        
        let mainQueue = DispatchQueue.main
        mainQueue.async {
            handler(result)
        }
    }
}

runAsynchronousTask() { result in
    print(result)
}
