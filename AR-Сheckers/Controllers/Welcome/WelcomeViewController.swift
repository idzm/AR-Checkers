//
//  WelcomeViewController.swift
//  AR-Сheckers
//
//  Created by Vakula Maksim on 3/16/19.
//  Copyright © 2019 Vakula Maksim. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet private weak var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    //MARK: Utility Methods(private)
    private func setup() {
        self.view.backgroundColor = Colors.dirtWhite
        
        welcomeLabel.text = "Welcome to AR Checkers.\nPlease ENJOY!"
        welcomeLabel.font = UIFont.AvenirNext.bold(size: 24).font
        welcomeLabel.textColor = Colors.darkGrey
        welcomeLabel.textAlignment = .center
        welcomeLabel.numberOfLines = 0
    }
    
    //MARK: - Actions
    @IBAction func onSoloGameTap(_ sender: Any) {
    }
    
    @IBAction func onJoinGameTap(_ sender: Any) {
        navigationController?.pushViewController(RouterService.wait, animated: true)
    }
    
    @IBAction func onHostGameTap(_ sender: Any) {
        navigationController?.pushViewController(RouterService.selectOpponent, animated: true)
    }
    
    @IBAction func onAboutTap(_ sender: Any) {
        navigationController?.pushViewController(RouterService.about, animated: true)
    }
    
    @IBAction func onSettingsTap(_ sender: Any) {
        navigationController?.pushViewController(RouterService.settings, animated: true)
    }
}

//MARK: - Router
extension WelcomeViewController {
    
}
