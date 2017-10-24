//
//  API42Controller.swift
//  swiftyCompanion
//
//  Created by Martin SIREAU on 10/17/17.
//  Copyright © 2017 Martin SIREAU. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class API42Controller {
    
    var delegate : API42Delegate?
    
    init(del: API42Delegate) {
        self.delegate = del
    }

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
                            myConst.token = t
                            let defaults:UserDefaults = UserDefaults.standard
                            defaults.set(t, forKey: "token_value")
                            print(myConst.token!)
                            DispatchQueue.main.async {
                                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                            }
                        }
                    }
                } catch (let err) {
                    print (err)
                }
            }
        }
        task.resume()
    }
    
    // MARK GET user
    
    func getUsers(loginStr: String) {
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(myConst.token!)",
            "Accept": "application/json"
        ]
        
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
        Alamofire.request("https://api.intra.42.fr/v2/users?filter[login]=\(loginStr)", headers: headers).responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
                let myJson = JSON(json)
                self.delegate?.getUserInfo(myJson: myJson)
            }
        
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
            }
        }
    }
    
    // MARK GET User Data
    
    func getUserDatas(userID: String, loginStr: String) {
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(myConst.token!)",
            "Accept": "application/json"
        ]
        
        Alamofire.request("https://api.intra.42.fr/v2/users/\(userID)?filter[login]=\(loginStr)", headers: headers).responseJSON { response in
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
                let myJson = JSON(json)
                self.delegate?.getUserData(myJson: myJson)
            }
        }
    }

}
