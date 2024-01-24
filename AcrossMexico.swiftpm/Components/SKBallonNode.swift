
import SpriteKit
import SwiftUI
import Foundation

public class SKBalloonNode: SKNode {
    
    var background: SKSpriteNode
    var label: SKLabelNode
    
    init(imageNamed: String) {
        self.background = SKSpriteNode(imageNamed: imageNamed)
        self.label = SKLabelNode(text: "")
        
        super.init()
        
        self.background.texture?.filteringMode = .nearest
        self.background.zPosition = -1
        
        self.label.verticalAlignmentMode = .center
        self.label.fontName = "PixelOperator8"
        self.label.fontColor = .black
        self.label.fontSize = 14
        self.label.position = CGPoint(x: 40, y: -90)
        self.label.numberOfLines = 0
        self.zPosition += 5
        self.label.setScale(0.6)
        
        self.addChild(background)
        self.addChild(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func change(text: String) {
        self.label.text = text
    }
    
    public func setHide(_ value: Bool) {
        if(value) {
            self.run(
//                .sequence([
//                .moveTo(y: -120, duration: 0.8),
                .hide()
//            ])
            )
        } else {
            self.run(
//                .sequence([
                .unhide()
//                .moveTo(y: -40, duration: 0.8),
//            ])
            )
        }
    }
    
}
