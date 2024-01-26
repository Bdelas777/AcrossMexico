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
    var gaucoNode: PlantsNode?
    var andirobaNode: AndirobaNode?
    var boldoNode: BoldoNode?
    var canaNode: CanaNode?
    var labNode: LabNode?
    var vaseNode: VaseNode?
    var cannonNode: CannonNode?
    var timer: TimerNode?
    
    var rightButton: SKButtonNode?
    var leftButton: SKButtonNode?
    
    var infoPlantsButton: SKButtonNode?
    var vaseInfoButton: SKButtonNode?
    var andirobaInfoButton: SKButtonNode?
    var boldoInfoButton: SKButtonNode?
    var canaInfoButton: SKButtonNode?
    var cannonInfoButton: SKButtonNode?
    
    var collectPlantsButton: SKButtonNode?
    var collectAndirobaButton: SKButtonNode?
    var collectBoldoButton: SKButtonNode?
    var collectCanaButton: SKButtonNode?
    var collectVaseButton: SKButtonNode?
    var collectCannonButton: SKButtonNode?
    
    var cancelPlantsButton: SKButtonNode?
    var cancelAndirobaButton: SKButtonNode?
    var cancelBoldoButton: SKButtonNode?
    var cancelCanaButton: SKButtonNode?
    var cancelVaseButton: SKButtonNode?
    var cancelCannonButton: SKButtonNode?
    var nextTalkButton: SKButtonNode?
    
    var vaseCard: SKBalloonNode?
    var guacoCard: SKBalloonNode?
    var andirobaCard: SKBalloonNode?
    var boldoCard: SKBalloonNode?
    var canaCard: SKBalloonNode?
    var cannonCard: SKBalloonNode?
    var cientist: SKBalloonNode?
    
    var backgroundForestMusic = SKAudioNode(fileNamed: "startSound.mp3")
    var collectPlantsMusic = SKAudioNode(fileNamed: "collectSound.mp3")
    var cancelPlantsMusic = SKAudioNode(fileNamed: "cancelSound.mp3")
    
    var direction: CGFloat = 0
    var moveSpeed: CGFloat = 2
    var pauseTime: Bool = false
    
    public static let shared = GeneralScene()
    var plantsCollected: [String] = []
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
        
        andirobaNode = AndirobaNode()
        andirobaNode?.name = "andiroba"
        andirobaNode?.zPosition = -1
        andirobaNode?.position.y = -75
        andirobaNode?.position.x = 200
        self.addChild(andirobaNode!)
        
        boldoNode = BoldoNode()
        boldoNode?.name = "boldo"
        boldoNode?.zPosition = -1
        boldoNode?.position.y = -75
        boldoNode?.position.x = 400
        self.addChild(boldoNode!)
        
        canaNode = CanaNode()
        canaNode?.name = "cana"
        canaNode?.zPosition = -1
        canaNode?.position.y = -75
        canaNode?.position.x = 600
        self.addChild(canaNode!)
        
        gaucoNode = PlantsNode()
        gaucoNode?.name = "guaco"
        gaucoNode?.zPosition = -1
        gaucoNode?.position.y = -72
        gaucoNode?.position.x = 800
        self.addChild(gaucoNode!)
        
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
        
        cannonCard = SKBalloonNode(imageNamed: "boldo_card")
        cannonCard?.position = CGPoint(x: 1200 , y: 15)
        cannonCard?.zPosition = 2
        cannonCard?.setScale(0.2)
        cannonCard?.setHide(true)
        self.addChild(cannonCard!)
        
        vaseCard = SKBalloonNode(imageNamed: "andiroba_card")
        vaseCard?.position = CGPoint(x: 1000 , y: 15)
        vaseCard?.zPosition = 2
        vaseCard?.setScale(0.2)
        vaseCard?.setHide(true)
        self.addChild(vaseCard!)
        
        andirobaCard = SKBalloonNode(imageNamed: "andiroba_card")
        andirobaCard?.position = CGPoint(x: 200 , y: 15)
        andirobaCard?.zPosition = 2
        andirobaCard?.setScale(0.2)
        andirobaCard?.setHide(true)
        self.addChild(andirobaCard!)
        
        boldoCard = SKBalloonNode(imageNamed: "boldo_card")
        boldoCard?.position = CGPoint(x: 400, y: 15)
        boldoCard?.zPosition = 2
        boldoCard?.setScale(0.2)
        boldoCard?.setHide(true)
        self.addChild(boldoCard!)
        
        canaCard = SKBalloonNode(imageNamed: "cana_card")
        canaCard?.position = CGPoint(x: 600, y: 15)
        canaCard?.zPosition = 2
        canaCard?.setScale(0.2)
        canaCard?.setHide(true)
        self.addChild(canaCard!)
        
        guacoCard = SKBalloonNode(imageNamed: "guaco_card")
        guacoCard?.position = CGPoint(x: 800, y: 15)
        guacoCard?.zPosition = 2
        guacoCard?.setScale(0.2)
        guacoCard?.setHide(true)
        self.addChild(guacoCard!)
        
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
