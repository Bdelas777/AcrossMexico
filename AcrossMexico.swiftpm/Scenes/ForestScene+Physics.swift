
import SpriteKit

extension GeneralScene: SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact) {
        
        // Cannon
        if contact.bodyA.node?.name == "intern" && contact.bodyB.node?.name == "Cannon" || contact.bodyA.node?.name == "Cannon" && contact.bodyB.node?.name == "intern" {
            
            self.cannonInfoButton = SKButtonNode(imageNamed: "learnMore", clickAction: { [weak self] in
                
                self?.cannonCard?.setHide(false)
                self?.cannonInfoButton?.removeFromParent()
                self?.pauseTime = true
                
                self?.collectCannonButton = SKButtonNode(imageNamed: "pickUp", clickAction: {[weak self] in
                    self?.cannonCard?.setHide(true)
                    self?.cannonNode?.removeFromParent()
                    self?.collectCannonButton?.removeFromParent()
                    self?.cancelCannonButton?.removeFromParent()
                    self?.cannonInfoButton?.removeFromParent()
                    
                    self?.collectObjectsSound()
                    GeneralScene.shared.plantsCollected.append("Cannon")
                    
                }, unclickAction: {[weak self] in
                    self?.collectPlantsMusic.removeFromParent()
                    self!.pauseTime = false
                })
                self?.collectCannonButton?.position.x = 1240
                self?.collectVaseButton?.position.y = -60
                self?.collectCannonButton?.setScale(0.25)
                self?.addChild(self!.collectCannonButton!)
                
                self?.cancelCannonButton = SKButtonNode(imageNamed: "leave", clickAction: {[weak self] in
                    self?.cannonCard?.setHide(true)
                    self?.cancelCannonButton?.removeFromParent()
                    self?.collectCannonButton?.removeFromParent()
                    self?.cancelObjectsSound()
                }, unclickAction: {[weak self] in
                    self?.cancelPlantsMusic.removeFromParent()
                    self?.pauseTime = false
                })
                self?.cancelCannonButton?.position.x = 1160
                self?.cancelCannonButton?.position.y = -60
                self?.cancelCannonButton?.setScale(0.25)
                self?.addChild(self!.cancelCannonButton!)
            })
            self.cannonInfoButton?.position.y = -40
            self.cannonInfoButton?.position.x = 1200
            self.cannonInfoButton?.zPosition = -1
            self.cannonInfoButton?.setScale(0.23)
            self.addChild(cannonInfoButton!)
        }
        
        // Vase
        if contact.bodyA.node?.name == "intern" && contact.bodyB.node?.name == "Vase" || contact.bodyA.node?.name == "Vase" && contact.bodyB.node?.name == "intern" {
            
            self.vaseInfoButton = SKButtonNode(imageNamed: "learnMore", clickAction: { [weak self] in
                
                self?.vaseCard?.setHide(false)
                self?.vaseInfoButton?.removeFromParent()
                self?.pauseTime = true
                
                self?.collectVaseButton = SKButtonNode(imageNamed: "pickUp", clickAction: {[weak self] in
                    self?.vaseCard?.setHide(true)
                    self?.vaseNode?.removeFromParent()
                    self?.collectVaseButton?.removeFromParent()
                    self?.cancelVaseButton?.removeFromParent()
                    self?.vaseInfoButton?.removeFromParent()
                    
                    self?.collectObjectsSound()
                    GeneralScene.shared.plantsCollected.append("Vase")
                    
                }, unclickAction: {[weak self] in
                    self?.collectPlantsMusic.removeFromParent()
                    self!.pauseTime = false
                })
                self?.collectVaseButton?.position.x = 1040
                self?.collectVaseButton?.position.y = -60
                self?.collectVaseButton?.setScale(0.25)
                self?.addChild(self!.collectVaseButton!)
                
                self?.cancelVaseButton = SKButtonNode(imageNamed: "leave", clickAction: {[weak self] in
                    self?.vaseCard?.setHide(true)
                    self?.cancelVaseButton?.removeFromParent()
                    self?.collectVaseButton?.removeFromParent()
                    self?.cancelObjectsSound()
                }, unclickAction: {[weak self] in
                    self?.cancelPlantsMusic.removeFromParent()
                    self?.pauseTime = false
                })
                self?.cancelVaseButton?.position.x = 960
                self?.cancelVaseButton?.position.y = -60
                self?.cancelVaseButton?.setScale(0.25)
                self?.addChild(self!.cancelVaseButton!)
            })
            self.vaseInfoButton?.position.y = -40
            self.vaseInfoButton?.position.x = 1000
            self.vaseInfoButton?.zPosition = -1
            self.vaseInfoButton?.setScale(0.23)
            self.addChild(vaseInfoButton!)
        }
        
        // Andiroba
        if contact.bodyA.node?.name == "intern" && contact.bodyB.node?.name == "andiroba" || contact.bodyA.node?.name == "andiroba" && contact.bodyB.node?.name == "intern" {
            
            self.andirobaInfoButton = SKButtonNode(imageNamed: "learnMore", clickAction: { [weak self] in
                
                self?.andirobaCard?.setHide(false)
                self?.andirobaInfoButton?.removeFromParent()
                self?.pauseTime = true
                
                self?.collectAndirobaButton = SKButtonNode(imageNamed: "pickUp", clickAction: {[weak self] in
                    self?.andirobaCard?.setHide(true)
                    self?.andirobaNode?.removeFromParent()
                    self?.collectAndirobaButton?.removeFromParent()
                    self?.cancelAndirobaButton?.removeFromParent()
                    self?.andirobaInfoButton?.removeFromParent()
                    
                    self?.collectObjectsSound()
                    GeneralScene.shared.plantsCollected.append("andirobaa")
                    
                }, unclickAction: {[weak self] in
                    self?.collectPlantsMusic.removeFromParent()
                    self!.pauseTime = false
                })
                self?.collectAndirobaButton?.position.x = 240
                self?.collectAndirobaButton?.position.y = -60
                self?.collectAndirobaButton?.setScale(0.25)
                self?.addChild(self!.collectAndirobaButton!)
                
                self?.cancelAndirobaButton = SKButtonNode(imageNamed: "leave", clickAction: {[weak self] in
                    self?.andirobaCard?.setHide(true)
                    self?.cancelAndirobaButton?.removeFromParent()
                    self?.collectAndirobaButton?.removeFromParent()
                    self?.cancelObjectsSound()
                }, unclickAction: {[weak self] in
                    self?.cancelPlantsMusic.removeFromParent()
                    self?.pauseTime = false
                })
                self?.cancelAndirobaButton?.position.x = 160
                self?.cancelAndirobaButton?.position.y = -60
                self?.cancelAndirobaButton?.setScale(0.25)
                self?.addChild(self!.cancelAndirobaButton!)
            })
            self.andirobaInfoButton?.position.y = -40
            self.andirobaInfoButton?.position.x = 200
            self.andirobaInfoButton?.zPosition = -1
            self.andirobaInfoButton?.setScale(0.23)
            self.addChild(andirobaInfoButton!)
        }
        
        if contact.bodyA.node?.name == "intern" && contact.bodyB.node?.name == "boldo" || contact.bodyA.node?.name == "boldo" && contact.bodyB.node?.name == "intern" {
            
            self.boldoInfoButton = SKButtonNode(imageNamed: "learnMore", clickAction: { [weak self] in
                
                self?.boldoCard?.setHide(false)
                self?.boldoInfoButton?.removeFromParent()
                self?.pauseTime = true
                
                self?.collectBoldoButton = SKButtonNode(imageNamed: "pickUp", clickAction: {[weak self] in
                    self?.boldoCard?.setHide(true)
                    self?.boldoNode?.removeFromParent()
                    self?.collectBoldoButton?.removeFromParent()
                    self?.cancelBoldoButton?.removeFromParent()
                    self?.boldoInfoButton?.removeFromParent()
                    self?.collectObjectsSound()
                    GeneralScene.shared.plantsCollected.append("boldoo")
                    
                }, unclickAction: {[weak self] in
                    self?.collectPlantsMusic.removeFromParent()
                    self!.pauseTime = false
                })
                self?.collectBoldoButton?.position.x = 440
                self?.collectBoldoButton?.position.y = -60
                self?.collectBoldoButton?.setScale(0.25)
                self?.addChild(self!.collectBoldoButton!)
                
                self?.cancelBoldoButton = SKButtonNode(imageNamed: "leave", clickAction: {[weak self] in
                    self?.boldoCard?.setHide(true)
                    self?.cancelBoldoButton?.removeFromParent()
                    self?.collectBoldoButton?.removeFromParent()
                    
                    self?.cancelObjectsSound()
                }, unclickAction: {[weak self] in
                    self?.cancelPlantsMusic.removeFromParent()
                    self?.pauseTime = false
                })
                self?.cancelBoldoButton?.position.x = 360
                self?.cancelBoldoButton?.position.y = -60
                self?.cancelBoldoButton?.setScale(0.25)
                self?.addChild(self!.cancelBoldoButton!)
                
            })
            self.boldoInfoButton?.position.y = -40
            self.boldoInfoButton?.position.x = 400
            self.boldoInfoButton?.zPosition = -1
            self.boldoInfoButton?.setScale(0.23)
            self.addChild(boldoInfoButton!)
        }
        
        if contact.bodyA.node?.name == "intern" && contact.bodyB.node?.name == "cana" || contact.bodyA.node?.name == "cana" && contact.bodyB.node?.name == "intern" {
            
            self.canaInfoButton = SKButtonNode(imageNamed: "learnMore", clickAction: { [weak self] in
                
                self?.canaCard?.setHide(false)
                self?.canaInfoButton?.removeFromParent()
                self?.pauseTime = true
                
                self?.collectCanaButton = SKButtonNode(imageNamed: "pickUp", clickAction: {[weak self] in
                    self?.canaCard?.setHide(true)
                    self?.canaNode?.removeFromParent()
                    self?.collectCanaButton?.removeFromParent()
                    self?.cancelCanaButton?.removeFromParent()
                    self?.canaInfoButton?.removeFromParent()
                    self?.collectObjectsSound()
                    GeneralScene.shared.plantsCollected.append("canaa")
                    
                }, unclickAction: {[weak self] in
                    self?.collectPlantsMusic.removeFromParent()
                    self!.pauseTime = false
                })
                self?.collectCanaButton?.position.x = 640
                self?.collectCanaButton?.position.y = -60
                self?.collectCanaButton?.setScale(0.25)
                self?.addChild(self!.collectCanaButton!)
                
                self?.cancelCanaButton = SKButtonNode(imageNamed: "leave", clickAction: {[weak self] in
                    self?.canaCard?.setHide(true)
                    self?.cancelCanaButton?.removeFromParent()
                    self?.collectCanaButton?.removeFromParent()
                    
                    self?.cancelObjectsSound()
                }, unclickAction: {[weak self] in
                    self?.cancelPlantsMusic.removeFromParent()
                    self?.pauseTime = false
                })
                self?.cancelCanaButton?.position.x = 560
                self?.cancelCanaButton?.position.y = -60
                self?.cancelCanaButton?.setScale(0.25)
                self?.addChild(self!.cancelCanaButton!)
                
            })
            self.canaInfoButton?.position.y = -40
            self.canaInfoButton?.position.x = 600
            self.canaInfoButton?.zPosition = -1
            self.canaInfoButton?.setScale(0.23)
            self.addChild(canaInfoButton!)
        }
        
        if contact.bodyA.node?.name == "intern" && contact.bodyB.node?.name == "guaco" || contact.bodyA.node?.name == "guaco" && contact.bodyB.node?.name == "intern" {
            
            self.infoPlantsButton = SKButtonNode(imageNamed: "learnMore", clickAction: { [weak self] in
                
                self?.guacoCard?.setHide(false)
                self?.infoPlantsButton?.removeFromParent()
                self?.pauseTime = true
                
                self?.collectPlantsButton = SKButtonNode(imageNamed: "pickUp", clickAction: { [weak self] in
                    self?.guacoCard?.setHide(true)
                    self?.gaucoNode?.removeFromParent()
                    self?.collectPlantsButton?.removeFromParent()
                    self?.cancelPlantsButton?.removeFromParent()
                    self?.infoPlantsButton?.removeFromParent()
                    self?.collectObjectsSound()
                    GeneralScene.shared.plantsCollected.append("guacoo")
                    
                }, unclickAction: { [weak self] in
                    self?.collectPlantsMusic.removeFromParent()
                    self!.pauseTime = false
                })
                self?.collectPlantsButton?.position.x = 840
                self?.collectPlantsButton?.position.y = -60
                self?.collectPlantsButton?.setScale(0.25)
                self?.addChild(self!.collectPlantsButton!)
                
                self?.cancelPlantsButton = SKButtonNode(imageNamed: "leave", clickAction: {[weak self] in
                    self?.guacoCard?.setHide(true)
                    self?.cancelPlantsButton?.removeFromParent()
                    self?.collectPlantsButton?.removeFromParent()
                    self?.cancelObjectsSound()
                }, unclickAction: {[weak self] in
                    self?.cancelPlantsMusic.removeFromParent()
                    self?.pauseTime = false
                })
                self?.cancelPlantsButton?.position.x = 760
                self?.cancelPlantsButton?.position.y = -60
                self?.cancelPlantsButton?.setScale(0.25)
                self?.addChild(self!.cancelPlantsButton!)
                
            })
            self.infoPlantsButton?.position.y = -40
            self.infoPlantsButton?.position.x = 800
            self.infoPlantsButton?.zPosition = -1
            self.infoPlantsButton?.setScale(0.23)
            self.addChild(infoPlantsButton!)
        }
        //Aqui eliminar el lab
        if GeneralScene.shared.plantsCollected.count != 0 {
            if contact.bodyA.node?.name == "intern" && contact.bodyB.node?.name == "lab_semfundo" || contact.bodyA.node?.name == "lab_semfundo" && contact.bodyB.node?.name == "intern" {
                
                self.infoPlantsButton = SKButtonNode(imageNamed: "enter", clickAction: { [weak self] in
                    let labScene = LabScene()
                    labScene.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    labScene.scaleMode = .aspectFill
                    labScene.anchorPoint = .init(x: 0.5, y: 0.5)
                    self!.view?.presentScene(labScene)
                    self?.backgroundForestMusic.removeFromParent()
                })
                self.infoPlantsButton?.position.y = 20
                self.infoPlantsButton?.position.x = -190
                self.infoPlantsButton?.setScale(0.23)
                self.addChild(infoPlantsButton!)
            }
        }
    }
    
    func didEnd(_ contact: SKPhysicsContact) {
        self.infoPlantsButton?.removeFromParent()
        self.andirobaInfoButton?.removeFromParent()
        self.boldoInfoButton?.removeFromParent()
        self.canaInfoButton?.removeFromParent()
    }
}

