//
//  UserDatasViewController.swift
//  swiftyCompanion
//
//  Created by Martin SIREAU on 19/10/2017.
//  Copyright © 2017 Martin SIREAU. All rights reserved.
//

import UIKit
import SwiftyJSON

class UserDatasViewController: UIViewController {
    
    @IBOutlet weak var userPic: UIImageView!
    
    var myJson = JSON()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Profile"
        print(myJson)
        
        self.userPic.layer.cornerRadius = self.userPic.frame.size.width / 2
        self.userPic.clipsToBounds = true
        self.userPic.layer.borderWidth = 4.0
        self.userPic.layer.borderColor = UIColor.lightGray.cgColor
    }

}
