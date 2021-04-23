//
//  Throw.swift
//  swift practice guide
//
//  Created by riku on 2021/04/24.
//

import Foundation

struct SomeError: Error {}

class Throw {
    func throwableFunction(throwsError: Bool) throws {
        if throwsError {
            throw SomeError()
        }
    }
}
