//
//  GoToComponent.swift
//  Bestiary
//
//  Created by Michal Ciurus on 15/01/17.
//  Copyright © 2017 MichalCiurus. All rights reserved.
//

import SpriteKit
import GameplayKit

private struct GoToComponentConstants {
    static let goToGoalAcceptedMargin: Float = 1.0;
}

public class GoToComponent: GKAgent2D, GKAgentDelegate {
    
    private typealias C = GoToComponentConstants
    
    private let currentGoToTarget: vector_float2
    
    init(coordinate: vector_float2) {
        self.currentGoToTarget = coordinate
        super.init()
        self.delegate = self
        self.maxSpeed = 100
        self.maxAcceleration = 50
        self.radius = radius
        behavior = GoToBehavior(coordinate: coordinate)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func agentWillUpdate(_ agent: GKAgent) {
        entity?.getSpriteComponent() {
            self.position = float2(x: Float($0.node.position.x), y: Float($0.node.position.x))
        }
    }
    
    public func agentDidUpdate(_ agent: GKAgent) {
        entity?.getSpriteComponent() {
            $0.node.position = CGPoint(x: CGFloat(position.x), y: CGFloat(position.y))
            $0.node.zRotation = CGFloat(rotation)
        }
    }
    
    public func didReachGoToGoal() -> Bool {
        return distance(currentGoToTarget, self.position) <= C.goToGoalAcceptedMargin
    }
    
    
}
