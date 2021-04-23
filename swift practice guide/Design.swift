//
//  Design.swift
//  swift practice guide
//
//  Created by riku on 2021/04/22.
//

import Foundation

var temporaryData: String?
var tempDataStruct: String?

class Some {
    func main() {
        var someClass: SomeClass? = SomeClass()
        print(temporaryData)
        someClass = nil
        print(temporaryData)
        
        var someStruct: SomeStruct2? = SomeStruct2()
        print(tempDataStruct)
        someStruct?.delete()
        print(tempDataStruct)
        
    }
}

class SomeClass {
    init() {
        temporaryData = "temp"
    }
    deinit {
        temporaryData = nil
    }
}

struct SomeStruct2 {
    init() {
        tempDataStruct = "temp"
    }
    func delete() {
        tempDataStruct  = nil
    }
}
