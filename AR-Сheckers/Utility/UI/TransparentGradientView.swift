//
//  TransparentGradientView.swift
//  AR-Сheckers
//
//  Created by Vakula Maksim on 3/17/19.
//  Copyright © 2019 Vakula Maksim. All rights reserved.
//

import UIKit.UIView

final class TransparentGradientView: UIView {
    
    enum GradientColors {
        case blueClearBlue
        
        var colors: [Any] {
            switch self {
            case .blueClearBlue:
                return [Colors.lightBlue.cgColor,
                        ///FIXME: Apple fix render problem with UIColor.clear
                        Colors.lightBlueGradient.cgColor,
                        Colors.lightBlueGradient.cgColor,
                        Colors.lightBlue.cgColor]
            }
        }
        
        var locations: [NSNumber] {
            switch self {
            case .blueClearBlue:
                return [0, 0.2, 0.8, 1]
            }
        }
    }
    
    enum Direction {
        case topDown
        case leftRight
        
        var startPoint: CGPoint {
            switch self {
            case .topDown:
                return CGPoint(x: 0.5, y: 0)
            case .leftRight:
                return CGPoint(x: 0, y: 0.5)
            }
        }
            
        var endPoint: CGPoint {
            switch self {
            case .topDown:
                return CGPoint(x: 0.5, y: 1)
            case .leftRight:
                return CGPoint(x: 1, y: 0.5)
            }
        }
    }
    
    override class var layerClass : AnyClass {
        return CAGradientLayer.self
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        return false
    }
    
    func configureView(colorType: GradientColors, direction: Direction) {
        let gradientLayer = self.layer as? CAGradientLayer
        
        gradientLayer?.colors = colorType.colors
        
        gradientLayer?.locations = colorType.locations
        
        gradientLayer?.startPoint = direction.startPoint
        gradientLayer?.endPoint = direction.endPoint
    }
}
