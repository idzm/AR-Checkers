//
//  AvailableGameTableViewCell.swift
//  AR-Сheckers
//
//  Created by Vakula Maksim on 3/17/19.
//  Copyright © 2019 Vakula Maksim. All rights reserved.
//

import UIKit

class AvailableGameTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    //MARK: Utility Methods(private)
    private func setup() {        
        self.backgroundColor = Colors.clear
    }
    
    //MARK: Utility Methods(public)
    func configure(with gameName: String) {
        self.textLabel?.text = gameName
    }
}
