//
//  SelectGameViewController.swift
//  AR-Сheckers
//
//  Created by Vakula Maksim on 3/17/19.
//  Copyright © 2019 Vakula Maksim. All rights reserved.
//

import UIKit
import MultipeerConnectivity

final class SelectGameViewController: BaseViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var joinButton: ColoredButton!
    @IBOutlet private weak var gradientView: TransparentGradientView!
    
    private let cellRID = "AvailableGameTableViewCellIdentifier"
    private let hostService: HostService = HostService()
    
    private var selectedUser: MCPeerID? {
        willSet {
            joinButton.isEnabled = newValue != nil
        }
    }
    
    private var peers: [MCPeerID] = [] {
        willSet {
            //TODO: batchUpdate
            tableView.reloadData()
        }
    }
    
    //MARK: Utility Methods (private)
    override func setup() {
        super.setup()
        
        SessionManager.shared.delegates?.append(self)
        hostService.delegate = self

        joinButton.setTitle("Join Selected Game", for: .normal)
        joinButton.isEnabled = false
        
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = Colors.lightBlue
        tableView.allowsMultipleSelection = false
        tableView.register(AvailableGameTableViewCell.self, forCellReuseIdentifier: cellRID)
        tableView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 50, right: 0)
        
        ///
        gradientView.configureView(colorType: .blueClearBlue, direction: .topDown)
    }
    
    private func presentScene() {
        navigationController?.pushViewController(RouterService.scene, animated: true)
    }
    
    //MARK: Actions
    @IBAction func onJoinTap(_ sender: Any) {
        if let selectedUser = selectedUser {
            hostService.invitePeer(selectedUser)
        }
    }
}

//MARK: - UITableViewDataSource
extension SelectGameViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peers.count
        //return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellRID) as? AvailableGameTableViewCell
        let peer = peers[indexPath.row]
        cell?.configure(with: peer.displayName)
        cell?.isSelected = peer.displayName == selectedUser?.displayName
        return cell ?? UITableViewCell()
    }
}

//MARK: - UITableViewDataSource
extension SelectGameViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedUser = peers[indexPath.row]
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        selectedUser = nil
    }
}

extension SelectGameViewController: BrowserServiceDelegate {
    func foundPeer(peer: MCPeerID) {
        peers.append(peer)
        tableView.reloadData()
    }
    
    func lostPeer(peer: MCPeerID) {
        if let index = peers.firstIndex(of: peer) {
            peers.remove(at: index)
            if selectedUser == peer {
                selectedUser = nil
            }
        }
        tableView.reloadData()
    }
}

extension SelectGameViewController: SessionManagerDelegate {
    func stateDidChanged(with state: MCSessionState) {
        if state == .connected {
            presentScene()
        }
    }
    
    func didReceiveData(_ data: Data) {
        
    }
    
    
}
