//
//  UserDatasViewController.swift
//  swiftyCompanion
//
//  Created by Martin SIREAU on 19/10/2017.
//  Copyright © 2017 Martin SIREAU. All rights reserved.
//

import UIKit
import SwiftyJSON
import SDWebImage

class UserDatasViewController: UIViewController, UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var userPic: UIImageView!
    @IBOutlet weak var myProgressView: UIProgressView!
    
    @IBOutlet weak var theScrollView: UIScrollView!
    @IBOutlet weak var skillTableView: UITableView!
    @IBOutlet weak var projectTableView: UITableView!
    
    @IBOutlet weak var userFullName: UILabel!
    @IBOutlet weak var login: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var wallet: UILabel!
    @IBOutlet weak var correctionPoint: UILabel!
    @IBOutlet weak var mainLevel: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    var allSkills = [Skill]()
    
    let screenHeight = UIScreen.main.bounds.height
    let scrollViewContentHeight = 1200 as CGFloat
    
    var myJson : JSON?
    var userDatas : UserDatas?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Profile"
        print(myJson!)
        
        userPic.layer.cornerRadius = userPic.frame.size.width / 2
        userPic.clipsToBounds = true
        userPic.layer.borderWidth = 4.0
        userPic.layer.borderColor = UIColor.lightGray.cgColor
        
        myProgressView.transform = myProgressView.transform.scaledBy(x: 1, y: 4)
        myProgressView.layer.cornerRadius = 5
        myProgressView.clipsToBounds = true
        
        theScrollView.contentSize = CGSize(width: self.view.frame.width, height: scrollViewContentHeight)
        theScrollView.bounces = false
        skillTableView.bounces = false
        skillTableView.isScrollEnabled = true

        skillTableView.rowHeight  = UITableViewAutomaticDimension
        skillTableView.estimatedRowHeight = 140
        projectTableView.rowHeight  = UITableViewAutomaticDimension
        projectTableView.estimatedRowHeight = 140

        
        skillTableView.separatorStyle = .none
//        projectTableView.separatorStyle = .none

        userDatas = UserDatas(myJson: myJson!)
        self.setData()
    }

    func setData(){
        userFullName.text = userDatas?.name
        login.text = userDatas?.login
        phone.text = userDatas?.phone
        wallet.text = "Wallet: \(String(describing: userDatas!.wallet))"
        correctionPoint.text = "Correction: \(userDatas!.correction)"
        
        let level = Int((userDatas?.level)!)
        let percent = (userDatas?.level)!.truncatingRemainder(dividingBy: Float(level)) * 100
        mainLevel.text = "Level: \(level) - \(Int(percent.rounded()))%"
        myProgressView.progress = percent/100
        
        userImage.sd_setImage(with: userDatas?.imgUrl, completed: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (tableView.isEqual(skillTableView)){
            return (userDatas?.allSkills.count)!
        }
        return (userDatas?.allProjects.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = skillTableView.dequeueReusableCell(withIdentifier: "myCell")
        if (tableView.isEqual(skillTableView)){
            let skillCell = self.skillTableView.dequeueReusableCell(withIdentifier: "myCell") as! SkillTableViewCell
            if let skillName = userDatas?.allSkills[indexPath.row].name {
                if let skillNumber = userDatas?.allSkills[indexPath.row].level {
                    skillCell.nameAndLevelLbl.text = "\(skillName) - \(skillNumber)"
                    skillCell.skillProgressBar.progress = (userDatas?.allSkills[indexPath.row].percent)!
                }
            }
            return skillCell
        }
        let cell = self.projectTableView.dequeueReusableCell(withIdentifier: "myCell") as! ProjectTableViewCell
        if let projectName = userDatas?.allProjects[indexPath.row].name, let projectLevel = userDatas?.allProjects[indexPath.row].level {
            cell.myLabel.text = "\(projectName) - \(projectLevel)"
        } else {
//            cell.textLabel?.text = "bite"
        }
        
        return cell
    }
}
