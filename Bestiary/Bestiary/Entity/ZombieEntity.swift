//
//  ZombieEntity.swift
//  Bestiary
//
//  Created by Michal Ciurus on 28/03/17.
//  Copyright © 2017 MichalCiurus. All rights reserved.
//

import SpriteKit
import GameplayKit
import RxSwift

public class ZombieEntity: GKEntity {
    
    private let spriteComponent: SpriteComponent
    
    public init(texture: SKTexture) {
        spriteComponent = SpriteComponent(texture: texture)
        super.init()
        self.addComponent(spriteComponent)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
