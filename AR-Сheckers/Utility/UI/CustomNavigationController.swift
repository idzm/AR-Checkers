//
//  CustomNavigationController.swift
//  AR-Сheckers
//
//  Created by Vakula Maksim on 3/17/19.
//  Copyright © 2019 Vakula Maksim. All rights reserved.
//

import UIKit.UINavigationController

class CustomNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        setup()
    }
    
    private func setup() {
        navigationBar.tintColor = Colors.dirtWhite
        navigationBar.barTintColor = Colors.dark        
    }
}
