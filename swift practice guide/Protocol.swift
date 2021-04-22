//
//  Protocol.swift
//  swift practice guide
//
//  Created by riku on 2021/04/22.
//

import Foundation

func main() {
    printIfEqual(123, 123)
    printIfEqual("abc", "abc")
    
    someFunction(x: some)
}

func printIfEqual<T: Equatable>(_ arg1: T, _ arg2: T) {
    if arg1 == arg2 {
        print("Both are \(arg1)")
    }
}

protocol SomeProtocl1 {
    var variable1: Int { get }
}
protocol SomeProtocl2 {
    var variable2: Int { get }
}
struct SomeStruct: SomeProtocl1, SomeProtocl2 {
    var variable1: Int
    var variable2: Int
}
func someFunction(x: SomeProtocl1 & SomeProtocl2) {
    _ = x.variable1 + x.variable2
}
let some = SomeStruct(variable1: 1 , variable2: 2)

