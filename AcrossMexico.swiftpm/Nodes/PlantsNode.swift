//
//  File.swift
//  
//
//  Created by Anne Victoria Batista Auzier on 04/04/23.
//

import Foundation
import SpriteKit

class PlantsNode: SKNode {
    var spritePlants: SKSpriteNode
    override init() {
        spritePlants = SKSpriteNode(imageNamed: "guaco1")
        super.init()
        
        let physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: spritePlants.size.width, height: spritePlants.size.height))
        physicsBody.affectedByGravity = false
        physicsBody.allowsRotation = false
        physicsBody.isDynamic = true
        physicsBody.categoryBitMask = 2
        physicsBody.collisionBitMask = 0
        physicsBody.contactTestBitMask = 1
        spritePlants.texture?.filteringMode = .nearest
        self.physicsBody = physicsBody
        
        self.addChild(spritePlants)
        self.spritePlants.run(.repeatForever(.animate(with: .init(withFormat: "guaco%@", range: 1...6), timePerFrame: 0.2)))
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class AndirobaNode: SKNode {
    var andirobaPlant: SKSpriteNode
    override init() {
        andirobaPlant = SKSpriteNode(imageNamed: "andiroba")
        super.init()
        
        let physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: andirobaPlant.size.width, height: andirobaPlant.size.height))
        physicsBody.affectedByGravity = false
        physicsBody.allowsRotation = false
        physicsBody.isDynamic = true
        physicsBody.categoryBitMask = 2
        physicsBody.collisionBitMask = 0
        physicsBody.contactTestBitMask = 1
        
        andirobaPlant.texture?.filteringMode = .nearest
        self.physicsBody = physicsBody
        self.addChild(andirobaPlant)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class BoldoNode: SKNode {
    var boldoPlant: SKSpriteNode
    override init() {
        boldoPlant = SKSpriteNode(imageNamed: "boldo")
        super.init()
        
        let physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: boldoPlant.size.width, height: boldoPlant.size.height))
        physicsBody.affectedByGravity = false
        physicsBody.allowsRotation = false
        physicsBody.isDynamic = true
        physicsBody.categoryBitMask = 2
        physicsBody.collisionBitMask = 0
        physicsBody.contactTestBitMask = 1
        
        boldoPlant.texture?.filteringMode = .nearest
        self.physicsBody = physicsBody
        self.addChild(boldoPlant)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
class CanaNode: SKNode {
    var canaPlant: SKSpriteNode
    override init() {
        canaPlant = SKSpriteNode(imageNamed: "cana")
        super.init()
        
        let physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: canaPlant.size.width, height: canaPlant.size.height))
        physicsBody.affectedByGravity = false
        physicsBody.allowsRotation = false
        physicsBody.isDynamic = true
        physicsBody.categoryBitMask = 2
        physicsBody.collisionBitMask = 0
        physicsBody.contactTestBitMask = 1
        
        canaPlant.texture?.filteringMode = .nearest
        self.physicsBody = physicsBody
        self.addChild(canaPlant)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
