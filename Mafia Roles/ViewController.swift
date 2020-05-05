//
//  ViewController.swift
//  Mafia Roles
//
//  Created by agam mahajan on 06/04/19.
//  Copyright © 2019 agam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func tapOnStart(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "RolesListViewController") as! RolesListViewController
        let navigationVC = UINavigationController(rootViewController: vc)
        self.present(navigationVC, animated: true, completion: nil)
    }
    
}

