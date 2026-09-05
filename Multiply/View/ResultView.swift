//
//  ResultView.swift
//  Multiply
//
//  Created by Yaroslav on 9/2/26.
//

import SwiftUI

struct ResultView: View {
    let chosenNumber: Int
    let correctAnswers: Int
    let numberOfQuestions: Int
    @State private var navigateToGame = false
    var body: some View {
        VStack {
            Text("Game is over!")
                .font(.title)
                .bold()
                .padding(20)
            Text("You answered correctly on \(correctAnswers) out of \(numberOfQuestions) questions.")
                .padding(25)
                .minimumScaleFactor(0.5)
                .lineLimit(1)
            Spacer()
            Text("Do you want to start new game?")
                .padding(25)
                .font(.headline)
            Spacer()
        }
        .navigationBarBackButtonHidden(true)

        HStack(spacing: 15) {
            Button("Return to menu") {
                navigateToGame = true
            }
            .buttonStyle(PillButtonStyle())
            .navigationDestination(isPresented: $navigateToGame) {
                ContentView()
            }
            .padding(15)
            Button("Play one more time") {
                navigateToGame = true
            }

            .padding(15)
            .buttonStyle(PillButtonStyle())
            .navigationDestination(isPresented: $navigateToGame) {
                GameView(chosenNumber: chosenNumber, numberOfQuestions: numberOfQuestions)
            }
        }
    }
}
#Preview {
    ResultView(chosenNumber: 2, correctAnswers: 7, numberOfQuestions: 10)
}
