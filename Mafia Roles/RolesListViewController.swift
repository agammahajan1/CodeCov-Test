//
//  RolesListViewController.swift
//  Mafia Roles
//
//  Created by agam mahajan on 06/04/19.
//  Copyright © 2019 agam. All rights reserved.
//

import UIKit

class RolesListViewController: UIViewController {
    let roles = ["Mafia", "Villager", "Doctor", "Detective"]
    
    var roleValues: [String: Int] = ["Mafia" : 0, "Villager": 0, "Doctor": 0, "Detective": 0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func tapOnStart(_ sender: Any) {
        for role in roleValues {
            if role.value < 1 {
                let alert = UIAlertController(title: "Select Atlest One Role From Each Category", message: nil, preferredStyle: .alert)
                let action = UIAlertAction(title: "Okay", style: .default) { action in
                    alert.dismiss(animated: true, completion: nil)
                }
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
                return
            }
        }
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "RoleAssignViewController") as! RoleAssignViewController
        vc.roleValues = roleValues
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension RolesListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoleTableViewCell", for: indexPath) as! RoleTableViewCell
        cell.populateData(withName: roles[indexPath.row])
        cell.delgate = self
        return cell
    }
}

extension RolesListViewController: RoleTableViewCellDelegate {
    func didChangeQuantity(forItem name: String, withValue value: Int) {
        roleValues[name] = value
        print(roleValues)
    }
}

protocol RoleTableViewCellDelegate: class {
    func didChangeQuantity(forItem name: String, withValue value: Int)
}

class RoleTableViewCell: UITableViewCell {
    @IBOutlet weak var roleName: UILabel!
    @IBOutlet weak var number: UILabel!
    
    private var name: String = ""
    private var quantity: Int = 0 {
        didSet {
            number.text = "\(quantity)"
            delgate?.didChangeQuantity(forItem: name, withValue: quantity)
        }
    }
    weak var delgate: RoleTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func populateData(withName text: String) {
        name = text
        roleName.text = text
    }
    
    @IBAction func minusButtonTapped(_ sender: Any) {
        if quantity > 0 {
            quantity -= 1
        }
    }
    @IBAction func plusButtonTapped(_ sender: Any) {
        quantity += 1
    }
}
