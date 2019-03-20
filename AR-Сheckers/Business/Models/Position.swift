//
//  Position.swift
//  AR-Сheckers
//
//  Created by Vakula Maksim on 3/19/19.
//  Copyright © 2019 Vakula Maksim. All rights reserved.
//

import simd

final class Position {
    var coordinate: float3
    
    var numberValue: Int
    var latterValue: Int
    
    init(numberValue: Int, latterValue: Int, coordinateXYZ: float3) {
        self.coordinate = coordinateXYZ
        
        self.numberValue = numberValue
        self.latterValue = latterValue
    }
    
    init(numberValue: Int, latterValue: Int, coordinateXYZT: float4x4) {
        self.coordinate = coordinateXYZT.translation
        
        self.numberValue = numberValue
        self.latterValue = latterValue
    }
}
