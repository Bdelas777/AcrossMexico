//
//  File.swift
//  
//
//  Created by Anne Victoria Batista Auzier on 18/04/23.
//

import Foundation
import SpriteKit

class LostScene: SKScene {
    var restart: SKButtonNode?
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
        
        let backgroundLost = SKSpriteNode(imageNamed: "lost")
        backgroundLost.texture?.filteringMode = .nearest
        backgroundLost.zPosition = -10
        backgroundLost.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        backgroundLost.scene?.scaleMode = .aspectFill
        self.addChild(backgroundLost)
        
        textLost()
        
    }
    override func didMove(to view: SKView) {
        self.scaleMode = .aspectFill
        restart = SKButtonNode(imageNamed: "retry", clickAction: {[weak self] in
            let scene = GeneralScene()
            scene.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            scene.scaleMode = .aspectFill
            scene.anchorPoint = .init(x: 0.5, y: 0.5)
            self?.view?.presentScene(scene)
            GeneralScene.shared.plantsCollected = []
        })
        restart?.position = CGPoint(x: -180, y: -70)
        restart?.setScale(0.6)
        self.addChild(restart!)
    }
    
    func textLost(){
        let labelFinish: SKLabelNode = SKLabelNode(text: "")
        labelFinish.verticalAlignmentMode = .center
        labelFinish.fontName = "PixelOperator8"
        labelFinish.fontColor = .white
        labelFinish.fontSize = 14
        labelFinish.position = CGPoint(x: -130, y: 0)
        labelFinish.numberOfLines = 0
        labelFinish.zPosition += 5
        labelFinish.setScale(0.7)
        self.addChild(labelFinish)
        
        labelFinish.text = "Unfortunately, you couldn't get the plants in time. \n\n\nBut I know you can do it next time!"
    }
}
