//
//  FinishScene.swift
//  AcrossMexico
//
//  Created by Bernardo de la Sierra on 23/01/24.
//

import Foundation
import SpriteKit

class FinishScene: SKScene {
    
    var backgroundFinishMusic = SKAudioNode(fileNamed: "forestSound.mp3")
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
        
        let backgroundFinish = SKSpriteNode(imageNamed: "WinScreen")
        backgroundFinish.texture?.filteringMode = .nearest
        backgroundFinish.zPosition = -10
        backgroundFinish.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        backgroundFinish.scene?.scaleMode = .aspectFill
        self.addChild(backgroundFinish)
      
        
        backgroundFinishSound()

    }
    override func didMove(to view: SKView) {
        self.scaleMode = .aspectFill
    }
  
    
    func backgroundFinishSound() {
        backgroundFinishMusic.run(SKAction.changeVolume(to: Float(0.6), duration: 0))
        backgroundFinishMusic.run(.play())
        self.addChild(backgroundFinishMusic)
    }
}


