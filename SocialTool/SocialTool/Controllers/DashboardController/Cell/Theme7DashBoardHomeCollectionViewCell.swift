//
//  Theme7DashBoardHomeCollectionViewCell.swift
//  Prokit
//
//  Created by ""-ios on 26/11/19.
//  Copyright © 2019 ""-ios. All rights reserved.
//

import UIKit

class Theme7DashBoardHomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var vwMain: UIView!
    @IBOutlet weak var imgDetail: UIImageView!
    @IBOutlet weak var lblQuizName: UILabel!
    @IBOutlet weak var lblTotalQuiz: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        vwMain.layer.cornerRadius = 10.0
        vwMain.layer.masksToBounds = true
        
        DispatchQueue.main.async {
            self.imgDetail.layer.cornerRadius = 10.0
        }
        
     //   THelper.setShadowWithColor(view:vwMain, Color: COMMON_SHADOW_COLOR)
    }

}
