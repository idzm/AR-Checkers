//
//  SceneNameConstant.swift
//  AR-Сheckers
//
//  Created by Vakula Maksim on 3/20/19.
//  Copyright © 2019 Vakula Maksim. All rights reserved.
//

enum SceneNameConstant {
    enum Scene {
        private static let path: String             = "art.scnassets/"
        private static let deskFolder: String       = "Desk/"
        private static let checkersFolder: String   = "Checkers/"
        
        private static let fileExtension: String    = ".scn"
        
        static let workSpace: String = path + "WorkSpace" + fileExtension

        static let desk: String     = path + deskFolder + "Desk" + fileExtension
        static let checkers: String = path + checkersFolder + "Checkers" + fileExtension
    }
    
    enum Model {
        static let desk: String                 = "Desk"
        
        static let whiteChecker: String         = "WhiteChecker"
        static let whiteQueenChecker: String    = "WhiteQueenChecker"
        
        static let blackChecker: String         = "BlackChecker"
        static let blackQueenChecker: String    = "BlackQueenChecker"
    }
}
