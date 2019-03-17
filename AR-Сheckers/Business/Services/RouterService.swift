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
    
    static var selectGame: UIViewController {
        let controller = storyboard(name: "SelectGameViewController").instantiateInitialViewController()
        return controller!
    }
}
