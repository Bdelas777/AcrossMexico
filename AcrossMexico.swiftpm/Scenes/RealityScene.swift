//
//  File.swift
//  
//
//  Created by Alumno on 15/02/24.
//


import SwiftUI
import RealityKit

struct RealityScene: View {
    @State private var isModelLoaded = false

    var body: some View {
        if isModelLoaded {
            ARViewContainer().edgesIgnoringSafeArea(.all)
        } else {
            ProgressView("Loading")
                .onAppear {
                    // Aquí puedes realizar la carga del modelo de forma asíncrona
                    // Por ejemplo, podrías usar DispatchQueue para simular una carga asíncrona
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        isModelLoaded = true // Marca el modelo como cargado
                    }
                }
        }
    }
}

struct ARViewContainer: UIViewRepresentable {
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        arView.cameraMode = .ar

        // Load the "Regalo" scene from the Reality File
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
