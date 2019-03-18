//
//  NicknameTableViewCell.swift
//  AR-Сheckers
//
//  Created by Vakula Maksim on 3/18/19.
//  Copyright © 2019 Vakula Maksim. All rights reserved.
//

import UIKit

final class NicknameTableViewCell: UITableViewCell {

    @IBOutlet private weak var nicknameLabel: UILabel!
    @IBOutlet private weak var textField: UITextField!
    
    func configure() {
        nicknameLabel.text = "Your Nickname:"
        nicknameLabel.font = UIFont.AvenirNext.medium(size: 14).font
        nicknameLabel.textColor = Colors.dark
        
        textField.returnKeyType = .done
        textField.delegate = self
        
        textField.text = NetworkConstants.peerID.displayName
        textField.font = UIFont.AvenirNext.regular(size: 14).font
        textField.textColor = Colors.dark
        
        textField.layer.borderColor = UIColor.red.cgColor
    }
}

extension NicknameTableViewCell: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.layer.borderWidth = 0
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let answer: Bool
        if let newNickname = textField.text, newNickname.count > 1 {
            UserDefaults.standard.set(newNickname, forKey: Keys.UserDefault.peerID)
            answer = true
        } else {
            textField.layer.borderWidth = 1
            answer = false
        }
        
        textField.resignFirstResponder()
        return answer
    }
}
