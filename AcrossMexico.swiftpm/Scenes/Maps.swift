//
//  ForestScene+Maps.swift
//  
//
//  Created by Bernardo de la Sierra on 11/04/23.
//

import Foundation
import SpriteKit

extension GeneralScene {
    func setupBackgroundParallax() {
        var calculateZPosition: CGFloat = 10
        let backgroundOrder: [String] = [
            "layer_4",
            "layer_3",
            "layer_2",
            "layer_1",
        ]

        for layer in backgroundOrder {
            let bgLayer = SKSpriteNode(imageNamed: layer)
            bgLayer.name = layer
            bgLayer.position.y = (bgLayer.size.height / 8)
            bgLayer.zPosition = -calculateZPosition
            bgLayer.texture?.filteringMode = .nearest
            self.addChild(bgLayer)
            parallaxNodes.append(bgLayer)

            calculateZPosition += 2
        }
    }
    
    func moveBackgroundParallax() {
        var calculateDuration: CGFloat = 0
        for parallaxNode in parallaxNodes {
            parallaxNode.run(.moveTo(x: (self.internNode?.position.x)! * 0.3 , duration: 0.8))
            calculateDuration += 1
        }
    }
    
    func createInfitinyBackground() {
        for i in 0...2 {
            let ground = SKSpriteNode(imageNamed: "ground_extended")
//            ground.size = CGSize(width: self.scene?.size.width ?? 0, height: 150)
            ground.texture?.filteringMode = .nearest
            ground.zPosition = -10
            ground.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            ground.position.y = 4.5
            ground.position = CGPoint(x: CGFloat(i) * ground.size.width, y: 5)
            
            self.addChild(ground)
        }
    }
}
