//
//  GKEntityComponentsExtension.swift
//  Bestiary
//
//  Created by Michal Ciurus on 15/01/17.
//  Copyright © 2017 MichalCiurus. All rights reserved.
//

import GameplayKit

extension GKEntity {
    func getSpriteComponent(foundSpriteComponent : (SpriteComponent) -> Void) {
        if let spriteComponent = self.component(ofType: SpriteComponent.self) {
            foundSpriteComponent(spriteComponent)
        }
    }
}
