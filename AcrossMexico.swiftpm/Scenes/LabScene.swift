//
//  LabScene.swift
//  
//
//  Created by Anne Victoria Batista Auzier on 11/04/23.
//

import Foundation
import SpriteKit

class LabScene: SKScene {
    
    public var currentNode: SKNode?
    
    var bottleLabNode: BottleNode?
    var guacoLabNode: OlmecaNode?
    var andirobaLabNode: SculptureNode?
    var boldoLabNode: CrossNode?
    var canaLabNode: MaskNode?
    
    var fireLab: Fire?
    var smoke: Smoke?
    
    var deliverButton: SKButtonNode?
    var nextButtonLab: SKButtonNode?
    var card: SKBalloonNode?
    var cientistAgain: SKBalloonNode?
    
    var backgroundLabMusic = SKAudioNode(fileNamed: "labSound.mp3")
    
    var verifyAnimation: Bool = false
    public static let sharedPlants = LabScene()
    var contactPlants: [Int] = []
    var labTextWin: [String] = [
        "I see you got the right plant, so let's prepare \n\nthe medicine!",
        "Pick up the plant and drag it to the pot."
    ]
    var labTextLost: [String] = [
        "Gee, this wouldn't be the right plant to treat respiratory \n\ndiseases. But let's make a remedy out of the plant \n\nyou took.",
        "Pick up the plant and drag it to the pot."
    ]
    var indexWin: Int = -1
    var indexLost: Int = -1
    
    override func sceneDidLoad() {
        bottleLabNode = BottleNode()
        bottleLabNode?.name = "bottle"
        bottleLabNode?.position = CGPoint(x: 0, y: 15)
        self.addChild(bottleLabNode!)
        
        fireLab = Fire()
        fireLab?.position = CGPoint(x: 0, y: -43)
        self.addChild(fireLab!)
        
        smoke = Smoke()
        smoke?.position = CGPoint(x: 0, y: 50)
        self.addChild(smoke!)
        
        self.scaleMode = .aspectFill
        
        backgroundLabSound()
    }
    
    override func didMove(to view: SKView) {
        setupLab()
        self.physicsWorld.contactDelegate = self
        
        if GeneralScene.shared.objectsCollected.contains("guacoo") {
            guacoLabNode = OlmecaNode()
            guacoLabNode?.name = "guacoplantLab"
            guacoLabNode?.position = CGPoint(x: -210, y: -100)
            guacoLabNode?.setScale(2)
            self.addChild(guacoLabNode!)
        }
        if GeneralScene.shared.objectsCollected.contains("andirobaa") {
            andirobaLabNode = SculptureNode()
            andirobaLabNode?.name = "andirobaplantLab"
            andirobaLabNode?.position = CGPoint(x: -90, y: -100)
            andirobaLabNode?.setScale(2)
            self.addChild(andirobaLabNode!)
        }
        if GeneralScene.shared.objectsCollected.contains("boldoo") {
            boldoLabNode = CrossNode()
            boldoLabNode?.name = "boldoplantLab"
            boldoLabNode?.position = CGPoint(x: 90, y: -100)
            boldoLabNode?.setScale(2)
            self.addChild(boldoLabNode!)
        }
        if GeneralScene.shared.objectsCollected.contains("canaa") {
            canaLabNode = MaskNode()
            canaLabNode?.name = "canaplantLab"
            canaLabNode?.position = CGPoint(x: 210, y: -100)
            canaLabNode?.setScale(2)
            self.addChild(canaLabNode!)
        }
    }
    
    func setupLab() {
        
        let background = SKSpriteNode(imageNamed: "lab")
        background.texture?.filteringMode = .nearest
        background.position = CGPoint(x: 0, y: 0)
        background.zPosition = -10
        
        let scaleX = (size.width / background.size.width)
        let scaleY = (size.height / background.size.height) / 1.2
        let scale = max(scaleX, scaleY)
        background.setScale(scale)
        
        self.addChild(background)
        
        cientistAgain = SKBalloonNode(imageNamed: "cientist3")
        cientistAgain?.position = CGPoint(x: -4, y: -15)
        cientistAgain?.zPosition = 4
        cientistAgain?.setScale(1.2)
        cientistAgain?.setHide(false)
        self.addChild(cientistAgain!)
        
        if GeneralScene.shared.objectsCollected.contains("guacoo"){
            cientistAgain?.change(text: "Phew!! Thank goodness you brought the plant in time.")
            
            nextButtonLab = SKButtonNode(imageNamed: "right2", clickAction: { [weak self] in
                self?.indexWin += 1
                if(self!.indexWin >= self!.labTextWin.count) {
                    self?.cientistAgain?.removeFromParent()
                    self?.nextButtonLab?.setHideButton(true)
                    // self?.teste?.change(text: "")
                } else {
                    self?.cientistAgain?.change(text: (self?.labTextWin[self?.indexWin ?? 0])!)
                }
            })
            nextButtonLab?.position = .init(x: 280, y: -150)
            nextButtonLab?.setScale(0.18)
            self.addChild(nextButtonLab!)
        }
        else {
            cientistAgain?.change(text: "Phew!! Thank goodness you brought the plant in time.")
            
            nextButtonLab = SKButtonNode(imageNamed: "right2", clickAction: { [weak self] in
                self?.indexLost += 1
                if(self!.indexLost >= self!.labTextLost.count) {
                    self?.cientistAgain?.removeFromParent()
                    self?.nextButtonLab?.setHideButton(true)
                    // self?.teste?.change(text: "")
                } else {
                    self?.cientistAgain?.change(text: (self?.labTextLost[self?.indexLost ?? 0])!)
                }
            })
            nextButtonLab?.position = .init(x: 280, y: -150)
            nextButtonLab?.setScale(0.18)
            self.addChild(nextButtonLab!)
        }
    }
    
    func backgroundLabSound() {
        backgroundLabMusic.run(SKAction.changeVolume(to: Float(0.2), duration: 0))
        backgroundLabMusic.run(.play())
        self.addChild(backgroundLabMusic)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            
            let touchesNodes = self.nodes(at: location)
            for node in touchesNodes {
                if node.name == "guacoplantLab" || node.name == "andirobaplantLab" || node.name == "boldoplantLab" || node.name == "canaplantLab" {
                    self.currentNode = node
                }
            }
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first, let node = currentNode {
            if LabScene.sharedPlants.contactPlants.count == 0 {
                let touchLocation = touch.location(in: self)
                node.position = touchLocation
            }
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.currentNode = nil
    }
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.currentNode = nil
    }
}
