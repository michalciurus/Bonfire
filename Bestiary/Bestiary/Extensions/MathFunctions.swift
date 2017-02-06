//
//  MathFunctions.swift
//  Bestiary
//
//  Created by Michal Ciurus on 26/01/17.
//  Copyright © 2017 MichalCiurus. All rights reserved.
//

import Foundation
import GameplayKit

public func vector2(point: CGPoint) -> vector_float2 {
    return vector2(Float(point.x), Float(point.y))
}
