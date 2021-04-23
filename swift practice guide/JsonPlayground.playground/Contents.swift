import UIKit
import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

struct SomeStruct: Codable {
    let value: Int
}

let someStruct = SomeStruct(value: 1)

let jsonEncoder = JSONEncoder()
let encodedJSONdata = try! jsonEncoder.encode(someStruct)
let encodedJSONString = String(data: encodedJSONdata, encoding: .utf8)!
print("Encode:",encodedJSONdata)
print("Encode:",encodedJSONString)

let jsonDecoder = JSONDecoder()
let decodedSomeStruct = try! jsonDecoder.decode(SomeStruct.self, from: encodedJSONdata)
print("Decode:",decodedSomeStruct)
