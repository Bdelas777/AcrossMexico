//
//  ObjectsNode.swift
//  AcrossMexico
//
//  Created by Bernardo de la Sierra on 23/01/24.
//

import Foundation
import SpriteKit

class OlmecaNode: SKNode {
    var olmeca: SKSpriteNode
    override init() {
        olmeca = SKSpriteNode(imageNamed: "Olmeca")
        super.init()
        
        let physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: olmeca.size.width, height: olmeca.size.height))
        physicsBody.affectedByGravity = false
        physicsBody.allowsRotation = false
        physicsBody.isDynamic = true
        physicsBody.categoryBitMask = 2
        physicsBody.collisionBitMask = 0
        physicsBody.contactTestBitMask = 1
        olmeca.texture?.filteringMode = .nearest
        self.physicsBody = physicsBody
        
        self.addChild(olmeca)
       
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class SculptureNode: SKNode {
    var sculpture: SKSpriteNode
    override init() {
        sculpture = SKSpriteNode(imageNamed: "Escultura")
        super.init()
        
        let physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: sculpture.size.width, height: sculpture.size.height))
        physicsBody.affectedByGravity = false
        physicsBody.allowsRotation = false
        physicsBody.isDynamic = true
        physicsBody.categoryBitMask = 2
        physicsBody.collisionBitMask = 0
        physicsBody.contactTestBitMask = 1
        
        sculpture.texture?.filteringMode = .nearest
        self.physicsBody = physicsBody
        self.addChild(sculpture)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CrossNode: SKNode {
    var cross: SKSpriteNode
    override init() {
        cross = SKSpriteNode(imageNamed: "Cruz")
        super.init()
        
        let physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: cross.size.width, height: cross.size.height))
        physicsBody.affectedByGravity = false
        physicsBody.allowsRotation = false
        physicsBody.isDynamic = true
        physicsBody.categoryBitMask = 2
        physicsBody.collisionBitMask = 0
        physicsBody.contactTestBitMask = 1
        
        cross.texture?.filteringMode = .nearest
        self.physicsBody = physicsBody
        self.addChild(cross)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class MaskNode: SKNode {
    var mask: SKSpriteNode
    override init() {
        mask = SKSpriteNode(imageNamed: "Mascara")
        super.init()
        
        let physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: mask.size.width, height: mask.size.height))
        physicsBody.affectedByGravity = false
        physicsBody.allowsRotation = false
        physicsBody.isDynamic = true
        physicsBody.categoryBitMask = 2
        physicsBody.collisionBitMask = 0
        physicsBody.contactTestBitMask = 1
        
        mask.texture?.filteringMode = .nearest
        self.physicsBody = physicsBody
        self.addChild(mask)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class VaseNode: SKNode {
    var vase: SKSpriteNode
    override init() {
        vase = SKSpriteNode(imageNamed: "Jarron")
        super.init()
        
        let physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: vase.size.width, height: vase.size.height))
        physicsBody.affectedByGravity = false
        physicsBody.allowsRotation = false
        physicsBody.isDynamic = true
        physicsBody.categoryBitMask = 2
        physicsBody.collisionBitMask = 0
        physicsBody.contactTestBitMask = 1
        
        vase.texture?.filteringMode = .nearest
        self.physicsBody = physicsBody
        self.addChild(vase)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CannonNode: SKNode {
    var canon: SKSpriteNode
    override init() {
        canon = SKSpriteNode(imageNamed: "canon")
        super.init()
        
        let physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: canon.size.width, height: canon.size.height))
        physicsBody.affectedByGravity = false
        physicsBody.allowsRotation = false
        physicsBody.isDynamic = true
        physicsBody.categoryBitMask = 2
        physicsBody.collisionBitMask = 0
        physicsBody.contactTestBitMask = 1
        
        canon.texture?.filteringMode = .nearest
        self.physicsBody = physicsBody
        self.addChild(canon)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


