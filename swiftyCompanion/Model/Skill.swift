//
//  Skill.swift
//  swiftyCompanion
//
//  Created by Martin SIREAU on 20/10/2017.
//  Copyright © 2017 Martin SIREAU. All rights reserved.
//

import Foundation

struct Skill {
    let name : String
    let level : Float
    let percent : Float
    
    init(name: String, level: Float) {
        self.name = name
        self.level = level
        self.percent = self.level.truncatingRemainder(dividingBy: Float(Int(self.level)))
    }
}
