//
//  File.swift
//  
//
//  Created by Anne Victoria Batista Auzier on 19/04/23.
//

import Foundation
import SpriteKit

class Fire: SKNode {
    var spriteFire: SKSpriteNode
    override init() {
        spriteFire = SKSpriteNode(imageNamed: "char_idle1")
        super.init()
        
        spriteFire.texture?.filteringMode = .nearest
        self.addChild(spriteFire)
        
        self.spriteFire.run(.repeatForever(.animate(with: .init(withFormat: "fire%@", range: 1...4), timePerFrame: 0.6)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
class Smoke: SKNode {
    var spriteSmoke: SKSpriteNode
    override init() {
        spriteSmoke = SKSpriteNode(imageNamed: "char_idle1")
        super.init()
        
        spriteSmoke.texture?.filteringMode = .nearest
        self.addChild(spriteSmoke)
        
        self.spriteSmoke.run(.repeatForever(.animate(with: .init(withFormat: "smoke%@", range: 1...6), timePerFrame: 0.6)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
