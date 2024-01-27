//
//  GameManagerVM.swift
//  AcrossMexico
//
//  Created by Bernardo dela Sierra on 26/01/2024.
//

import Foundation
import SwiftUI

class GameManagerVM : ObservableObject {

    static var currentIndex = 0
    
    static func createGameModel(i:Int) -> Quiz {
        return Quiz(currentQuestionIndex: i, quizModel: quizData[i])
    }
    
    @Published var model = GameManagerVM.createGameModel(i: GameManagerVM.currentIndex)
    
    
    var timer = Timer()
    var maxProgress = 15
    @Published var progress = 0
    
    init() {
        self.start()
    }
    
    func verifyAnswer(selectedOption: QuizOption) {
        for index in model.quizModel.optionsList.indices {
            model.quizModel.optionsList[index].isMatched = false
            model.quizModel.optionsList[index].isSelected = false
            
        }
        if let index = model.quizModel.optionsList.firstIndex(where: {$0.optionId == selectedOption.optionId}) {
            if selectedOption.optionId ==  model.quizModel.answer {
                model.quizModel.optionsList[index].isMatched = true
                model.quizModel.optionsList[index].isSelected = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    if (GameManagerVM.currentIndex < 2) {
                        GameManagerVM.currentIndex = GameManagerVM.currentIndex + 1
                        self.model = GameManagerVM.createGameModel(i: GameManagerVM.currentIndex)
                    } else {
                        self.model.quizCompleted = true
                        self.model.quizWinningStatus = true
                        self.reset()
                    }
                }
            } else {
                model.quizModel.optionsList[index].isMatched = false
                model.quizModel.optionsList[index].isSelected = true
            }

        }
    }
    
    func restartGame() {
        GameManagerVM.currentIndex = 0
        model = GameManagerVM.createGameModel(i: GameManagerVM.currentIndex)
        self.start()
    }
    
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats:true, block: { time in
            if self.progress == self.maxProgress {
                self.model.quizCompleted = true
                self.model.quizWinningStatus = false
                self.reset()
            } else {
                self.progress += 1
            }
        })
    }
                                     
    func reset () {
        timer.invalidate()
        self.progress = 0
    }
    
                                     
                                     
                                     
                                

}

extension GameManagerVM
{
    static var quizData: [QuizModel] {
        [
            QuizModel(question: "Which is the largest archaeological zone in Mexico?",
                      answer: "A",
                      optionsList: [QuizOption(id: 11, optionId: "A", option: "Cantona", color: Color.yellow),
                                    QuizOption(id: 12,optionId: "B", option: "Tenochtitlan", color: Color.red),
                                    QuizOption(id: 13,optionId: "C", option: "Teziutlan", color: Color.green),
                                    QuizOption(id: 14,optionId: "D", option: "Veracruz", color: Color.purple)]),
            
            QuizModel(question: "Where is the olmec head from?",
                      answer: "D",
                      optionsList: [QuizOption(id: 21,optionId: "A", option: "Tulum", color: Color.yellow),
                                    QuizOption(id: 22,optionId: "B", option: "Monte Albán", color: Color.red),
                                    QuizOption(id: 23,optionId: "C", option: "Palenque", color: Color.green),
                                    QuizOption(id: 24,optionId: "D", option: "La Venta", color: Color.purple)]),
            
            QuizModel(question: "What is a Zapotec city?",
                      answer: "C",
                      optionsList: [QuizOption(id: 31,optionId: "A", option: "Chetumal", color: Color.yellow),
                                    QuizOption(id: 32,optionId: "B", option: "Monterrey", color: Color.red),
                                    QuizOption(id: 33,optionId: "C", option: "Monte Albán", color: Color.green),
                                    QuizOption(id: 34,optionId: "D", option: "Teotihuacan", color: Color.purple)]),
            
            QuizModel(question: "What is a Zapotec city?",
                      answer: "C",
                      optionsList: [QuizOption(id: 31,optionId: "A", option: "Chetumal", color: Color.yellow),
                                    QuizOption(id: 32,optionId: "B", option: "Monterrey", color: Color.red),
                                    QuizOption(id: 33,optionId: "C", option: "Monte Albán", color: Color.green),
                                    QuizOption(id: 34,optionId: "D", option: "Teotihuacan", color: Color.purple)])
            
        ]
    }
}
