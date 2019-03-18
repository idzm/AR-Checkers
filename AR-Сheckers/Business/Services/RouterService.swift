//
//  RouterService.swift
//  AR-Сheckers
//
//  Created by Vakula Maksim on 3/17/19.
//  Copyright © 2019 Vakula Maksim. All rights reserved.
//

import UIKit

final class RouterService {
    private static func storyboard(name: String) -> UIStoryboard {
        return UIStoryboard(name: name, bundle: nil)
    }
    
    static var selectOpponent: BaseViewController {
        let controller = storyboard(name: String(describing: SelectGameViewController.self))
            .instantiateInitialViewController()  as? BaseViewController
        controller?.configureViewController(title: "Select opponent", isNeedNavBar: true)
        return controller!
    }
    
    static var wait: BaseViewController {
        let controller = storyboard(name: String(describing: WaitPlayerViewController.self))
            .instantiateInitialViewController() as? BaseViewController
        controller?.configureViewController(title: "Waiting For Host", isNeedNavBar: true)
        return controller!
    }
    
    static var settings: BaseViewController {
        let controller = SettingsViewController() as? BaseViewController
        controller?.configureViewController(title: "Settings", isNeedNavBar: true)
        return controller!
    }
}
