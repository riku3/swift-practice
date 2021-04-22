//
//  generics.swift
//  swift practice guide
//
//  Created by riku on 2021/04/22.
//

import Foundation

class Generics {
    func main() {
        _ = sorted([3,2,1])
        
        let array = [1,2,3]
        let set = [3,2,1]
        _  = ["2","2","2"]
        _ = concat(array, set)
//        _ = concat(array, set2)
        
        let intContainer = Container<Int>(content: 2)
        let stringContainer = Container(content: "abc")
        
        let stringPair = Pair(first: "abc", second: "def")
        stringPair.hasElement(containing: "e")
//        let intPair = Pair(first: 1, second: 2)
//        intPair.hasElement(containing: "e")
    }

    func sorted<T: Collection>(_ arg: T) -> [T.Element] where T.Element: Comparable {
        return arg.sorted()
    }
    
    func concat<T: Collection, U: Collection>(_ arg1: T, _ arg2: U) -> [T.Element] where T.Element == U.Element {
        return Array(arg1) + Array(arg2)
    }
}

struct Container<Content> {
    var content: Content
}

struct Pair<Element> {
    var first: Element
    var second: Element
}

extension Pair where Element == String {
    func hasElement(containing character: Character) -> Bool {
        return first.contains(character) || second.contains(character)
    }
}
