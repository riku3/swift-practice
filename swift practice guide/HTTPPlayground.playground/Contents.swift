import UIKit
import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let url = URL(string: "https://api.github.com/search/repositories?q=swift")!
let urlRequest = URLRequest(url: url)

let session = URLSession.shared
let task = session.dataTask(with: urlRequest) {
    data, response, error in
    print(response)
    if let response = response as? HTTPURLResponse {
        response.statusCode
        
        response.allHeaderFields["Date"]
        
        response.allHeaderFields["Content-Type"]
        
        print(response)
        print(data)
    }
}

task.resume()
