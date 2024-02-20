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
        ARViewContainer()
            .edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    @State private var isLoading = true

    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        arView.cameraMode = .ar
        
        // Load the model asynchronously
        loadModel(on: arView)

        return arView
    }

    func updateUIView(_ uiView: ARView, context: Context) {}

    func loadModel(on arView: ARView) {
        // Simulate async model loading
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            // Once the model is loaded, set isLoading to false
            self.isLoading = false

            // Load the "Regalo" scene from the "Regalo" Reality File
            if let scene = try? Entity.load(named: "Regalo") {
                let boxAnchor = AnchorEntity(.plane(
                    [.horizontal],
                    classification: [.floor],
                    minimumBounds: [1.0, 1.0]
                ))

                boxAnchor.addChild(scene)

                // Add the box anchor to the scene
                arView.scene.anchors.append(boxAnchor)
            }
        }
    }
}
