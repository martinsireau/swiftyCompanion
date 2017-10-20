//
//  userDatas.swift
//  swiftyCompanion
//
//  Created by Martin SIREAU on 20/10/2017.
//  Copyright © 2017 Martin SIREAU. All rights reserved.
//

import Foundation
import SwiftyJSON

struct UserDatas {
    let name : String
    let login : String
    let phone : String
    let wallet : Int
//    let correction : String
//    let level : Int
//    let skills : [Skill]
    
    init(myJson: JSON) {
        self.name = myJson["displayname"].string!
        self.login = myJson["login"].string!
        self.phone = myJson["phone"].string!
        self.wallet = myJson["wallet"].int!

    }
}
