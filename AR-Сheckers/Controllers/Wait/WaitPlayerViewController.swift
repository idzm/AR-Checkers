//
//  WaitPlayerViewController.swift
//  AR-Сheckers
//
//  Created by Vakula Maksim on 3/18/19.
//  Copyright © 2019 Vakula Maksim. All rights reserved.
//

import UIKit

final class WaitPlayerViewController: BaseViewController {
    
    @IBOutlet private weak var adviceLabel: AnimatedLabel!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var nicknameLabel: UILabel!
    
    private let advertiserService = AdvertiserService()
    private var invitationHandler: InvitationHandler?
    
    override func setup() {
        super.setup()
        
        advertiserService.delegate = self
        
        nicknameLabel.text = String(format: "Your nickname is %@", NetworkConstants.peerID.displayName)
        nicknameLabel.numberOfLines = 0
        
        let images = GreatPlayers.allCases.map {  $0.image! }
        let animatedImage = UIImage.animatedImage(with: images,
                                                  duration: 10)
        imageView.image = animatedImage
        
        adviceLabel.dataSource = InterestingFactsAboutCheckers.allFacts
    }
    
    private func showAcceptSessionPopUp(host: String) {
        let message = String(format: "%@ want's to invite you to game", host)
        let popUp = UIAlertController(title: "Invitation", message: message, preferredStyle: .alert)
        let accentAction = UIAlertAction(title: "Accept", style: .default) { action in
            self.invitationHandler?(true)
            self.presentScene()
        }
        let cancelAction = UIAlertAction(title: "Deny", style: .cancel) { action in
            self.invitationHandler?(false)
        }
        
        popUp.addAction(accentAction)
        popUp.addAction(cancelAction)
        self.present(popUp, animated: true, completion: nil)
    }
    
    private func presentScene() {
        navigationController?.pushViewController(RouterService.scene, animated: true)
    }
}

extension WaitPlayerViewController: AdvertiserServiceDelegate {
    func didReceiveInvitation(host: String, handler: @escaping InvitationHandler) {
        invitationHandler = handler
        showAcceptSessionPopUp(host: host)
    }
}
