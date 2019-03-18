//
//  SessionManager.swift
//  AR-Сheckers
//
//  Created by Vakula Maksim on 3/17/19.
//  Copyright © 2019 Vakula Maksim. All rights reserved.
//

import Foundation
import MultipeerConnectivity

protocol SessionManagerDelegate: class {
    func stateDidChanged(with state: MCSessionState)
    func didReceiveData(_ data: Data)
}

final class SessionManager: NSObject {
    
    static var shared = SessionManager()
    weak var delegate: SessionManagerDelegate?
    
    lazy var session: MCSession = {
        let session = MCSession(peer: NetworkConstants.peerID,
                                securityIdentity: nil,
                                encryptionPreference: .optional)
        session.delegate = self
        let data = "data".data(using: .utf8)
        DispatchQueue(label: "gegewgerger").async {
            while true {
                sleep(3)
                print("sending data")
                try? session.send(data!, toPeers: session.connectedPeers, with: .reliable)
            }
        }
        return session
    }()
}

extension SessionManager: MCSessionDelegate {
    
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        
        var status = "Unknown"
        
        switch state {
        case .connected:
            status = "Connected"
        case .notConnected:
            status = "Not Connected"
        case .connecting:
            status = "Connecting"
        }
        
        print("--- peer \(peerID) didChangeState: \(status)")
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        print("didReceiveData: \(data)")
        delegate?.didReceiveData(data)
        
    }
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        print("didReceiveStream")
    }
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        print("didStartReceivingResourceWithName")
    }
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
        print("didFinishReceivingResourceWithName")
    }
}
