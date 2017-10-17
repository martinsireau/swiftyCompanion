//
//  ViewController.swift
//  swiftyCompanion
//
//  Created by Martin SIREAU on 10/16/17.
//  Copyright © 2017 Martin SIREAU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var token : String?
    
    func getToken() {
        let UID : String = "337fbe7df055e5125566eed492cb7b1c23bbd0b1a6483e08ff79c7d073dfbcbb"
        let secret : String = "c4a15c58582ef78de1f443b232479b35896bfcc75a71fdf2749a048f04513d23"
        
        let url = NSURL(string: "https://api.intra.42.fr/oauth/token")
        let request = NSMutableURLRequest(url: url! as URL)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded;charset=UTF-8", forHTTPHeaderField: "Content-Type")
        request.httpBody = "grant_type=client_credentials&client_id=\(UID)&client_secret=\(secret)".data(using: String.Encoding.utf8)
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            (data, response, error) in
            if let err = error {
                print (err)
            } else if let d = data {
                do {
                    if let dic : NSDictionary = try JSONSerialization.jsonObject(with: d, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                        if let t = dic["access_token"] as? String {
                            self.token = t
                            print(self.token ?? "lol")
                        }
                    }
                } catch (let err) {
                    print (err)
                }
            }
        }
        task.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getToken()
        
    }
}
