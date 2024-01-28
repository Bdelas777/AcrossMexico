//
//  QuizResultContainerView.swift
//  AcrossMexico
//
//  Created by Bernardo dela Sierra on 26/01/2024.
//

import Foundation
import SwiftUI
import SpriteKit

struct QuizCompletedView: UIViewControllerRepresentable {
    var gameManagerVM: GameManagerVM

    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()

        // Configurar la vista de SpriteKit
        let skView = SKView(frame: UIScreen.main.bounds)
        viewController.view = skView

        if gameManagerVM.model.quizWinningStatus {
            let finishScene = FinishScene()
            finishScene.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            finishScene.scaleMode = .aspectFill
            finishScene.anchorPoint = .init(x: 0.5, y: 0.5)
            skView.presentScene(finishScene)

        } else {
            let lostScene = LostScene()
            lostScene.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            lostScene.scaleMode = .fill
            lostScene.anchorPoint = .init(x: 0.5, y: 0.5)
            skView.presentScene(lostScene)
        }

        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // Puedes realizar actualizaciones adicionales aquí si es necesario
    }
}
