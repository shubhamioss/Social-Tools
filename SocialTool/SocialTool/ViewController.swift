//
//  ViewController.swift
//  SocialTool
//
//  Created by Mac on 30/04/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let vc = Theme12WalkThroughViewController(nibName: "Theme12WalkThroughViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }


}

