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
    let correction : Int
    let level : Float
    let imgUrl : URL
    var allSkills : [Skill]
//    let skills : [Skill]
    
    init(myJson: JSON) {
        self.name = myJson["displayname"].string!
        self.login = myJson["login"].string!
        self.phone = myJson["phone"].string!
        self.wallet = myJson["wallet"].int!
        self.correction = myJson["correction_point"].int!
        self.level = myJson["cursus_users"][0]["level"].float!
        self.imgUrl = myJson["image_url"].url!
        
        self.allSkills = [Skill]()
        let theSkills = myJson["cursus_users"][0]["skills"].arrayValue
        for skill in theSkills{
            let mySkill = Skill(name: skill["name"].string!, level:skill["level"].float!)
            self.allSkills.append(mySkill)
        }
    }
}
