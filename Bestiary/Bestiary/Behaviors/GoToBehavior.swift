//
//  GoToBehavior.swift
//  Bestiary
//
//  Created by Michal Ciurus on 15/01/17.
//  Copyright © 2017 MichalCiurus. All rights reserved.
//

import GameplayKit
import SceneKit

public class GoToBehavior: GKBehavior {
    
    public var currentTarget: GKAgent?
    
    public init(coordinate: vector_float2) {
        super.init()
        let coordAgent = GKAgent2D()
        coordAgent.position = coordinate
        coordAgent.radius = 20
        currentTarget = coordAgent
        self.setGoToGoal()
    }
    
    public init(agent: GKAgent) {
        super.init()
        self.currentTarget = agent
        self.setGoToGoal()
    }
    
    func setGoToGoal() {
        if let target = currentTarget {
            setWeight(1, for: GKGoal(toSeekAgent: target))
        }
    }
}
