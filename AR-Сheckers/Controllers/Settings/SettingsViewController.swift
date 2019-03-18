//
//  SettingsViewController.swift
//  AR-Сheckers
//
//  Created by Vakula Maksim on 3/18/19.
//  Copyright © 2019 Vakula Maksim. All rights reserved.
//

import UIKit

final class SettingsViewController: BaseViewController {
    
    private let tableView = UITableView()
    private let cellRID = "NicknameTableViewCellIdentifier"
    
    override func setup() {
        super.setup()
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true

        setupTableView()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.backgroundColor = Colors.lightBlue

//        tableView.register(NicknameTableViewCell.self, forCellReuseIdentifier: cellRID)
        let nib = UINib(nibName: String(describing: NicknameTableViewCell.self), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellRID)
    }
}

extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellRID, for: indexPath) as? NicknameTableViewCell
        cell?.configure()
        return cell ?? UITableViewCell()
    }
}

