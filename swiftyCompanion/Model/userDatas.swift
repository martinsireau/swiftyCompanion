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
    let name : String?
    let login : String?
    let phone : String?
    let wallet : Int?
    let correction : Int?
    let level : Float?
    let imgUrl : URL?
    var allSkills : [Skill]
    var allProjects : [Project]
    
    init(myJson: JSON) {
        if let name = myJson["displayname"].string{
            self.name = name
        } else { self.name = nil }
        if let login = myJson["login"].string{
            self.login = login
        } else { self.login = nil }
        if let phone = myJson["phone"].string {
            self.phone = phone
        } else { self.phone = nil }
        if let wallet = myJson["wallet"].int{
            self.wallet = wallet
        } else { self.wallet = nil }
        if let correction = myJson["correction_point"].int{
            self.correction = correction
        } else { self.correction = nil }
        if let level = myJson["cursus_users"][0]["level"].float{
            self.level = level
        } else { self.level = nil }
        if let img = myJson["image_url"].url{
            if img.absoluteString == "https://cdn.intra.42.fr/images/default.png" {
                self.imgUrl = URL(string:  "https://cdn.intra.42.fr/users/medium_default.png")
            } else {
                self.imgUrl = img
            }
        } else { self.imgUrl = URL(fileURLWithPath: "https://cdn.intra.42.fr/users/medium_default.png") }
    
        self.allSkills = [Skill]()
        let theSkills = myJson["cursus_users"][0]["skills"].arrayValue
        for skill in theSkills{
            if let skName = skill["name"].string, let sklLevel = skill["level"].float{
                let mySkill = Skill(name: skName, level:sklLevel)
                self.allSkills.append(mySkill)
            }
        }
        
        self.allProjects = [Project]()
        let theProjects = myJson["projects_users"].arrayValue
        for proj in theProjects{
            if let projName = proj["project"]["name"].string,
                let level = proj["final_mark"].int,
                let checkSlug = proj["project"]["slug"].string{
                    let myProj = Project(name: projName, level: level, slug: checkSlug)
                    self.allProjects.append(myProj)
            }
        }
    }
}
