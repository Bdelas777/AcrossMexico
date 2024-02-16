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

            // Crear un ancla y agregar el modelo a ese ancla
            let anchor = AnchorEntity()
            anchor.addChild(modelEntity)

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
