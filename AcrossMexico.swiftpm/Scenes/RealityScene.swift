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
    @State private var showPopup = false

    var body: some View {
        ZStack {
            ARViewContainer().edgesIgnoringSafeArea(.all)
            
            if showPopup {
                popupMessage
            }
        }
        .onAppear {
            // Aquí puedes realizar la carga del modelo de forma asíncrona
            // Por ejemplo, podrías usar DispatchQueue para simular una carga asíncrona
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                isModelLoaded = true // Marca el modelo como cargado
                if !isModelLoaded {
                    // Muestra el popup si el modelo no se ha cargado después de un tiempo
                    showPopup = true
                }
            }
        }
    }

    var popupMessage: some View {
        Alert(title: Text("Attention"),
              message: Text("Please focus the camera on a horizontal surface for 10-15 seconds for the models to load."),
              dismissButton: .default(Text("OK")) {
                  // Cerrar el popup
                  showPopup = false
              })
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
