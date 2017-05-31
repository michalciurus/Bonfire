//
//  GoToComponent.swift
//  Bestiary
//
//  Created by Michal Ciurus on 15/01/17.
//  Copyright © 2017 MichalCiurus. All rights reserved.
//

import SpriteKit
import GameplayKit
import RxSugar
import RxSwift

private struct GoToComponentConstants {
    static let goToGoalAcceptedMargin: Float = 30.0;
}

public class GoToComponent: GKAgent2D, GKAgentDelegate {
    
    public let didReachGoal: CompletionEvent<Void> = CompletionEvent()
    
    private typealias C = GoToComponentConstants
    private let currentGoToTarget: vector_float2
    
    public init(startPosition: vector_float2, startRotation: Float, coordinate: vector_float2) {
        self.currentGoToTarget = coordinate
        super.init()
        self.delegate = self
        self.maxSpeed = 200
        self.maxAcceleration = 100
        self.mass = 0.1
        self.speed = 100
        self.radius = 40
        position = startPosition
        rotation = startRotation
        behavior = GoToBehavior(coordinate: coordinate)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func agentWillUpdate(_ agent: GKAgent) {
        
    }
    
    public func agentDidUpdate(_ agent: GKAgent) {
        self.speed = 100
        entity?.getSpriteComponent() {
            $0.node.position = CGPoint(x: CGFloat(position.x), y: CGFloat(position.y))
            $0.node.zRotation = CGFloat(rotation)
            if (didReachGoToGoal()) {
                didReachGoal.fireEvent(element: ())
            }
        }
    }
    
    public func didReachGoToGoal() -> Bool {
        return distance(currentGoToTarget, self.position) <= C.goToGoalAcceptedMargin
    }
}
