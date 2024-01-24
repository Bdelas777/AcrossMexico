//
//  StartScene.swift
//  
//
//  Created by Anne Victoria Batista Auzier on 12/04/23.
//

import Foundation
import SpriteKit

class StartScene: SKScene {
    
    var startButton: SKButtonNode?
    var startInitialSceneMusic = SKAudioNode(fileNamed: "forestSound.mp3")
    
    override func sceneDidLoad() {
        let backgroundStart = SKSpriteNode(imageNamed: "startImage")
        backgroundStart.texture?.filteringMode = .nearest
        backgroundStart.zPosition = -10
        backgroundStart.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        backgroundStart.scene?.scaleMode = .aspectFit
        self.addChild(backgroundStart)
        
        startInitialSceneSound()
        
        startButton = SKButtonNode(imageNamed: "playButton", clickAction: {[weak self] in
            let startScene = ForestScene(size: self!.size)
            startScene.scaleMode = self!.scaleMode
            self!.view?.presentScene(startScene)
            self?.startInitialSceneMusic.removeFromParent()
        })
        startButton?.position.x = -180
        startButton?.position.y = -20
        startButton?.setScale(1.2)
        self.addChild(startButton!)
    }
    override func didMove(to view: SKView) {
        print("")
    }
    
    func startInitialSceneSound() {
        startInitialSceneMusic.run(SKAction.changeVolume(by: Float(0.2), duration: 0))
        startInitialSceneMusic.run(.play())
        self.addChild(startInitialSceneMusic)
    }
}