//
//  AboutViewController.swift
//  AR-Сheckers
//
//  Created by Vakula Maksim on 3/18/19.
//  Copyright © 2019 Vakula Maksim. All rights reserved.
//

import UIKit

final class AboutViewController: BaseViewController {

    @IBOutlet private weak var logoImageView: UIImageView!
    @IBOutlet private weak var logoLabel: UILabel!
    @IBOutlet private weak var appVersionLabel: UILabel!
    @IBOutlet private weak var aboutLabel: UILabel!
    
    override func setup() {
        super.setup()
        
        logoImageView.image = #imageLiteral(resourceName: "logo")
        logoImageView.contentMode = .scaleAspectFill
        
        logoLabel.font = UIFont.AvenirNext.bold(size: 24).font
        logoLabel.textColor = Colors.dark
        logoLabel.numberOfLines = 1
        logoLabel.text = "AR-Checkers"
        
        appVersionLabel.font = UIFont.AvenirNext.regular(size: 14).font
        appVersionLabel.textColor = Colors.darkGrey
        appVersionLabel.numberOfLines = 1
        let appVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
        appVersionLabel.text =  String(format: "App Version: %@", appVersion)
        
        aboutLabel.font = UIFont.AvenirNext.regular(size: 16).font
        aboutLabel.textColor = Colors.darkGrey
        aboutLabel.textAlignment = .center
        aboutLabel.numberOfLines = 0
        aboutLabel.text = "This app was created as Diploma Project of Vakula Maksim(Garando) Electronic and Infomational System faculty, Automatic Sysytem Information Processing specialization.\n©All rignts reserved"
    }
}
