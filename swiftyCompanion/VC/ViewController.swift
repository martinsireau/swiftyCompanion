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
    
    
    @IBOutlet weak var fetchDataLbl: UILabel!
    @IBOutlet weak var mySpinWheel: UIActivityIndicatorView!
    @IBOutlet weak var myTextField: UITextField!
    
    func getUserInfo(myJson: JSON) {
        
        if (myJson[0].isEmpty) {
            let alert = UIAlertController(title: "Info", message: "No Matching profiles with this Login", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            fetchDataLbl.isHidden = true
            mySpinWheel.stopAnimating()
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            return
        }
        print(myJson[0]["login"].stringValue)
        let userName = myJson[0]["login"].stringValue
        let userID = myJson[0]["id"].stringValue
        if let myAPI42 = API42 {
            myAPI42.getUserDatas(userID: userID, loginStr: userName)
        }
    }
    
    func getUserData(myJson: JSON) {
        let userDataVC = self.storyboard?.instantiateViewController(withIdentifier: "UserDatasViewController") as! UserDatasViewController

        userDataVC.myJson = myJson
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        self.navigationController?.pushViewController(userDataVC, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchDataLbl.isHidden = true
        mySpinWheel.stopAnimating()
        mySpinWheel.hidesWhenStopped = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        API42 = API42Controller(del: self)
        API42!.getToken()
    }
    
    @IBAction func SearchLogin(_ sender: Any) {
        if myConst.token != nil {
            if let userId = myTextField.text, let myAPI42 = API42 {
                fetchDataLbl.isHidden = false
                self.mySpinWheel.startAnimating()
                myAPI42.getUsers(loginStr: userId)
            }
        } else {
            print("ERROR WITH BEARER")
        }
    }
}
