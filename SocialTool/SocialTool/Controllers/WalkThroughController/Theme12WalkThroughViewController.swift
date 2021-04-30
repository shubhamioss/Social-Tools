//
//  Theme12WalkThroughViewController.swift
//  Social
//
//  Created by ""-ios on 21/01/20.
//  Copyright © 2020 ""-ios. All rights reserved.
//

import UIKit

class Theme12WalkThroughViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    //MARK:-
    //MARK:- Outlets
    
    @IBOutlet weak var cvWalkThrough: UICollectionView!
    @IBOutlet weak var vwGetStarted: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var ConstraintSafeArea: NSLayoutConstraint!
    
    //MARK:-
    //MARK:- Variables
    
    let arrwalkImg = ["4293635","4994216","4086544"]
    
    //MARK:-
    //MARK:- UIView Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        SetUpObject()
    }

    //MARK:-
    //MARK:- SetUpObject Methods
    
    func SetUpObject(){
        if #available(iOS 11.0, *) {} else {
            ConstraintSafeArea.constant = UIApplication.shared.statusBarFrame.size.height
        }
        
        let gradient = CAGradientLayer()
//        gradient.colors = [UIColor.init(hexString: THEME12_GRANDIENT_COLOR1).cgColor, UIColor.init(hexString: THEME12_GRANDIENT_COLOR2).cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.0)
        gradient.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        self.vwGetStarted.layer.addSublayer(gradient)
       // CornerRadious(view: self.btnBack, cornerRadus: 10.0)
    }
    
    
    //MARK:-
    //MARK:- UICollectionView Delegate and Data Soureces
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrwalkImg.count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        self.cvWalkThrough.register(UINib(nibName: "Theme12WalkThroughCollectionCell", bundle: nil), forCellWithReuseIdentifier: "Theme12WalkThroughCell")
        let cell = self.cvWalkThrough.dequeueReusableCell(withReuseIdentifier: "Theme12WalkThroughCell", for: indexPath) as! Theme12WalkThroughCollectionCell
        cell.imgWalkThrough.image = UIImage(named: arrwalkImg[indexPath.item])
        self.pageControl.numberOfPages = self.arrwalkImg.count
       // self.pageControl.currentPageIndicatorTintColor = UIColor.init(hexString: THEME12_PRIMARYCOLOR)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.cvWalkThrough.frame.width , height: self.cvWalkThrough.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        cvWalkThrough.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    //MARK:-
    //MARK:- ScrollView methods.
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageWidth = self.cvWalkThrough.frame.size.width
        pageControl.currentPage = Int(cvWalkThrough.contentOffset.x / pageWidth)
    }
    
    //MARK:-
    //MARK:- UIButton Clicked Events
    
    
    @IBAction func btnGetStarted_Clicked(_ sender: Any) {
        let pieVC = Theme7SignUpViewController()
        pieVC.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        present(pieVC, animated: true, completion: nil)
    }
    
    @IBAction func btnBack_Clicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
