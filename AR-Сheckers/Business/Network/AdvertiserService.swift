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
    weak var delegate: AdvertiserServiceDelegate? {
        didSet {
            serviceAdvertiser.startAdvertisingPeer()
        }
    }
    
    override init() {
        serviceAdvertiser = MCNearbyServiceAdvertiser(peer: SessionManager.shared.session.myPeerID,
                                                      discoveryInfo: nil,
                                                      serviceType: AdvertiserService.type)
        super.init()
        serviceAdvertiser.delegate = self
    }
    
    deinit {
        serviceAdvertiser.stopAdvertisingPeer()
    }
}

extension AdvertiserService: MCNearbyServiceAdvertiserDelegate {
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didNotStartAdvertisingPeer error: Error) {
        debugPrint("Advertiser- didNotStartAdvertisingPeer: \(error)")
    }
    
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser,
                    didReceiveInvitationFromPeer peerID: MCPeerID,
                    withContext context: Data?,
                    invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        debugPrint("Advertiser- didReceiveInvitationFromPeer \(peerID)")
        delegate?.didReceiveInvitation(host: peerID.displayName, handler: { isInvited in
            let session = SessionManager.shared.session
            invitationHandler(isInvited, session)
        })
    }
}

extension AdvertiserService: SessionManagerDelegate {
    func stateDidChanged(with state: MCSessionState) {
        
    }
    
    func didReceiveData(_ data: Data) {
        
    }
}
