//
//  BaseViewController.swift
//  AR-Сheckers
//
//  Created by Vakula Maksim on 3/18/19.
//  Copyright © 2019 Vakula Maksim. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    var hideNavBar: Bool = false
    var navBarTitle: String = ""
    var preferredStyle: UIStatusBarStyle = .lightContent
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return preferredStyle
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        navigationController?.setNavigationBarHidden(hideNavBar, animated: true)
    }
    
    func setup() {
        view.backgroundColor = Colors.lightBlue
        
        let navTitleLabel = UILabel()
        navTitleLabel.text = navBarTitle
        navTitleLabel.font = UIFont.AvenirNext.medium(size: 24).font
        navTitleLabel.textColor = Colors.dirtWhite
        navTitleLabel.textAlignment = .center
        navigationItem.titleView = navTitleLabel
    }
    
    func configureViewController(title: String, isNeedNavBar: Bool) {
        hideNavBar = !isNeedNavBar
        navBarTitle = title
    }
}
