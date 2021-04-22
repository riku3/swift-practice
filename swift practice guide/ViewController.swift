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
        AF
            .request("https://qiita.com/api/v2/users/akeome")
            .response(completionHandler: { response in
                guard let data = response.data,
                      let user = try? JSONDecoder().decode(User.self, from: data) else {
                    return
                }
                self.idLabel.text = user.id
                self.descriptionLabel.text = user.description
            })
    }
    
    


}

struct User: Codable {
    var id: String
    var description: String
}

