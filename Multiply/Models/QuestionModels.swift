//
//  QuestionModels.swift
//  Multiply
//
//  Created by Yaroslav on 9/3/26.
//

struct Question {
    let chosenNumber: Int
    let multiplier: Int
    let index: Int

    var text: String {
        "\(chosenNumber) × \(multiplier) = ?"
    }

    var correctAnswer: Int {
        chosenNumber * multiplier
    }
}
