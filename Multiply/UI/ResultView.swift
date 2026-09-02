//
//  ResultView.swift
//  Multiply
//
//  Created by Yaroslav on 9/2/26.
//

import SwiftUI

struct ResultView: View {
    let correctAnswers: Int
    let numberOfQuestions: Int
    var body: some View {
        let wrongAnswers = numberOfQuestions - correctAnswers
        VStack {
            Text("Game is over!")
                .font(.title)
                .bold()
                .padding(20)
            Text("You answered correctly on \(correctAnswers) out of \(numberOfQuestions) questions.")
                .padding(25)
                .minimumScaleFactor(0.5)
                .lineLimit(1)
            Text("Do you want to start new game?")
                .padding(75)
            Spacer()
        }
        HStack {
            NavigationLink("Start new game") {
                ContentView()
            }
        }
    }
}
#Preview {
    ResultView(correctAnswers: 7, numberOfQuestions: 10)
}
