//
//  float4x4.swift
//  AR-Сheckers
//
//  Created by Vakula Maksim on 3/19/19.
//  Copyright © 2019 Vakula Maksim. All rights reserved.
//

import SceneKit

extension float4x4 {
    var translation: float3 {
        let translation = self.columns.3
        return float3(translation.x, translation.y, translation.z)
    }
}
