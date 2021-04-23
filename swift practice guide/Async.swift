//
//  Async.swift
//  swift practice guide
//
//  Created by riku on 2021/04/24.
//

import Foundation
import Dispatch

class Async {
    func getAsync(completion: @escaping (Int) -> Void) -> Void {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            completion(4)
        }
    }
}
