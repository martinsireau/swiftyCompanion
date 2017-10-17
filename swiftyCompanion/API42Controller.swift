//
//  API42Controller.swift
//  swiftyCompanion
//
//  Created by Martin SIREAU on 10/17/17.
//  Copyright © 2017 Martin SIREAU. All rights reserved.
//

import Foundation
import Alamofire

class API42Controller {
    
    // MARK GET token
    
    func getToken(){
        Alamofire.request("s").responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
            }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
            }
        }
    }
    
    // MARK GET user
    
    func getUsers(loginStr: String) {
        Alamofire.request("https://api.intra.42.fr/v2/users?filter[login]=\(loginStr)").responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
            }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
            }
        }
    }
}
