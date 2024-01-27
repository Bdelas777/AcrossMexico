//
//  GeneralScene.swift
//  AcrossMexico
//
//  Created by Bernardo de la Sierra on 23/01/24.
//

import Foundation
import SpriteKit
import SwiftUI

class GeneralScene: SKScene {
    
    var sceneNode = SKNode()
    
    var internNode: InternNode?
    var olmecaNode: OlmecaNode?
    var sculptureNode: SculptureNode?
    var crossNode: CrossNode?
    var maskNode: MaskNode?
    var labNode: LabNode?
    var vaseNode: VaseNode?
    var cannonNode: CannonNode?
    var timer: TimerNode?
    
    var rightButton: SKButtonNode?
    var leftButton: SKButtonNode?
    
    var infoOlmecaButton: SKButtonNode?
    var vaseInfoButton: SKButtonNode?
    var sculptureInfoButton: SKButtonNode?
    var crossInfoButton: SKButtonNode?
    var maskInfoButton: SKButtonNode?
    var cannonInfoButton: SKButtonNode?
    
    var collectOlmecaButton: SKButtonNode?
    var collectSculptureButton: SKButtonNode?
    var collectCrossButton: SKButtonNode?
    var collectMaskButton: SKButtonNode?
    var collectVaseButton: SKButtonNode?
    var collectCannonButton: SKButtonNode?
    
    var cancelOlmecaButton: SKButtonNode?
    var cancelSculptureButton: SKButtonNode?
    var cancelCrossButton: SKButtonNode?
    var cancelMaskButton: SKButtonNode?
    var cancelVaseButton: SKButtonNode?
    var cancelCannonButton: SKButtonNode?
    var nextTalkButton: SKButtonNode?
    
    var vaseCard: SKBalloonNode?
    var olmecaCard: SKBalloonNode?
    var sculptureCard: SKBalloonNode?
    var crossCard: SKBalloonNode?
    var maskCard: SKBalloonNode?
    var cannonCard: SKBalloonNode?
    var cientist: SKBalloonNode?
    
    var backgroundForestMusic = SKAudioNode(fileNamed: "startSound.mp3")
    var collectPlantsMusic = SKAudioNode(fileNamed: "collectSound.mp3")
    var cancelPlantsMusic = SKAudioNode(fileNamed: "cancelSound.mp3")
    
    var direction: CGFloat = 0
    var moveSpeed: CGFloat = 2
    var pauseTime: Bool = false
    
    public static let shared = GeneralScene()
    var objectsCollected: [String] = []
    var parallaxNodes: [SKNode] = []
    var indexText: Int = -1
    
    
    // Text Intro
    var introText: [String] = [
        "Hola soy Bernardo y sere tu guia por el juego, ",
        "Para conoer lo que hay en las diversas ciudades en las que vive.",
        "No? Okay, let me explain. Medicinal plants are plants that \n\nhave pharmacological action, in other words, they help \n\nin the cure or treatment of several diseases.",
        "And here in the Amazon region it is quite common to use \n\nthe benefits of these plants to cure illnesses.",
        "Thanks to my intense study in the indigenous communities, \n\nI have learned a lot about how much these plants can \n\noffer us if we use them in the right way.",
        "I learned so much that I built a laboratory where I test and \n\nprepare natural remedies using medicinal plants!",
        "However, I am no longer as willing as before and need your \n\nhelp to get the plants and prepare the medicines.",
        "Lately, there have been many respiratory diseases due to \n\nthe constant burning in the region, so I need you to help \n\nme work on a remedy urgently!",
        "Please, pay attention when choosing the plants, because \n\nyour task is collect the plant that has properties that \n\nhelp to treat these diseases as quickly as possible.",
        "Go in search of the plant and then take it to the lab!"
    ]
    
    override func sceneDidLoad() {
        internNode = InternNode()
        internNode?.name = "intern"
        internNode?.position.y = -80
        self.addChild(internNode!)
        
        cannonNode = CannonNode()
        cannonNode?.name = "Cannon"
        cannonNode?.zPosition = -1
        cannonNode?.position.y = -75
        cannonNode?.position.x = 1200
        self.addChild(cannonNode!)
        
        vaseNode = VaseNode()
        vaseNode?.name = "Vase"
        vaseNode?.zPosition = -1
        vaseNode?.position.y = -75
        vaseNode?.position.x = 1000
        self.addChild(vaseNode!)
        
        sculptureNode = SculptureNode()
        sculptureNode?.name = "Sculpture"
        sculptureNode?.zPosition = -1
        sculptureNode?.position.y = -75
        sculptureNode?.position.x = 200
        self.addChild(sculptureNode!)
        
        crossNode = CrossNode()
        crossNode?.name = "Cross"
        crossNode?.zPosition = -1
        crossNode?.position.y = -75
        crossNode?.position.x = 400
        self.addChild(crossNode!)
        
        maskNode = MaskNode()
        maskNode?.name = "Mask"
        maskNode?.zPosition = -1
        maskNode?.position.y = -75
        maskNode?.position.x = 600
        self.addChild(maskNode!)
        
        olmecaNode = OlmecaNode()
        olmecaNode?.name = "Olmeca"
        olmecaNode?.zPosition = -1
        olmecaNode?.position.y = -72
        olmecaNode?.position.x = 800
        self.addChild(olmecaNode!)
        
        labNode = LabNode()
        labNode?.name = "lab_semfundo"
        labNode?.zPosition = -1
        labNode?.position.y = -55
        labNode?.position.x = -190
        self.addChild(labNode!)
        
        setupBackgroundParallax()
        backgroundGeneralSound()
    }
    
    override func didMove(to view: SKView) {
        setupForest()
        self.scaleMode = .aspectFill
        self.physicsWorld.contactDelegate = self
        createInfitinyBackground()
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        if (direction != 0) {
            self.internNode?.xScale = direction
            self.internNode?.position.x += self.direction * moveSpeed
        }
        self.camera?.run(.moveTo(x: self.internNode?.position.x ?? 0, duration: 0.4))
        moveBackgroundParallax()
        if pauseTime == true {
            self.timer?.isPaused = true
        } else {
            self.timer?.isPaused = false
            self.timer!.updateTimer(currentTime: currentTime)
        }
        if self.timer?.minutes == 0 && self.timer?.seconds == 0 {
            let finishScene = LostScene()
            finishScene.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            finishScene.scaleMode = .aspectFit
            finishScene.anchorPoint = .init(x: 0.5, y: 0.5)
            self.view?.presentScene(finishScene)
        }
    }
    
    public func setupForest() {
        let background = SKSpriteNode(imageNamed: "black")
        background.texture?.filteringMode = .nearest
        background.zPosition = 1
        background.position = CGPoint(x: 0, y: 0)
        self.addChild(background)
        
        // ========= Camera & Timer =========
        let camera = SKCameraNode()
        self.camera = camera
        camera.xScale = 0.6
        camera.yScale = 0.6
        self.addChild(camera)
        let constraint: SKConstraint = .distance(.init(lowerLimit: -100, upperLimit: 1000), to: .zero)
        self.camera?.constraints = [constraint]
        
        timer = TimerNode()
        timer?.position.x = 340
        timer?.position.y = 120
        timer?.zPosition = -1
        timer?.setScale(1.2)
        self.camera?.addChild(timer!)
        
        //===== Discover Image ====
        
        cannonCard = SKBalloonNode(imageNamed: "Veracruz")
        cannonCard?.position = CGPoint(x: 1100 , y: 20)
        cannonCard?.zPosition = 2
        cannonCard?.setScale(0.2)
        cannonCard?.setHide(true)
        self.addChild(cannonCard!)
        
        vaseCard = SKBalloonNode(imageNamed: "Cantona")
        vaseCard?.position = CGPoint(x: 900 , y: 20)
        vaseCard?.zPosition = 2
        vaseCard?.setScale(0.2)
        vaseCard?.setHide(true)
        self.addChild(vaseCard!)
        
        sculptureCard = SKBalloonNode(imageNamed: "Monte")
        sculptureCard?.position = CGPoint(x: 100 , y: 30)
        sculptureCard?.zPosition = 2
        sculptureCard?.setScale(0.2)
        sculptureCard?.setHide(true)
        self.addChild(sculptureCard!)
        
        crossCard = SKBalloonNode(imageNamed: "SanMiguel")
        crossCard?.position = CGPoint(x: 300, y: 20)
        crossCard?.zPosition = 2
        crossCard?.setScale(0.2)
        crossCard?.setHide(true)
        self.addChild(crossCard!)
        
        maskCard = SKBalloonNode(imageNamed: "Teotihuacan")
        maskCard?.position = CGPoint(x: 500, y: 20)
        maskCard?.zPosition = 2
        maskCard?.setScale(0.2)
        maskCard?.setHide(true)
        self.addChild(maskCard!)
        
        olmecaCard = SKBalloonNode(imageNamed: "Venta")
        olmecaCard?.position = CGPoint(x: 700, y: 20)
        olmecaCard?.zPosition = 2
        olmecaCard?.setScale(0.2)
        olmecaCard?.setHide(true)
        self.addChild(olmecaCard!)
        
        cientist = SKBalloonNode(imageNamed: "cientist3")
        cientist?.position = CGPoint(x: -4, y: 4)
        cientist?.zPosition = 4
        cientist?.setScale(0.8)
        self.pauseTime = true
        cientist?.setHide(false)
        cientist?.change(text: "Hello, trainee! Welcome to my Institute!")
        self.addChild(cientist!)
        
        // ======== Controls =========
        leftButton = SKButtonNode(imageNamed: "left1", clickAction: { [weak self] in
            self?.direction = -1
            self?.internNode?.playAnim(state: .walk)
        }, unclickAction: { [weak self] in
            self?.direction = 0
            self?.internNode?.playAnim(state: .idle)
        })
        leftButton?.position = .init(x: -330, y: -150)
        leftButton?.setScale(0.2)
        leftButton?.zPosition = 2
        self.camera?.addChild(leftButton!)
        
        rightButton = SKButtonNode(imageNamed: "right1", clickAction: { [weak self] in
            self?.direction = 1
            self?.internNode?.playAnim(state: .walk)
        }, unclickAction: { [weak self] in
            self?.direction = 0
            self?.internNode?.playAnim(state: .idle)
        })
        rightButton?.position = .init(x: 330, y: -150)
        rightButton?.setScale(0.2)
        rightButton?.zPosition = 2
        self.camera?.addChild(rightButton!)
        
        nextTalkButton = SKButtonNode(imageNamed: "right2", clickAction: { [weak self] in
            self?.indexText += 1
            
            if(self!.indexText >= self!.introText.count) {
                self?.cientist?.removeFromParent()
                self?.nextTalkButton?.setHideButton(true)
                self?.pauseTime = false
                background.removeFromParent()
                // self?.teste?.change(text: "")
            } else {
                self?.cientist?.change(text: (self?.introText[self?.indexText ?? 0])!)
            }
        })
        nextTalkButton?.position = .init(x: 190, y: -90)
        nextTalkButton?.setScale(0.1)
        self.addChild(nextTalkButton!)
    }
}
