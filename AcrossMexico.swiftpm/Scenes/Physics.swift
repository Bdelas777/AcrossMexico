//
//  Physics
//  AcrossMexico
//
//  Created by Bernardo de la Sierra on 23/01/24.
//
import SpriteKit
import SwiftUI

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
                    GeneralScene.shared.objectsCollected.append("Cannon")
                    
                }, unclickAction: {[weak self] in
                    self?.collectPlantsMusic.removeFromParent()
                    self!.pauseTime = false
                })
                self?.collectCannonButton?.position.x = 1240
                self?.collectCannonButton?.position.y = -60
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
                    GeneralScene.shared.objectsCollected.append("Vase")
                    
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
        
        // Sculpture
        if contact.bodyA.node?.name == "intern" && contact.bodyB.node?.name == "Sculpture" || contact.bodyA.node?.name == "Sculpture" && contact.bodyB.node?.name == "intern" {
            
            self.sculptureInfoButton = SKButtonNode(imageNamed: "learnMore", clickAction: { [weak self] in
                
                self?.sculptureCard?.setHide(false)
                self?.sculptureInfoButton?.removeFromParent()
                self?.pauseTime = true
                
                self?.collectSculptureButton = SKButtonNode(imageNamed: "pickUp", clickAction: {[weak self] in
                    self?.sculptureCard?.setHide(true)
                    self?.sculptureNode?.removeFromParent()
                    self?.collectSculptureButton?.removeFromParent()
                    self?.cancelSculptureButton?.removeFromParent()
                    self?.sculptureInfoButton?.removeFromParent()
                    
                    self?.collectObjectsSound()
                    GeneralScene.shared.objectsCollected.append("andirobaa")
                    
                }, unclickAction: {[weak self] in
                    self?.collectPlantsMusic.removeFromParent()
                    self!.pauseTime = false
                })
                self?.collectSculptureButton?.position.x = 240
                self?.collectSculptureButton?.position.y = -60
                self?.collectSculptureButton?.setScale(0.25)
                self?.addChild(self!.collectSculptureButton!)
                
                self?.cancelSculptureButton = SKButtonNode(imageNamed: "leave", clickAction: {[weak self] in
                    self?.sculptureCard?.setHide(true)
                    self?.cancelSculptureButton?.removeFromParent()
                    self?.collectSculptureButton?.removeFromParent()
                    self?.cancelObjectsSound()
                }, unclickAction: {[weak self] in
                    self?.cancelPlantsMusic.removeFromParent()
                    self?.pauseTime = false
                })
                self?.cancelSculptureButton?.position.x = 160
                self?.cancelSculptureButton?.position.y = -60
                self?.cancelSculptureButton?.setScale(0.25)
                self?.addChild(self!.cancelSculptureButton!)
            })
            self.sculptureInfoButton?.position.y = -40
            self.sculptureInfoButton?.position.x = 200
            self.sculptureInfoButton?.zPosition = -1
            self.sculptureInfoButton?.setScale(0.23)
            self.addChild(sculptureInfoButton!)
        }
        
        // Cross
        if contact.bodyA.node?.name == "intern" && contact.bodyB.node?.name == "Cross" || contact.bodyA.node?.name == "Cross" && contact.bodyB.node?.name == "intern" {
            
            self.crossInfoButton = SKButtonNode(imageNamed: "learnMore", clickAction: { [weak self] in
                
                self?.crossCard?.setHide(false)
                self?.crossInfoButton?.removeFromParent()
                self?.pauseTime = true
                
                self?.collectCrossButton = SKButtonNode(imageNamed: "pickUp", clickAction: {[weak self] in
                    self?.crossCard?.setHide(true)
                    self?.crossNode?.removeFromParent()
                    self?.collectCrossButton?.removeFromParent()
                    self?.cancelCrossButton?.removeFromParent()
                    self?.crossInfoButton?.removeFromParent()
                    self?.collectObjectsSound()
                    GeneralScene.shared.objectsCollected.append("Cross")
                    
                }, unclickAction: {[weak self] in
                    self?.collectPlantsMusic.removeFromParent()
                    self!.pauseTime = false
                })
                self?.collectCrossButton?.position.x = 440
                self?.collectCrossButton?.position.y = -60
                self?.collectCrossButton?.setScale(0.25)
                self?.addChild(self!.collectCrossButton!)
                
                self?.cancelCrossButton = SKButtonNode(imageNamed: "leave", clickAction: {[weak self] in
                    self?.crossCard?.setHide(true)
                    self?.cancelCrossButton?.removeFromParent()
                    self?.collectCrossButton?.removeFromParent()
                    
                    self?.cancelObjectsSound()
                }, unclickAction: {[weak self] in
                    self?.cancelPlantsMusic.removeFromParent()
                    self?.pauseTime = false
                })
                self?.cancelCrossButton?.position.x = 360
                self?.cancelCrossButton?.position.y = -60
                self?.cancelCrossButton?.setScale(0.25)
                self?.addChild(self!.cancelCrossButton!)
                
            })
            self.crossInfoButton?.position.y = -40
            self.crossInfoButton?.position.x = 400
            self.crossInfoButton?.zPosition = -1
            self.crossInfoButton?.setScale(0.23)
            self.addChild(crossInfoButton!)
        }
        
        if contact.bodyA.node?.name == "intern" && contact.bodyB.node?.name == "Mask" || contact.bodyA.node?.name == "Mask" && contact.bodyB.node?.name == "intern" {
            
            self.maskInfoButton = SKButtonNode(imageNamed: "learnMore", clickAction: { [weak self] in
                
                self?.maskCard?.setHide(false)
                self?.maskInfoButton?.removeFromParent()
                self?.pauseTime = true
                
                self?.collectMaskButton = SKButtonNode(imageNamed: "pickUp", clickAction: {[weak self] in
                    self?.maskCard?.setHide(true)
                    self?.maskNode?.removeFromParent()
                    self?.collectMaskButton?.removeFromParent()
                    self?.cancelMaskButton?.removeFromParent()
                    self?.maskInfoButton?.removeFromParent()
                    self?.collectObjectsSound()
                    GeneralScene.shared.objectsCollected.append("Mask")
                    
                }, unclickAction: {[weak self] in
                    self?.collectPlantsMusic.removeFromParent()
                    self!.pauseTime = false
                })
                self?.collectMaskButton?.position.x = 640
                self?.collectMaskButton?.position.y = -60
                self?.collectMaskButton?.setScale(0.25)
                self?.addChild(self!.collectMaskButton!)
                
                self?.cancelMaskButton = SKButtonNode(imageNamed: "leave", clickAction: {[weak self] in
                    self?.maskCard?.setHide(true)
                    self?.cancelMaskButton?.removeFromParent()
                    self?.collectMaskButton?.removeFromParent()
                    
                    self?.cancelObjectsSound()
                }, unclickAction: {[weak self] in
                    self?.cancelPlantsMusic.removeFromParent()
                    self?.pauseTime = false
                })
                self?.cancelMaskButton?.position.x = 560
                self?.cancelMaskButton?.position.y = -60
                self?.cancelMaskButton?.setScale(0.25)
                self?.addChild(self!.cancelMaskButton!)
                
            })
            self.maskInfoButton?.position.y = -40
            self.maskInfoButton?.position.x = 600
            self.maskInfoButton?.zPosition = -1
            self.maskInfoButton?.setScale(0.23)
            self.addChild(maskInfoButton!)
        }
        
        if contact.bodyA.node?.name == "intern" && contact.bodyB.node?.name == "Olmeca" || contact.bodyA.node?.name == "Olmeca" && contact.bodyB.node?.name == "intern" {
            
            self.infoOlmecaButton = SKButtonNode(imageNamed: "learnMore", clickAction: { [weak self] in
                
                self?.olmecaCard?.setHide(false)
                self?.infoOlmecaButton?.removeFromParent()
                self?.pauseTime = true
                
                self?.collectOlmecaButton = SKButtonNode(imageNamed: "pickUp", clickAction: { [weak self] in
                    self?.olmecaCard?.setHide(true)
                    self?.olmecaNode?.removeFromParent()
                    self?.collectOlmecaButton?.removeFromParent()
                    self?.cancelOlmecaButton?.removeFromParent()
                    self?.infoOlmecaButton?.removeFromParent()
                    self?.collectObjectsSound()
                    GeneralScene.shared.objectsCollected.append("guacoo")
                    
                }, unclickAction: { [weak self] in
                    self?.collectPlantsMusic.removeFromParent()
                    self!.pauseTime = false
                })
                self?.collectOlmecaButton?.position.x = 840
                self?.collectOlmecaButton?.position.y = -60
                self?.collectOlmecaButton?.setScale(0.25)
                self?.addChild(self!.collectOlmecaButton!)
                
                self?.cancelOlmecaButton = SKButtonNode(imageNamed: "leave", clickAction: {[weak self] in
                    self?.olmecaCard?.setHide(true)
                    self?.cancelOlmecaButton?.removeFromParent()
                    self?.collectOlmecaButton?.removeFromParent()
                    self?.cancelObjectsSound()
                }, unclickAction: {[weak self] in
                    self?.cancelPlantsMusic.removeFromParent()
                    self?.pauseTime = false
                })
                self?.cancelOlmecaButton?.position.x = 760
                self?.cancelOlmecaButton?.position.y = -60
                self?.cancelOlmecaButton?.setScale(0.25)
                self?.addChild(self!.cancelOlmecaButton!)
                
            })
            self.infoOlmecaButton?.position.y = -40
            self.infoOlmecaButton?.position.x = 800
            self.infoOlmecaButton?.zPosition = -1
            self.infoOlmecaButton?.setScale(0.23)
            self.addChild(infoOlmecaButton!)
        }
        //Aqui eliminar el lab
        if GeneralScene.shared.objectsCollected.count != 0 {
            if contact.bodyA.node?.name == "intern" && contact.bodyB.node?.name == "lab_semfundo" || contact.bodyA.node?.name == "lab_semfundo" && contact.bodyB.node?.name == "intern" {
                
                self.infoOlmecaButton = SKButtonNode(imageNamed: "enter", clickAction: { [weak self] in
                    // Transition to GameView when enter is pressed
                    self?.presentGameView()
                })
                self.infoOlmecaButton?.position.y = 20
                self.infoOlmecaButton?.position.x = -190
                self.infoOlmecaButton?.setScale(0.23)
                self.addChild(infoOlmecaButton!)
            }
        }
    }
    
    
    // Componente para que desaparezca el learn more
    func didEnd(_ contact: SKPhysicsContact) {
        self.infoOlmecaButton?.removeFromParent()
        self.sculptureInfoButton?.removeFromParent()
        self.crossInfoButton?.removeFromParent()
        self.maskInfoButton?.removeFromParent()
        self.cannonInfoButton?.removeFromParent()
        self.vaseInfoButton?.removeFromParent()
    }
    // Función para presentar GameView desde el controlador de vista actual
    func presentGameView() {
        // Liberar recursos de la presentación anterior si es necesario
        self.backgroundForestMusic.removeFromParent()

        // Verificar si ya hay una instancia de GameView presente
        if let existingGameView = UIApplication.shared.windows.first?.rootViewController?.presentedViewController as? UIHostingController<GameView> {
            // Reutilizar la instancia existente
            existingGameView.rootView.reset()  // Asumiendo que tienes un método para reiniciar el juego
        } else {
            // Crear una nueva instancia de GameView
            let gameView = GameView(gameManagerVM: GameManagerVM())
            let hostingController = UIHostingController(rootView: gameView)
            hostingController.modalPresentationStyle = .fullScreen

            // Asegúrate de estar en el hilo principal
            DispatchQueue.main.async {
                // Verificar si hay un controlador de vista actual y cerrar presentaciones modales anteriores
                if let currentViewController = UIApplication.shared.windows.first?.rootViewController {
                    currentViewController.dismiss(animated: true, completion: {
                        // Presentar el nuevo GameView después de cerrar presentaciones modales anteriores
                        currentViewController.present(hostingController, animated: true, completion: nil)
                    })
                }
            }
        }
    }


}


