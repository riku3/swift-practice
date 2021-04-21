//
//  AlertError.swift
//  swift practice guide
//
//  Created by riku on 2021/04/22.
//

import UIKit

enum WebAPIError: Error {
    case connectionError
    case fatalError
    
    var title: String {
        switch self {
        case .connectionError:
            return "通信エラー"
        case .fatalError:
            return "致命的エラー"
        }
    }
    
    var message: String {
        switch self {
        case .connectionError:
            return localizedDescription + "再試行してください"
        case .fatalError:
            return "サポート窓口に連絡してください"
        }
    }
}

extension UIAlertController {
    convenience init(webAPIError: WebAPIError) {
        self.init(title: webAPIError.title,
                  message: webAPIError.message,
                  preferredStyle: .alert)
    }
}

let error = WebAPIError.connectionError
let alertController = UIAlertController(webAPIError: error)
