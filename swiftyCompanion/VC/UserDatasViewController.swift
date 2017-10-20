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
    @IBOutlet weak var myProgressView: UIProgressView!
    
    var myJson = JSON()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Profile"
        print(myJson)
        
        userPic.layer.cornerRadius = userPic.frame.size.width / 2
        userPic.clipsToBounds = true
        userPic.layer.borderWidth = 4.0
        userPic.layer.borderColor = UIColor.lightGray.cgColor
        
        myProgressView.transform = myProgressView.transform.scaledBy(x: 1, y: 4)
//        myProgressView.layer.cornerRadius = myProgressView.frame.size.width / 2
//        myProgressView.clipsToBounds = true
    }

}
