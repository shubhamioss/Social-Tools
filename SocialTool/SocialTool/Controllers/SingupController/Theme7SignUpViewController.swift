//
//  Theme7SignUpViewController.swift
//  Prokit
//
//  Created by ""-ios on 26/11/19.
//  Copyright © 2019 ""-ios. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore
import Keychain

class Theme7SignUpViewController: UIViewController {
    
    //MARK:-
    //MARK:- Outlets.
    
    @IBOutlet weak var vwContinue: UIView!
    @IBOutlet weak var vwDetail: UIView!
    @IBOutlet weak var usernameTxtfld: UITextField!
    @IBOutlet weak var btnRightArrow: UIButton!
    @IBOutlet weak var ConstraintSafeArea: NSLayoutConstraint!
    
    @IBOutlet weak var btnContinue: UIButton!
    
    //MARK:-
    //MARK:- UIview Life Cycles.
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        vwDetail.layer.masksToBounds = false
        vwDetail.layer.shadowRadius = 3.0
        vwDetail.layer.shadowColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        vwDetail.layer.shadowOffset = CGSize(width: 8, height: 8)
        vwDetail.layer.shadowOpacity = 2
        
        SetUpObject()
    }
   
    //MARK:-
    //MARK:- SetUpObject Methods.
    
    func SetUpObject() {
        if #available(iOS 11.0, *) {
                     
        } else {
            // Fallback on earlier versions
            ConstraintSafeArea.constant = UIApplication.shared.statusBarFrame.size.height
        }

        self.btnRightArrow.layer.cornerRadius = self.btnRightArrow.layer.frame.height / 2
        self.vwContinue.layer.cornerRadius = 15.0
        self.vwDetail.layer.cornerRadius = 15.0
        self.vwContinue.layer.masksToBounds = false;
              
//        THelper.btnsetShadowWithColor(view: self.vwContinue, Color: THEME7_PRIMARY_COLOR2)
//        THelper.setShadowWithColor(view: self.vwDetail, Color: COMMON_SHADOW_COLOR)
    }
    
    //MARK:-
    //MARK:- UIButton Clicked Events.
    
    @IBAction func btnSignIn_Clicked(_ sender: Any) {
      //  THelper.btnAnimationLong(btn: btnContinue)
    }
    
    @IBAction func btnBack_Clicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnContinue(_ sender: Any) {
        let db = Firestore.firestore()
        db.collection("Users").document("\(usernameTxtfld.text ?? "shubhamios")").setData([
            "name": "\(usernameTxtfld.text ?? "shubhamios")",
            "Coins": 200
        ]) { err in
            if let err = err {
                print(err)
            } else {
                
                Keychain.save("userIn", forKey: "loggedinUser")
                Keychain.save("\(self.usernameTxtfld.text ?? "shubhamios")", forKey: "CurrentUser")

                let pieVC = Theme7DashBoardController()
                pieVC.modalTransitionStyle = UIModalTransitionStyle.coverVertical
                pieVC.modalPresentationStyle = .fullScreen
                self.present(pieVC, animated: true, completion: nil)
                
            }
        }
    }
    
    
}
