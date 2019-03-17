//
//  UIButton+Color.swift
//  AR-Сheckers
//
//  Created by Vakula Maksim on 3/17/19.
//  Copyright © 2019 Vakula Maksim. All rights reserved.
//

import UIKit.UIButton

final class ColoredButton: UIButton {
    
    override var isEnabled: Bool {
        willSet {
            configureBackgroundColor(isEnabled: newValue)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    //MARK: Utility Methods(private)
    private func setup() {
        ///Layer
        self.layer.cornerRadius = 10
        
        ///Shadow
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.9
        self.layer.shadowColor = Colors.dark.cgColor
        self.layer.shadowOffset = CGSize(width: 4, height: 4)
        
        ///UI
        configureBackgroundColor(isEnabled: isEnabled)
        
        self.setTitleColor(Colors.lightBlue, for: .normal)
        self.setTitleColor(Colors.lightBlueAlpha, for: .disabled)
        self.titleLabel?.font = UIFont.AvenirNext.medium(size: 16).font
        
        self.contentEdgeInsets = UIEdgeInsets(top: 8, left: 10, bottom: 2, right: 10)
    }
    
    private func configureBackgroundColor(isEnabled: Bool) {
        self.backgroundColor = Colors.darkGrey.withAlphaComponent(isEnabled ? 1 : 0.5)
    }
    
    //MARK: Utility Methods(public)
    func configure(with title: String) {
        setTitle(title, for: .normal)
    }
}
