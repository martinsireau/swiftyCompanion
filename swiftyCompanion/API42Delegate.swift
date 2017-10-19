//
//  API42Delegate.swift
//  swiftyCompanion
//
//  Created by Martin SIREAU on 17/10/2017.
//  Copyright © 2017 Martin SIREAU. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol API42Delegate {
    func getUserInfo(myJson: JSON)
    func getUserData(myJson: JSON)
}
