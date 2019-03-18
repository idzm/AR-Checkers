//
//  HostService.swift
//  AR-Сheckers
//
//  Created by Vakula Maksim on 3/17/19.
//  Copyright © 2019 Vakula Maksim. All rights reserved.
//

import MultipeerConnectivity

typealias InvitationHandler = (Bool) -> ()

protocol AdvertiserServiceDelegate: class {
    func didReceiveInvitation(host: String, handler: @escaping InvitationHandler)
}

final class AdvertiserService: PeerToPeerService {
    
    private let serviceAdvertiser: MCNearbyServiceAdvertiser
    weak var delegate: AdvertiserServiceDelegate?
    
    override init() {
        serviceAdvertiser = MCNearbyServiceAdvertiser(peer: SessionManager.shared.session.myPeerID,
                                                      discoveryInfo: nil,
                                                      serviceType: AdvertiserService.type)
        super.init()
        self.serviceAdvertiser.delegate = self
        self.serviceAdvertiser.startAdvertisingPeer()
    }
    
    deinit {
        self.serviceAdvertiser.stopAdvertisingPeer()
    }
}

extension AdvertiserService: MCNearbyServiceAdvertiserDelegate {
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didNotStartAdvertisingPeer error: Error) {
        NSLog("%@", "didNotStartAdvertisingPeer: \(error)")
    }
    
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        NSLog("%@", "didReceiveInvitationFromPeer \(peerID)")
        delegate?.didReceiveInvitation(host: peerID.displayName, handler: { isInvited in
            let session = SessionManager.shared.session
            invitationHandler(isInvited, session)
        })
    }
}
