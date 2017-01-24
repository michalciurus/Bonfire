//
//  SpriteComponent.swift
//  Bestiary
//
//  Created by Michal Ciurus on 15/01/17.
//  Copyright © 2017 MichalCiurus. All rights reserved.
//

import SpriteKit
import GameplayKit

public class SpriteComponent: GKComponent {
    
    let node: SKSpriteNode
    
    public init(texture: SKTexture) {
        node = SKSpriteNode(texture: texture, size: texture.size())
        super.init()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented yet")
    }
    
}
