//
//  EntityToSceneRenderer.swift
//  Bestiary
//
//  Created by Michal Ciurus on 15/01/17.
//  Copyright © 2017 MichalCiurus. All rights reserved.
//

import SpriteKit
import GameplayKit

public class EntityRenderer {
    private var entities = Set<GKEntity>()
    private let scene: SKScene
    
    public init(scene: SKScene) {
        self.scene = scene
    }
    
    public func add(entity: GKEntity) {
        entity.getSpriteComponent() {
            scene.addChild($0.node)
        }
        
        entities.insert(entity)
    }
    
    public func remove(entity: GKEntity) {
        entity.getSpriteComponent() {
            $0.node.removeFromParent()
        }
        
        entities.remove(entity)
    }
    
    public func update(delta: TimeInterval) {
        entities.forEach() {
            $0.update(deltaTime: delta)
        }
    }
}
