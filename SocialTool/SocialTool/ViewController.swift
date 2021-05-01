//
//  ViewController.swift
//  SocialTool
//
//  Created by Mac on 30/04/21.
//

import UIKit
import Keychain

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        let data = Keychain.load("loggedinUser")
        
        if data == "userIn"{
            let vc = Theme7DashBoardController(nibName: "Theme7DashBoardController", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        }else
        {
            let vc = Theme12WalkThroughViewController(nibName: "Theme12WalkThroughViewController", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

}

