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
    var tapGesture: UITapGestureRecognizer!
    var mainChar: MainCharEntity!
    
    override func didMove(to view: SKView) {
        
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTap))
        view.addGestureRecognizer(tapGesture)
        
        self.entityRenderer = EntityRenderer(scene: self)
        mainChar = MainCharEntity(texture: SKTexture(image: #imageLiteral(resourceName: "mainchar")))
        entityRenderer.add(entity: mainChar)
    }
    
    func didTap(sender: UIGestureRecognizer) {
        var touchLocation = sender.location(in: sender.view)
        touchLocation = self.convertPoint(fromView: touchLocation)
//        mainChar.goTo(destination: vector2(Float(touchLocation.x), Float(touchLocation.y)))
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
