//
//  ViewController.swift
//  swiftyCompanion
//
//  Created by Martin SIREAU on 10/16/17.
//  Copyright © 2017 Martin SIREAU. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController, API42Delegate {
    
    var API42 : API42Controller?
    
    @IBOutlet weak var myTextField: UITextField!
    
    func getUserInfo(myJson: JSON) {
        print(myJson[0]["login"].stringValue)
        let userName = myJson[0]["login"].stringValue
        let userID = myJson[0]["id"].stringValue
        if let myAPI42 = API42 {
            myAPI42.getUserDatas(userID: userID, loginStr: userName)
        }
    }
    
    func getUserData(myJson: JSON) {
        print(myJson)
        let userDataVC = self.storyboard?.instantiateViewController(withIdentifier: "UserDatasViewController") as! UserDatasViewController

        userDataVC.myJson = myJson
        self.navigationController?.pushViewController(userDataVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        API42 = API42Controller(del: self)
        API42!.getToken()
    }
    
    @IBAction func SearchLogin(_ sender: Any) {
        if myConst.token != nil {
            if let userId = myTextField.text, let myAPI42 = API42 {
                myAPI42.getUsers(loginStr: userId)
            }
        } else {
            print("ERROR WITH BEARER")
        }
    }
}
