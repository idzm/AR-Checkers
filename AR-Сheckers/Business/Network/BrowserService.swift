//
//  BrowserService.swift
//  AR-Сheckers
//
//  Created by Vakula Maksim on 3/17/19.
//  Copyright © 2019 Vakula Maksim. All rights reserved.
//

import MultipeerConnectivity

protocol BrowserServiceDelegate: class {
    func foundPeer(peer: MCPeerID)
    func lostPeer(peer: MCPeerID)
}

final class HostService: PeerToPeerService {
    
    private let serviceBrowser: MCNearbyServiceBrowser
    weak var delegate: BrowserServiceDelegate?
    
    override init() {
        serviceBrowser = MCNearbyServiceBrowser(peer: SessionManager.shared.session.myPeerID,
                                                serviceType: HostService.type)
        super.init()
        self.serviceBrowser.delegate = self
        self.serviceBrowser.startBrowsingForPeers()
    }
    
    deinit {
        self.serviceBrowser.stopBrowsingForPeers()
    }
    
    func invitePeer(_ peer: MCPeerID) {
        let session = SessionManager.shared.session
        serviceBrowser.invitePeer(peer, to: session, withContext: nil, timeout: 10)
    }
}

extension HostService: MCNearbyServiceBrowserDelegate {
    func browser(_ browser: MCNearbyServiceBrowser, didNotStartBrowsingForPeers error: Error) {
        NSLog("%@", "didNotStartBrowsingForPeers: \(error)")
    }
    
    func browser(_ browser: MCNearbyServiceBrowser, foundPeer peerID: MCPeerID, withDiscoveryInfo info: [String : String]?) {
        NSLog("%@", "foundPeer: \(peerID)")
        delegate?.foundPeer(peer: peerID)
    }
    
    func browser(_ browser: MCNearbyServiceBrowser, lostPeer peerID: MCPeerID) {
        NSLog("%@", "lostPeer: \(peerID)")
        delegate?.lostPeer(peer: peerID)
    }
}
