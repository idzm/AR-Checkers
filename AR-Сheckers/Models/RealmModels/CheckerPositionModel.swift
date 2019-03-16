//
//  CheckerositionModel.swift
//  AR-Сheckers
//
//  Created by Vakula Maksim on 3/17/19.
//  Copyright © 2019 Vakula Maksim. All rights reserved.
//

import RealmSwift

final class CheckerPositionModel: Object {
    @objc dynamic var letterColum: Int = 0
    @objc dynamic var numberColum: Int = 0
    
    @objc dynamic var isExist: Bool = false
}
