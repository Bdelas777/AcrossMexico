//
//  ArrayTexture.swift
//  ForestCure
//
//  Created by Anne Victoria Batista Auzier on 02/04/23.
//

import Foundation
import SpriteKit

public extension Array where Element == SKTexture {
    init(withFormat format: String, range: ClosedRange<Int>){
        self = range.map({ (index) in
            let imageNamed = String(format: format, "\(index)")
            let texture = SKTexture(imageNamed: imageNamed)
            texture.filteringMode = .nearest
            return texture
        })
    }
}
