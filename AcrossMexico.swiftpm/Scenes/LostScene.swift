//
//  LostScene.swift
//  AcrossMexico
//
//  Created by Bernardo de la Sierra on 23/01/24.
//
import Foundation
import SpriteKit

class LostScene: SKScene {
    var restart: SKButtonNode?

    override func sceneDidLoad() {
        super.sceneDidLoad()

        let backgroundLost = SKSpriteNode(imageNamed: "LostScreen")
        backgroundLost.texture?.filteringMode = .nearest
        backgroundLost.zPosition = -10
        backgroundLost.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        backgroundLost.scene?.scaleMode = .aspectFill
        self.addChild(backgroundLost)

       
    }

    override func didMove(to view: SKView) {
        self.scaleMode = .aspectFill

        restart = SKButtonNode(imageNamed: "RetryButton", clickAction: { [weak self] in
            self?.restartGame()
        })
        restart?.position = CGPoint(x: 0, y: -70)
        restart?.setScale(1)
        self.addChild(restart!)
    }

    func restartGame() {
        GameManagerVM.currentIndex = 0
        let scene = GeneralScene()
        scene.size = CGSize(width: 1400, height: 1300)
        scene.scaleMode = .aspectFill
        scene.anchorPoint = .init(x: 0.5, y: 0.5)
        self.view?.presentScene(scene)
        GeneralScene.shared.objectsCollected = []
    }

 
}
