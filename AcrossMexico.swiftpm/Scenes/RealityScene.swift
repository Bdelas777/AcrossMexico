//
//  File.swift
//  
//
//  Created by Alumno on 15/02/24.
//

import UIKit
import RealityKit

class RealityScene: UIViewController {

    override func viewDidLoad() {
            super.viewDidLoad()
            
            let arView = ARView(frame: UIScreen.main.bounds)
            do {
                let modelEntity1 = try Entity.loadModel(named: "Cantona.usdz")
                let anchor = AnchorEntity()
                anchor.addChild(modelEntity1)
                arView.scene.anchors.append(anchor)
            } catch {
                print("Error cargando el modelo: \(error)")
            }
            
            self.view.addSubview(arView)
        }
    }
