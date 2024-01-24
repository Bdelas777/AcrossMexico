//
//  File.swift
//  
//
//  Created by Anne Victoria Batista Auzier on 15/04/23.
//

import Foundation
import SpriteKit

class BottleNode: SKNode {
    var bottleNode: SKSpriteNode
    
    override init() {
        bottleNode = SKSpriteNode(imageNamed: "bottle1")
        super.init()
        
        let physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: bottleNode.size.width, height: bottleNode.size.height))
        physicsBody.affectedByGravity = false
        physicsBody.allowsRotation = false
        physicsBody.isDynamic = false
        physicsBody.categoryBitMask = 1
        physicsBody.collisionBitMask = 0
        physicsBody.contactTestBitMask = 2
        
        bottleNode.texture?.filteringMode = .nearest
        bottleNode.setScale(2)
        self.physicsBody = physicsBody
        self.addChild(bottleNode)
    
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func animateTexture(named: String, range: ClosedRange<Int>, timePerFrame: CGFloat) {
        bottleNode.run(.animate(with: .init(withFormat: named, range: range), timePerFrame: timePerFrame))
    }
//    public func textureAnimation(spriteSheet: [SKTexture], timeFrame: CGFloat){
//        bottleNode.run(.animate(with: spriteSheet, timePerFrame: timeFrame))
//    }
}
