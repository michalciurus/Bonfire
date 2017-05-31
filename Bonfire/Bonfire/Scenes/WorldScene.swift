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
    var mainChar: MainCharEntity!
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
        
        let walls = SKNode.obsta
    }
    
    override func didMove(to view: SKView) {
        self.entityRenderer = EntityRenderer(scene: self)
        mainChar = MainCharEntity(texture: SKTexture(imageNamed: "mainchar"))
        entityRenderer.add(entity: mainChar)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches[touches.startIndex]
        let loc = touch.location(in: self)
        mainChar.goTo(destination: vector2(Float(loc.x), Float(loc.y)))
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
