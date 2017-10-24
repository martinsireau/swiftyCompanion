//
//  Skill.swift
//  swiftyCompanion
//
//  Created by Martin SIREAU on 20/10/2017.
//  Copyright © 2017 Martin SIREAU. All rights reserved.
//

import Foundation

struct Project{
    let name : String
    let level : Int
    let slug : String
    
    init(name: String, level: Int, slug: String) {
        self.name = name
        self.level = level
        self.slug = slug
    }
}
