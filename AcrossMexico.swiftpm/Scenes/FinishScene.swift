//
//  File.swift
//  
//
//  Created by Anne Victoria Batista Auzier on 18/04/23.
//

import Foundation
import SpriteKit

class FinishScene: SKScene {
    
    var backgroundFinishMusic = SKAudioNode(fileNamed: "forestSound.mp3")
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
        
        let backgroundFinish = SKSpriteNode(imageNamed: "congrads")
        backgroundFinish.texture?.filteringMode = .nearest
        backgroundFinish.zPosition = -10
        backgroundFinish.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        backgroundFinish.scene?.scaleMode = .aspectFill
        self.addChild(backgroundFinish)
        
        text()
        
        backgroundFinishSound()

    }
    override func didMove(to view: SKView) {
        self.scaleMode = .aspectFill
    }
    
    func text(){
        let labelFinish: SKLabelNode = SKLabelNode(text: "")
        labelFinish.verticalAlignmentMode = .center
        labelFinish.fontName = "PixelOperator8"
        labelFinish.fontColor = .white
        labelFinish.fontSize = 14
        labelFinish.position = CGPoint(x: -110, y: -50)
        labelFinish.numberOfLines = 0
        labelFinish.zPosition += 5
        labelFinish.setScale(0.7)
        
        self.addChild(labelFinish)
       
        if LabScene.sharedPlants.contactPlants.contains(4){
            labelFinish.position = CGPoint(x: -115, y: -50)
            labelFinish.text = "Congratulations! You have succeeded in making Guaco tea! \n\n\nA simple natural remedy that can help treat many people, \n\nusing medicinal plants, whose recognition in many regions of \n\nBrazil was due to indigenous knowledge that was passed from \n\ngeneration to generation. I hope that this experience has made \n\nyou value this ancient knowledge and realize the power \n\nof nature to heal our bodies and minds."
        }
        if LabScene.sharedPlants.contactPlants.contains(1) {
            labelFinish.text = "Wow, despite not being the right plant to treat respiratory \n\nproblems, you still managed to produce Andiroba tea! \n\n\nA simple natural remedy that can help treat many people, using \n\nmedicinal plants, whose recognition in many regions of Brazil was \n\ndue to indigenous knowledge that was passed down from generation \n\nto generation. I hope this simple experience made you appreciate \n\nthis ancestral knowledge and realize the power of nature to heal \n\nour bodies and minds."
        }
        if LabScene.sharedPlants.contactPlants.contains(2) {
            labelFinish.text = "Wow, despite not being the right plant to treat respiratory \n\nproblems, you still managed to produce Boldo tea! \n\n\nA simple natural remedy that can help treat many people, using \n\nmedicinal plants, whose recognition in many regions of Brazil was \n\ndue to indigenous knowledge that was passed down from generation \n\nto generation. I hope this simple experience made you appreciate \n\nthis ancestral knowledge and realize the power of nature to heal \n\nour bodies and minds."
        }
        if LabScene.sharedPlants.contactPlants.contains(3) {
            labelFinish.text = "Wow, despite not being the right plant to treat respiratory \n\nproblems, you still managed to produce Cana-de-Macaco tea! \n\n\nA simple natural remedy that can help treat many people, using \n\nmedicinal plants, whose recognition in many regions of Brazil was \n\ndue to indigenous knowledge that was passed down from generation \n\nto generation. I hope this simple experience made you appreciate \n\nthis ancestral knowledge and realize the power of nature to heal \n\nour bodies and minds."
        }
    }
    
    func backgroundFinishSound() {
        backgroundFinishMusic.run(SKAction.changeVolume(to: Float(0.6), duration: 0))
        backgroundFinishMusic.run(.play())
        self.addChild(backgroundFinishMusic)
    }
}


