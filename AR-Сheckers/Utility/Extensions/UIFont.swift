//
//  UIFont.swift
//  AR-Сheckers
//
//  Created by Vakula Maksim on 3/17/19.
//  Copyright © 2019 Vakula Maksim. All rights reserved.
//

import UIKit.UIFont

extension UIFont {
    
    enum AvenirNext {
        case regular(size: CGFloat?)
        case bold(size: CGFloat?)
        case thint(size: CGFloat?)
        case medium(size: CGFloat?)
        
        var font: UIFont {
            switch self {
            case .regular(size: let size):
                return UIFont(name: "AvenirNext-Regular", size: size ?? 14)!
            case .bold(size: let size):
                return UIFont(name: "AvenirNext-Bold", size: size ?? 14)!
            case .thint(size: let size):
                return UIFont(name: "AvenirNext-Thint", size: size ?? 14)!
            case .medium(size: let size):
                return UIFont(name: "AvenirNext-Medium", size: size ?? 14)!
            }
        }
    }
}
