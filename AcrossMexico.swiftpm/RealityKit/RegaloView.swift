//
//  RegaloView.swift
//  AcrossMexico
//
//  Created by Alumno on 15/02/24.
//

import SwiftUI

import SwiftUI
import RealityKit

struct RegaloView: View {
    var body: some View {
        ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)

        let boxAnchor = try! Experience.loadBox()
        arView.scene.anchors.append(boxAnchor)

        return arView
    }

    func updateUIView(_ uiView: ARView, context: Context) {
        // Actualizar la vista si es necesario
    }
}


struct RegaloView_Previews: PreviewProvider {
    static var previews: some View {
        RegaloView()
    }
}
