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

        // Crear una vista ARView que ocupe toda la pantalla
        let arView = ARView(frame: UIScreen.main.bounds)

        // Cargar el modelo
        do {
            let modelEntity = try Entity.loadModel(named: "Cantona.usdz")
            let modelEntity2 = try Entity.loadModel(named: "Veracruz.usdz")
            let modelEntity3 = try Entity.loadModel(named: "Teotihuacan.usdz")
            let modelEntity4 = try Entity.loadModel(named: "SanMiguelDeAllende.usdz")
            let modelEntity5 = try Entity.loadModel(named: "MonteAlban.usdz")
            let modelEntity6 = try Entity.loadModel(named: "LaVenta.usdz")
            // Crear un ancla y agregar el modelo a ese ancla
            let anchor = AnchorEntity()
            anchor.addChild(modelEntity)
            anchor.addChild(modelEntity2)
            anchor.addChild(modelEntity3)
            anchor.addChild(modelEntity4)
            anchor.addChild(modelEntity5)
            anchor.addChild(modelEntity6)
            // Agregar el ancla a la escena AR
            arView.scene.anchors.append(anchor)
        } catch {
            print("Error cargando el modelo: \(error)")
        }

        // Agregar la vista AR a la vista del controlador de vista
        self.view.addSubview(arView)
    }

    // Método para manejar la rotación del dispositivo
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Ocultar la barra de navegación en la parte superior
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        // Mostrar la barra de navegación cuando se sale de esta vista
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
