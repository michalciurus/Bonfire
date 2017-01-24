//
//  WorldScene.swift
//  Bonfire
//
//  Created by Michal Ciurus on 01/12/16.
//  Copyright © 2016 Michalciurus. All rights reserved.
//

import SpriteKit
import GameplayKit
import Bestiary

class WorldScene: SKScene {
    
    var entityRenderer: EntityRenderer!
    var lastUpdateTime: TimeInterval?
    
    override func didMove(to view: SKView) {
        
        self.entityRenderer = EntityRenderer(scene: self)
        let char = MainCharEntity(texture: SKTexture(image: #imageLiteral(resourceName: "mainchar")))
        entityRenderer.add(entity: char)
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        super.update(currentTime)
        var delta = currentTime
        if let lastUpdateTime = lastUpdateTime {
            delta = delta - lastUpdateTime
        }
        
        lastUpdateTime = currentTime
        
        entityRenderer.update(delta: delta)
    }
    
}
