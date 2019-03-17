//
//  Colors.swift
//  AR-Сheckers
//
//  Created by Vakula Maksim on 3/16/19.
//  Copyright © 2019 Vakula Maksim. All rights reserved.
//

import UIKit.UIColor

enum Colors {
    //MARK: - Default
    static let black: UIColor = UIColor.black
    static let white: UIColor = UIColor.white
    static let clear: UIColor = UIColor.clear

    //MARK: - Hexes
    static let dark: UIColor            = UIColor(hex: Hexes.dark)
    static let darkGrey: UIColor        = UIColor(hex: Hexes.darkGrey)
    static let grey: UIColor            = UIColor(hex: Hexes.grey)
    static let lightBlue: UIColor       = UIColor(hex: Hexes.lightBlue)
    static let lightBlueAlpha: UIColor  = UIColor(hex: Hexes.lightBlueAlpha)
    static let lightBlueGradient: UIColor  = UIColor(hex: Hexes.lightBlueGradient)
    static let dirtWhite: UIColor       = UIColor(hex: Hexes.dirtWhite)
    
    //MARK: - Private
    private enum Hexes {
        static let dark: String             = "#362c36"
        static let darkGrey: String         = "#4d4c59"
        static let grey: String             = "#71777d"
        static let lightBlue: String        = "#a7cbd5"
        static let lightBlueGradient: String   = "#a7cbd500"
        static let lightBlueAlpha: String   = "#a7cbd5aa"
        static let dirtWhite: String        = "#a7cbd5"
    }
}
