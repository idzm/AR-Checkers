//
//  GameStateModel.swift
//  AR-Сheckers
//
//  Created by Vakula Maksim on 3/16/19.
//  Copyright © 2019 Vakula Maksim. All rights reserved.
//
import RealmSwift

class GameStateModel: Object {
    @objc dynamic var id: Int8 = 0
    
    @objc dynamic var player: PlayerScoreModel!
    @objc dynamic var opponent: PlayerScoreModel!
    
    @objc dynamic var gameTime: TimeInterval = TimeInterval.infinity
    @objc dynamic var startTime: NSDate = NSDate()
}
