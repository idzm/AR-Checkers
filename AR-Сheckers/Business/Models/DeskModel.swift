//
//  DeskModel.swift
//  AR-Сheckers
//
//  Created by Vakula Maksim on 3/19/19.
//  Copyright © 2019 Vakula Maksim. All rights reserved.
//

import SceneKit

final class DeskModel {
    var node: SCNNode!
    var squarePositions: [Position]!
    
    init(node: SCNNode, squarePositions: [Position]) {
        self.node = node
        self.squarePositions = squarePositions
    }
}
