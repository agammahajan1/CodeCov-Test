//
//  RoleAssignViewController.swift
//  Mafia Roles
//
//  Created by agam mahajan on 06/04/19.
//  Copyright © 2019 agam. All rights reserved.
//

import UIKit

class RoleAssignViewController: UIViewController {
    
    @IBOutlet weak var roleName: UILabel!
    @IBOutlet weak var revealButton: UIButton!
    
    var roleValues: [String: Int] = ["Mafia" : 0, "Villager": 0, "Doctor": 0, "Detective": 0]
    
    var allRoles: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        for role in roleValues {
            for _ in 0..<role.value {
                allRoles.append(role.key)
            }
        }
    }
    
    @IBAction func tapOnReveal(_ sender: Any) {
        let randomInt = Int.random(in: 0..<allRoles.count)
        roleName.text = allRoles[randomInt]
        roleName.isHidden = false
        revealButton.isHidden = true
        allRoles.remove(at: randomInt)
    }
    
    @IBAction func tapOnNextPerson(_ sender: Any) {
        roleName.isHidden = true
        revealButton.isHidden = false
    }
}
