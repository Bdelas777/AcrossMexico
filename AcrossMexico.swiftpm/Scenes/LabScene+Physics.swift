//
//  File.swift
//  
//
//  Created by Anne Victoria Batista Auzier on 15/04/23.
//

import Foundation
import SpriteKit
import Dispatch

extension LabScene: SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.node?.name == "bottle" && contact.bodyB.node?.name == "guacoplantLab" || contact.bodyA.node?.name == "guacoplantLab" && contact.bodyB.node?.name == "bottle" {
            verifyAnimation = true
            LabScene.sharedPlants.contactPlants.append(4)
            bottleLabNode?.animateTexture(named: "bottle%@", range: 1...3, timePerFrame: 1)
            self.guacoLabNode?.removeFromParent()
    
        }
        if contact.bodyA.node?.name == "bottle" && contact.bodyB.node?.name == "andirobaplantLab" || contact.bodyA.node?.name == "andirobaplantLab" && contact.bodyB.node?.name == "bottle" {
            verifyAnimation = true
            LabScene.sharedPlants.contactPlants.append(1)
            bottleLabNode?.animateTexture(named: "bottle%@", range: 1...3, timePerFrame: 1)
            self.andirobaLabNode?.removeFromParent()
        }
        if contact.bodyA.node?.name == "bottle" && contact.bodyB.node?.name == "boldoplantLab" || contact.bodyA.node?.name == "boldoplantLab" && contact.bodyB.node?.name == "bottle" {
            verifyAnimation = true
            LabScene.sharedPlants.contactPlants.append(2)
            bottleLabNode?.animateTexture(named: "bottle%@", range: 1...3, timePerFrame: 1)
            self.boldoLabNode?.removeFromParent()
        }
        if contact.bodyA.node?.name == "bottle" && contact.bodyB.node?.name == "canaplantLab" || contact.bodyA.node?.name == "canaplantLab" && contact.bodyB.node?.name == "bottle" {
            verifyAnimation = true
            LabScene.sharedPlants.contactPlants.append(3)
            bottleLabNode?.animateTexture(named: "bottle%@", range: 1...3, timePerFrame: 1)
            self.canaLabNode?.removeFromParent()
        }
        
        if verifyAnimation == true {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                self.deliverButton = SKButtonNode(imageNamed: "deliver", clickAction: {[weak self] in
                    let finishScene = FinishScene()
                    finishScene.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    finishScene.scaleMode = .aspectFit
                    finishScene.anchorPoint = .init(x: 0.5, y: 0.5)
                    self!.view?.presentScene(finishScene)
                    
                    self?.backgroundLabMusic.removeFromParent()
                    self?.deliverButton?.removeFromParent()
                })
                self.deliverButton?.position = CGPoint(x: 0, y: -60)
                self.deliverButton?.setScale(0.5)
                self.addChild(self.deliverButton!)
            }
        }
    }
}
