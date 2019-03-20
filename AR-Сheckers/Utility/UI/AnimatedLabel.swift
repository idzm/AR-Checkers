//
//  AnimatedLabel.swift
//  AR-Сheckers
//
//  Created by Vakula Maksim on 3/18/19.
//  Copyright © 2019 Vakula Maksim. All rights reserved.
//

import UIKit.UILabel

class AnimatedLabel: UILabel {
    
    var dataSource: [String] = ["Checkers"] {
        didSet {
            changeText()
        }
    }
    private var prevIndex: Int = 0
    private let transition = CATransition()
    private var timer: Timer?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    deinit {
        if let timer = timer {
            timer.invalidate()
            self.timer = nil
        }
    }
    
    private func setup() {
        timer = Timer.scheduledTimer(timeInterval: 5,
                                     target: self,
                                     selector: #selector(changeText),
                                     userInfo: nil,
                                     repeats: true)
        
        setupAnimation()
        setupDesign()
    }
    
    private func setupAnimation() {
        transition.type = .fade
        transition.duration = 0.5
        transition.isRemovedOnCompletion = false
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
    }
    
    private func setupDesign() {
        textColor = Colors.darkGrey
        textAlignment = .justified
        font = UIFont.AvenirNext.regular(size: 16).font
        numberOfLines = 0
        adjustsFontSizeToFitWidth = true
    }
    
    @objc func changeText() {
        layer.add(transition, forKey: CATransitionType.fade.rawValue)

        var randInt = prevIndex
        while randInt == prevIndex && randInt < dataSource.count {
            randInt = Int(arc4random()) % dataSource.count
        }
        
        prevIndex = randInt
        text = dataSource[randInt]
    }
}
