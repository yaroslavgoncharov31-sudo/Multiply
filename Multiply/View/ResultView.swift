//
//  ResultView.swift
//  Multiply
//
//  Created by Yaroslav on 9/2/26.
//

import SwiftUI

struct ResultView: View {
    let correctAnswers: Int
    let amountOfQuestions: Int
    let onReturnToMenu: () -> Void
    let onPlayAgain: () -> Void

    var body: some View {
        VStack {
            Text("Game is over!")
                .font(.title)
                .bold()
                .padding(20)

            Text("You answered correctly on \(correctAnswers) out of \(amountOfQuestions) questions.")
                .padding(25)
                .minimumScaleFactor(0.5)
                .lineLimit(1)

            Spacer()

            Text("Do you want to start a new game?")
                .padding(25)
                .font(.headline)

            Spacer()

            HStack(spacing: 15) {
                Button("Return to menu", action: onReturnToMenu)
                    .buttonStyle(PillButtonStyle())

                Button("Play one more time", action: onPlayAgain)
                    .buttonStyle(PillButtonStyle())
            }
            .padding(25)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ResultView(
        correctAnswers: 7,
        amountOfQuestions: 10,
        onReturnToMenu: {},
        onPlayAgain: {}
    )
}
