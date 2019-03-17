//
//  PlayerScoreModel.swift
//  AR-Сheckers
//
//  Created by Vakula Maksim on 3/17/19.
//  Copyright © 2019 Vakula Maksim. All rights reserved.
//

import RealmSwift

final class PlayerScoreModel: Object {
    @objc dynamic var score: Int = 0
    
    @objc dynamic var checkersLeft: Int = 12
    @objc dynamic var checkersPositions: [CheckerPositionModel] = []
}
