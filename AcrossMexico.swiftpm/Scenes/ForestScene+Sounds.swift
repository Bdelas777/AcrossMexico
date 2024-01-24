
import Foundation
import SpriteKit

extension ForestScene {
    
    func backgroundForestSound() {
        backgroundForestMusic.run(SKAction.changeVolume(to: Float(0.6), duration: 0))
        backgroundForestMusic.run(.play())
        self.addChild(backgroundForestMusic)
    }
    
    func collectPlantsSound() {
        collectPlantsMusic.run(SKAction.changeVolume(by: Float(0.7), duration: 0))
        collectPlantsMusic.run(.play())
        self.addChild(collectPlantsMusic)
    }
    
    func cancelPlantsSound(){
        cancelPlantsMusic.run(SKAction.changeVolume(by: Float(0.7), duration: 0))
        cancelPlantsMusic.run(.play())
        self.addChild(cancelPlantsMusic)
    }
   
}

