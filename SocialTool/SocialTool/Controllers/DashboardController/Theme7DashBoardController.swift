//
//  Theme7DashBoardController.swift
//  Eduction
//
//  Created by ""-ios on 26/11/19.
//  Copyright © 2019 ""-ios. All rights reserved.
//

import UIKit
import Keychain
import AVFoundation

class Theme7DashBoardController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //MARK:-
    //MARK:- Outlets.
    
    @IBOutlet weak var videoLayer: UIView!
    @IBOutlet weak var vwBottomNavi: UIView!
    @IBOutlet weak var vwSearch: UIView!
    @IBOutlet weak var vwbtnSearch: UIView!
    @IBOutlet weak var usernameLbl: UILabel!
    
    @IBOutlet weak var cvListing: UICollectionView!
    
    @IBOutlet weak var lblHome: UILabel!
    @IBOutlet weak var lblCources: UILabel!
    @IBOutlet weak var lblProfile: UILabel!

    @IBOutlet weak var btnHomeImg: UIButton!
    @IBOutlet weak var btnCourcesImg: UIButton!
    @IBOutlet weak var btnProfileImg: UIButton!
    var gameTimer: Timer?

    
    @IBOutlet weak var ConstraintSafeArea: NSLayoutConstraint!
    
    //MARK:-
    //MARK:- Variables.
    
    var arrQuizName = ["PhotoGraphy","Photo & Video Editor","VideoGraphy"]
    var arrTotalQuiz = ["Photo editor for social usage","Photo & Video editor for social usage","Video editor for multiple use"]
    var arrQuizImg = ["1","2","3"]
    
    //MARK:-
    //MARK:- UIview Life Cycles.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameTimer = Timer.scheduledTimer(timeInterval: 12, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: true)
        
        let data = Keychain.load("CurrentUser")

        usernameLbl.text = "Hi, \(data ?? "Human Being")"
        // Do any additional setup after loading the view.
        SetUpObject()
        playVideo()
    }
    @objc func runTimedCode(){
        playVideo()
    }
    
    func playVideo(){
        
        guard let path = Bundle.main.path(forResource: "demo", ofType: "mp4")else { return
        }
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        playerLayer.videoGravity = .resizeAspectFill
        self.videoLayer.layer.addSublayer(playerLayer)
        player.play()
        
    }
    
    //MARK:-
    //MARK:- SetUpObject Methods.
       
    func SetUpObject() {
        if #available(iOS 11.0, *) {
                                  
        } else {
            // Fallback on earlier versions
            ConstraintSafeArea.constant = UIApplication.shared.statusBarFrame.size.height
        }
        self.vwSearch.layer.cornerRadius = 10.0
        self.vwbtnSearch.layer.cornerRadius = 10.0
      //  THelper.btnsetShadowWithColor(view: self.vwbtnSearch, Color: THEME7_PRIMARY_COLOR2)
      //  THelper.setShadowWithColor(view: vwSearch, Color: COMMON_SHADOW_COLOR)
        self.vwBottomNavi.layer.cornerRadius = 20.0
        self.vwBottomNavi.layer.cornerRadius = 20.0
      //  self.btnHomeImg.tintColor = ThemeManager.shared()?.color(forKey: "Theme4PrimaryColor1")
      //  self.lblHome.textColor = ThemeManager.shared()?.color(forKey: "Theme4PrimaryColor1")
        self.btnCourcesImg.tintColor = .black
        self.lblCources.textColor = .black
        self.btnProfileImg.tintColor = .black
        self.lblProfile.textColor = .black
    }
    
    //MARK:-
    //MARK:- UICollectionView Delegate and DataSource.
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
                  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
       
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        cvListing.register(UINib(nibName: "Theme7DashBoardHomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeCell")
        let cell = cvListing.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! Theme7DashBoardHomeCollectionViewCell
        cell.lblQuizName.text = self.arrQuizName[indexPath.item]
        cell.lblTotalQuiz.text = self.arrTotalQuiz[indexPath.item]
        cell.imgDetail.image = UIImage(named: arrQuizImg[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
               
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.cvListing.frame.width - 32 , height: 280)
    }
    
    //MARK:-
    //MARK:- UIButton Clicked Events.
    
    @IBAction func btnSearch_Clicked(_ sender: Any) {
      
    }
    
    @IBAction func btnViewAll_Clicked(_ sender: Any) {
        
    }
    
    @IBAction func btnBack_Clicked(_ sender: Any) {
        if Keychain.delete("loggedinUser") {
            
        }
        
        self.navigationController?.popViewController(animated: true)
    }
       
    @IBAction func btnHome_Clicked(_ sender: Any) {
        self.vwBottomNavi.layer.cornerRadius = 20.0
     
        self.btnCourcesImg.tintColor = .black
        self.lblCources.textColor = .black
        self.btnProfileImg.tintColor = .black
        self.lblProfile.textColor = .black
       // THelper.btnAnimation(btn: btnHomeImg)
    }
       
    @IBAction func btnCource_Clicked(_ sender: Any) {
       // self.btnCourcesImg.tintColor = ThemeManager.shared()?.color(forKey: "Theme4PrimaryColor1")
      //  self.lblCources.textColor = ThemeManager.shared()?.color(forKey: "Theme4PrimaryColor1")
        self.btnHomeImg.tintColor = .black
        self.lblHome.textColor = .black
        self.btnProfileImg.tintColor = .black
        self.lblProfile.textColor = .black
     //   THelper.btnAnimation(btn: btnCourcesImg)
    }
       
    @IBAction func btn_Profile_Clicked(_ sender: Any) {
       // self.btnProfileImg.tintColor = ThemeManager.shared()?.color(forKey: "Theme4PrimaryColor1")
      //  self.lblProfile.textColor = ThemeManager.shared()?.color(forKey: "Theme4PrimaryColor1")
        self.btnHomeImg.tintColor = .black
        self.lblHome.textColor = .black
        self.btnCourcesImg.tintColor = .black
        self.lblCources.textColor = .black
      //  THelper.btnAnimation(btn: btnProfileImg)
    }
    
}
