//
//  FinishScene.swift
//  AcrossMexico
//
//  Created by Bernardo de la Sierra on 23/01/24.
//
import Foundation
import SpriteKit
import RealityKit

// Protocolo para notificar al administrador del juego cuando se reinicia la escena
protocol FinishSceneDelegate: AnyObject {
    func didFinishSceneRestart()
}

class FinishScene: SKScene {
    weak var finishSceneDelegate: FinishSceneDelegate?

    var gift: SKButtonNode?
    var backgroundFinishMusic = SKAudioNode(fileNamed: "forestSound.mp3")
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
        
        let backgroundFinish = SKSpriteNode(imageNamed: "WinScreen")
        backgroundFinish.texture?.filteringMode = .nearest
        backgroundFinish.zPosition = -10
        backgroundFinish.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        backgroundFinish.scene?.scaleMode = .aspectFill
        self.addChild(backgroundFinish)
      
        backgroundFinishSound()
    }
    
    override func didMove(to view: SKView) {
            self.scaleMode = .aspectFill
            
            // Crear y configurar el botón de retry
            gift = SKButtonNode(imageNamed: "gift", clickAction: { [weak self] in
                self?.navigateToRealityScene()
            })
            gift?.position = CGPoint(x: 0, y: -70)
            gift?.setScale(1)
            self.addChild(gift!)
        }

    func restartGame() {
        // Notificar al delegado que se reinició la escena
        finishSceneDelegate?.didFinishSceneRestart()
    }
    
    func navigateToRealityScene() {
        finishSceneDelegate?.didFinishSceneRestart()


         // Encuentra el controlador de vista actual
         var viewController: UIViewController? = self.view?.window?.rootViewController
         while viewController?.presentedViewController != nil {
             viewController = viewController?.presentedViewController
         }
         
         // Crea e instancia la escena de RealityKit
         let realityScene = RealityScene()
         
         // Presenta la escena de RealityKit
         viewController?.present(realityScene, animated: true, completion: nil)
     }

    func backgroundFinishSound() {
        backgroundFinishMusic.run(SKAction.changeVolume(to: Float(0.6), duration: 0))
        backgroundFinishMusic.run(.play())
        self.addChild(backgroundFinishMusic)
    }
}

