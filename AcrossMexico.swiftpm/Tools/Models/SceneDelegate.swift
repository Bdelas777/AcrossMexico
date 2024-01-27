//
//  File.swift
//  
//
//  Created by Alumno on 26/01/24.
//

import SwiftUI

class Coordinator: NSObject {
    var window: UIWindow?

    func showGameView() {
        let gameView = GameView(gameManagerVM: GameManagerVM()) // Ajusta los parámetros según tu estructura
        let hostingController = UIHostingController(rootView: gameView)
        window?.rootViewController = hostingController
        window?.makeKeyAndVisible()
    }
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var coordinator: Coordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        window = UIWindow(windowScene: windowScene)
        coordinator = Coordinator()
        window?.windowScene = windowScene
        window?.makeKeyAndVisible()
    }

    // ... otros métodos del delegado
}

