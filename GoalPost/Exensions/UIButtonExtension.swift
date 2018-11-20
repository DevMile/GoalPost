//
//  UIButtonExtension.swift
//  GoalPost
//
//  Created by Milan Bojic on 11/20/18.
//  Copyright © 2018 Milan Bojic. All rights reserved.
//

import UIKit

extension UIButton {
    func setSelectedColor() {
        self.backgroundColor = #colorLiteral(red: 0.003921568627, green: 0.7294117647, blue: 0.003921568627, alpha: 1)
    }
    
    func setDeselectedColor() {
        self.backgroundColor = #colorLiteral(red: 0.4260590303, green: 0.8427596469, blue: 0.3049821784, alpha: 0.8950128425)
    }
}
