//
// PyramidNode
//  AcrossMexico
//
//  Created by Bernardo de la Sierra on 23/01/24.
//

import Foundation
import SpriteKit

class PyramidNode: SKNode {
    var spriteLab: SKSpriteNode
    
    override init() {
        spriteLab = SKSpriteNode(imageNamed: "Piramide")
        super.init()
        
        let physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: spriteLab.size.width, height: spriteLab.size.height))
        physicsBody.affectedByGravity = false
        physicsBody.allowsRotation = false
        physicsBody.isDynamic = true
        physicsBody.categoryBitMask = 2
        physicsBody.collisionBitMask = 0
        physicsBody.contactTestBitMask = 1
        
        spriteLab.texture?.filteringMode = .nearest
        self.physicsBody = physicsBody
        self.addChild(spriteLab)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

