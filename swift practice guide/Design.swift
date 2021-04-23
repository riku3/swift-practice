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
        
        let delegate = TwoPersonsGameDelegate()
        let twoPersonGame = Game()
        twoPersonGame.delegate = delegate
        twoPersonGame.start()
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

protocol GameDelegate: AnyObject {
    var numberOfPlayers: Int { get }
    func gameDidStart(_ game: Game)
    func gameDidEnd(_ game: Game)
}

class TwoPersonsGameDelegate: GameDelegate {
    var numberOfPlayers: Int { return 2}
    
    func gameDidStart(_ game: Game) {
        print("start")
    }
    
    func gameDidEnd(_ game: Game) {
        print("end")
    }
}

class Game {
    weak var delegate: GameDelegate?
    
    func start() {
        print(delegate?.numberOfPlayers ?? 0)
        delegate?.gameDidStart(self)
        print("playing")
        delegate?.gameDidEnd(self)
    }
}
