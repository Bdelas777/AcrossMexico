//
//  FinishScene.swift
//  AcrossMexico
//
//  Created by Bernardo de la Sierra on 23/01/24.
//

import Foundation
import SpriteKit
import RealityKit

class FinishScene: SKScene {
    var gift: SKButtonNode?
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

        gift = SKButtonNode(imageNamed: "RetryButton", clickAction: { [weak self] in
            self?.restartGame()
        })
        gift?.position = CGPoint(x: 0, y: -70)
        gift?.setScale(0.6)
        self.addChild(gift!)
    }

    func restartGame() {
 
        
        let realityVC = RealityScene()
        
        // Use DispatchQueue to present the view controller after the view hierarchy is set up
        DispatchQueue.main.async {
            if let viewController = self.view?.window?.rootViewController {
                viewController.present(realityVC, animated: true, completion: nil)
            }
        }
        
        
    }

    
    
    func backgroundFinishSound() {
        backgroundFinishMusic.run(SKAction.changeVolume(to: Float(0.6), duration: 0))
        backgroundFinishMusic.run(.play())
        self.addChild(backgroundFinishMusic)
    }
}


