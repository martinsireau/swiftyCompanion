//
//  UserDatasViewController.swift
//  swiftyCompanion
//
//  Created by Martin SIREAU on 19/10/2017.
//  Copyright © 2017 Martin SIREAU. All rights reserved.
//

import UIKit
import SwiftyJSON

class UserDatasViewController: UIViewController, UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var userPic: UIImageView!
    @IBOutlet weak var myProgressView: UIProgressView!
    
    @IBOutlet weak var theScrollView: UIScrollView!
    @IBOutlet weak var skillTableView: UITableView!
    @IBOutlet weak var userFullName: UILabel!
    
    let screenHeight = UIScreen.main.bounds.height
    let scrollViewContentHeight = 1200 as CGFloat
    
    var myJson = JSON()
    var userDatas : UserDatas?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Profile"
        print(myJson)
        
        userPic.layer.cornerRadius = userPic.frame.size.width / 2
        userPic.clipsToBounds = true
        userPic.layer.borderWidth = 4.0
        userPic.layer.borderColor = UIColor.lightGray.cgColor
        
        myProgressView.transform = myProgressView.transform.scaledBy(x: 1, y: 4)
        myProgressView.layer.cornerRadius = 5
        myProgressView.clipsToBounds = true
        
        theScrollView.contentSize = CGSize(width: self.view.frame.width, height: scrollViewContentHeight)
//        scrollView.delegate = self
//        tableView.delegate = self
        theScrollView.bounces = false
        skillTableView.bounces = false
        skillTableView.isScrollEnabled = true

        skillTableView.rowHeight  = UITableViewAutomaticDimension
        skillTableView.estimatedRowHeight = 140
        
        skillTableView.separatorStyle = .none

        userDatas = UserDatas(myJson: myJson)
        userFullName.text = userDatas?.name
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = skillTableView.dequeueReusableCell(withIdentifier: "myCell")
        var cell = UITableViewCell(style: .default, reuseIdentifier: "myCell")
        if (tableView.isEqual(skillTableView)){
            cell = self.skillTableView.dequeueReusableCell(withIdentifier: "myCell") as! SkillTableViewCell
        } else {
            cell.textLabel?.text = "lol\(indexPath.row)"
        }
        
        return cell
    }
    
    
}
