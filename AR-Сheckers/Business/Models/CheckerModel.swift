//
//  CheckerModel.swift
//  AR-Сheckers
//
//  Created by Vakula Maksim on 3/19/19.
//  Copyright © 2019 Vakula Maksim. All rights reserved.
//

import SceneKit

final class CheckerModel {
    enum CheckerColor {
        case white
        case black
    }
    
    var node: SCNNode!
    var color: CheckerColor!
    var position: Position!
    
    init(node: SCNNode, color: CheckerColor, position: Position) {
        self.node = node
        self.color = color
        self.position = position
    }    
}
