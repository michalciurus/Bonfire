//
//  MainCharEntity.swift
//  Bestiary
//
//  Created by Michal Ciurus on 15/01/17.
//  Copyright © 2017 MichalCiurus. All rights reserved.
//

import SpriteKit
import GameplayKit
import RxSwift

public class MainCharEntity: GKEntity {
    
    private var currentMovementComponent: GKAgent2D?
    private let spriteComponent: SpriteComponent
    private var currentMovementComponentBag = DisposeBag()
    
    public init(texture: SKTexture) {
        spriteComponent = SpriteComponent(texture: texture)
        super.init()
        addComponent(spriteComponent)
    }
    
    public func goTo(destination: vector_float2) {
        finishCurrentMovement()
        let goToComponent = GoToComponent(startPosition: vector2(point: spriteComponent.node.position), startRotation: Float(spriteComponent.node.zRotation), coordinate: destination)
        currentMovementComponent = goToComponent
        goToComponent.didReachGoal
            .subscribe(onNext: { [weak self] _ in
                self?.finishCurrentMovement()
            }).addDisposableTo(currentMovementComponentBag)
        addComponent(goToComponent)
    }
    
    public func finishCurrentMovement() {
        if let currentMovement = currentMovementComponent {
            removeComponent(ofType: type(of: currentMovement))
            currentMovementComponentBag = DisposeBag()
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
