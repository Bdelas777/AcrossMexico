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
    var cientist: SKBalloonNode?
    var nextTalkButton: SKButtonNode?
    var introText: [String] = [
        """
        Despite the challenges encountered in your journey \n\n
        through Mexican history, each stumble revealed  \n\n
        a treasure trove of knowledge. You discovered
        """,
        """
        the greatness of the Olmecs through their monumental\n\n
        sculptures, while the mystical mask of Teotihuacán \n\n
        immersed you in a profoundly spiritual and artistic
        """,
        """
        society. Your path led you to Cantona, the vast \n\n
        archaeological site that holds the secrets of \n\n
        ancient times, and you marveled at the symbolic
        """,
        """
        sculptures of Monte Albán. Finally, you faced \n\n
        the legacy of colonialism represented by the \n\n
        Cross of San Miguel and the resistance
        """,
        """
        embodied by the Canyon of Veracruz, each \n\n
        experience enriching your understanding \n\n
        of Mexico's rich history and culture.
        """
    ]
    var indexText: Int = -1

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

        // Adding background
        let background = SKSpriteNode(imageNamed: "black")
        background.texture?.filteringMode = .nearest
        background.zPosition = 1
        background.position = CGPoint(x: 0, y: 0)
        self.addChild(background)

        restart = SKButtonNode(imageNamed: "RetryButton", clickAction: { [weak self] in
            self?.restartGame()
        })
        restart?.position = CGPoint(x: 0, y: -70)
        restart?.setScale(1)
        self.addChild(restart!)

        // Add introText
        nextTalkButton = SKButtonNode(imageNamed: "PurpleRightArrow", clickAction: { [weak self] in
            self?.indexText += 1

            if(self!.indexText >= self!.introText.count) {
                self?.cientist?.removeFromParent()
                self?.nextTalkButton?.setHideButton(true)
                background.removeFromParent() // Remove background when text ends
            } else {
                self?.cientist?.change(text: (self?.introText[self?.indexText ?? 0])!)
            }
        })
        nextTalkButton?.position = .init(x: 230, y: -180)
        nextTalkButton?.setScale(0.2)
        self.addChild(nextTalkButton!)

        // Add cientist
        cientist = SKBalloonNode(imageNamed: "DialogoNaranja")
        cientist?.position = CGPoint(x: -6, y: -74)
        cientist?.zPosition = 4
        cientist?.setScale(1)

        cientist?.setHide(false)
        cientist?.change(text: "You lost but you... ")
        self.addChild(cientist!)
    }

    func restartGame() {
        GameManagerVM.currentIndex = 0
        let scene = GeneralScene()
        scene.size = CGSize(width: 1300, height: 1200)
        scene.scaleMode = .aspectFill
        scene.anchorPoint = .init(x: 0.5, y: 0.5)
        self.view?.presentScene(scene)
        GeneralScene.shared.objectsCollected = []
    }
}
