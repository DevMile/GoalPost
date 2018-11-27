//
//  RoundedButton.swift
//  GoalPost
//
//  Created by Milan Bojic on 11/27/18.
//  Copyright © 2018 Milan Bojic. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {
    
    var cornerRadius: CGFloat = 5.0 {
        didSet {
            setupView()
        }
    }
    
    override func awakeFromNib() {
        self.setupView()
    }
   
    func setupView() {
        self.layer.cornerRadius = cornerRadius
    }
}
