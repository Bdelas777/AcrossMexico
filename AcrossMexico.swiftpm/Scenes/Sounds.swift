//
//  Sounds
//  AcrossMexico
//
//  Created by Bernardo de la Sierra on 23/01/24.
//
import Foundation
import SpriteKit
import AVFoundation

extension GeneralScene {
    
    func backgroundGeneralSound() {
        backgroundForestMusic.run(SKAction.changeVolume(to: Float(0.6), duration: 0))
        backgroundForestMusic.run(.play())
        self.addChild(backgroundForestMusic)
    }
    
    func collectObjectsSound() {
        collectPlantsMusic.run(SKAction.changeVolume(by: Float(0.7), duration: 0))
        collectPlantsMusic.run(.play())
        self.addChild(collectPlantsMusic)
    }
    
    func cancelObjectsSound(){
        cancelPlantsMusic.run(SKAction.changeVolume(by: Float(0.7), duration: 0))
        cancelPlantsMusic.run(.play())
        self.addChild(cancelPlantsMusic)
    }
   
}

