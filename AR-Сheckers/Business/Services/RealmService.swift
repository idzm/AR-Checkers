//
//  RealmService.swift
//  AR-Сheckers
//
//  Created by Vakula Maksim on 3/17/19.
//  Copyright © 2019 Vakula Maksim. All rights reserved.
//

import Foundation
import RealmSwift

final class RealmService: NSObject {
    
    private let realm = try! Realm()
    private let dispatchQueue = DispatchQueue(label: DispatchQueueLabels.realm)
    private var currentGame: GameStateModel?
    
    private func performOnQueue(handler: @escaping () -> ()) {  ///self safed
        dispatchQueue.async(group: nil, qos: .utility, flags: .barrier) { [weak self] in
            guard let self = self else {
                return
            }
            
            handler()
        }
    }
    
    func createNewGame() {
        performOnQueue {
            try! self.realm.write {
                let newGame = GameStateModel()
                newGame.startTime = NSDate()
                newGame.player = PlayerScoreModel()
            }
        }
    }
    
    func loadGames() -> [GameStateModel] {
        var games: [GameStateModel] = []
        let semaphore = DispatchSemaphore(value: 0)
        performOnQueue {
            let gameStatuses: Results<GameStateModel> = { self.realm.objects(GameStateModel.self) }()
            self.currentGame = gameStatuses.last
            games = Array(gameStatuses)
            semaphore.signal()
        }
        semaphore.wait()
        
        return games
    }
    
    func gameEnded(currentSessionTime: TimeInterval) {
        performOnQueue {
            try! self.realm.write {
                self.currentGame?.gameTime += currentSessionTime
            }
        }
    }
}
