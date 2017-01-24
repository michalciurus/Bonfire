//
//  MainCharEntity.swift
//  Bestiary
//
//  Created by Michal Ciurus on 15/01/17.
//  Copyright © 2017 MichalCiurus. All rights reserved.
//

import SpriteKit
import GameplayKit

public class MainCharEntity: GKEntity {
    
    public init(texture: SKTexture) {
        super.init()
        
        let spriteComponent = SpriteComponent(texture: texture)
        self.addComponent(spriteComponent)
        self.addComponent(GoToComponent(coordinate: vector2(200,200)))
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
