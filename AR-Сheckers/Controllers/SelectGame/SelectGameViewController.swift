//
//  SelectGameViewController.swift
//  AR-Сheckers
//
//  Created by Vakula Maksim on 3/17/19.
//  Copyright © 2019 Vakula Maksim. All rights reserved.
//

import UIKit
import MultipeerConnectivity

final class SelectGameViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var joinButton: ColoredButton!
    @IBOutlet private weak var gradientView: TransparentGradientView!
    
    private let cellRID = "AvailableGameTableViewCellIdentifier"
    private let browserService: BrowserService = BrowserService()
    
    private var hostPeers: [MCPeerID] = [] {
        willSet {
            //TODO: batchUpdate
            tableView.reloadData()
        }
    }
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        browserService.delegate = self
        setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    //MARK: Utility Methods (private)
    private func setup() {
        self.view.backgroundColor = Colors.lightBlue
        
        let navTitleLabel = UILabel()
        navTitleLabel.text = "Join Game"
        navTitleLabel.font = UIFont.AvenirNext.medium(size: 24).font
        navTitleLabel.textColor = Colors.dirtWhite
        navTitleLabel.textAlignment = .center
        navigationItem.titleView = navTitleLabel
        
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
    
    //MARK: Actions
    @IBAction func onJoinTap(_ sender: Any) {
        let peer = hostPeers[tableView.indexPathForSelectedRow?.row ?? 0]
        
        browserService.invitePeer(peer)
    }
}

//MARK: - UITableViewDataSource
extension SelectGameViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellRID) as? AvailableGameTableViewCell
        cell?.configure(with: "Game #\(indexPath.row)")
        return cell ?? UITableViewCell()
    }
}

//MARK: - UITableViewDataSource
extension SelectGameViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        joinButton.isEnabled = true
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        joinButton.isEnabled = false
    }
}

extension SelectGameViewController: BrowserServiceDelegate {
    func foundPeer(peer: MCPeerID) {
        hostPeers.append(peer)
    }
    
    func lostPeer(peer: MCPeerID) {
        if let index = hostPeers.firstIndex(of: peer) {
        hostPeers.remove(at: index)
        }
    }
}
