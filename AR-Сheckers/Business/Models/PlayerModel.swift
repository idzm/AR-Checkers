//
//  PlayerModel.swift
//  AR-Сheckers
//
//  Created by Vakula Maksim on 3/16/19.
//  Copyright © 2019 Vakula Maksim. All rights reserved.
//

import MultipeerConnectivity

final class Player {
    
    var peedID: MCPeerID
    var nickname: String
    
    init(peedID: MCPeerID = MCPeerID(displayName: NSUUID().uuidString),
         nickname: String = Constants.defaultNickname) {
            self.peedID = peedID
            self.nickname = nickname
    }
}

private enum Constants {
    static let defaultNickname: String = "Player"
}
