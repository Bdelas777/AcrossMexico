//
//  File.swift
//  
//
//  Created by Alumno on 15/02/24.
//


import SwiftUI
import RealityKit

struct RealityScene: View {
    var body: some View {
        ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        arView.cameraMode = .ar
        
        // Load the "Box" scene from the "Experience" Reality File
        let scene = try! Entity.load(named: "Regalo")
        
        
        let boxAnchor = AnchorEntity(.plane(
            [ .horizontal],
            classification: [.floor],
            minimumBounds: [1.0, 1.0]
        ))

        boxAnchor.addChild(scene)
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
}
