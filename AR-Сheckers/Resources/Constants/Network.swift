//
//  Network.swift
//  AR-Сheckers
//
//  Created by Vakula Maksim on 3/17/19.
//  Copyright © 2019 Vakula Maksim. All rights reserved.
//

import Foundation
import MultipeerConnectivity

enum NetworkConstants {
    
    static var peerID: MCPeerID {
        let userDefaults = UserDefaults.standard
        
        let displayName: String
        
        if let UDDisplayName = userDefaults.string(forKey: Keys.UserDefault.peerID) {
            displayName = UDDisplayName
        } else {
            let uuid = NSUUID().uuidString
            userDefaults.set(uuid, forKey: Keys.UserDefault.peerID)
            displayName = uuid
        }
        return MCPeerID(displayName: displayName)
    }
}
