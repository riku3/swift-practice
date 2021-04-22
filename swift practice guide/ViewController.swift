//
//  ViewController.swift
//  swift practice guide
//
//  Created by riku on 2021/04/22.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        hoge()
    }
    
    func hoge() {
        APIClient.UserGet.request(completion: { user in
            self.idLabel.text = user.id
            self.descriptionLabel.text = user.description
        })
    }
}

struct User: Codable {
    var id: String
    var description: String
}
struct APIClient {
    struct UserGet: APIConfigure {
        static var path = "https://qiita.com/api/v2/users/akeome"
        typealias ResponseEntity = User
    }
}

protocol APIConfigure {
    associatedtype ResponseEntity: Codable
    
    static var path: String { get }
    static func request(completion: ((ResponseEntity) -> Void)?)
}

extension APIConfigure {
    static func request(completion: ((ResponseEntity) -> Void)?) {
        AF
            .request(Self.path)
            .response(completionHandler: {response in
                guard let data = response.data,
                      let entity = try? JSONDecoder().decode(ResponseEntity.self, from: data) else {
                    return
                }
                completion?(entity)
            })
    }
}
