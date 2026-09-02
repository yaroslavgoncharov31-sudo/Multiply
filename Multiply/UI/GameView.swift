
import SwiftUI

struct GameView: View {
    
    let chosenNumber: Int
    let numberOfQuestions: Int
    @State private var currentQuestion = 1
    @State private var question = ""
    @State private var answer = 0
    @State private var userAnswer = ""
    @State private var showingAlert = false
    @State private var alertMessage = ""
    @State private var correctAnswers = 0
    @State private var isFinished = false

    var body: some View {
        let result = generateQuestion(chosenNumber: chosenNumber)

        VStack {
            List {
                Text(question)
            }.onAppear {
                question = result.question
                answer = result.answer
            }
        }
        .navigationBarBackButtonHidden(true)
        ZStack {
            Section {
                Text("Question \(currentQuestion) out of \(numberOfQuestions)")
                .padding(25)
            }
        }
        VStack {
            TextField("Enter your answer...", text: $userAnswer)
                .keyboardType(.numberPad)
            Button("Check") {
                if Int(userAnswer) == answer {
                    question = result.question
                    answer = result.answer
                    showingAlert = true
                    alertMessage = "Your answer is correct!"
                    userAnswer = ""
                    correctAnswers += 1
                } else {
                    question = result.question
                    answer = result.answer
                    showingAlert = true
                    alertMessage = "Your answer is incorrect..."
                    userAnswer = ""
                }
                if currentQuestion == numberOfQuestions {
                    isFinished = true
                } else {
                    currentQuestion += 1
                }
            }
            .alert("Result", isPresented: $showingAlert) {
                Button("OK") { }
            } message: {
                Text(alertMessage)
            }
        }
        .navigationDestination(isPresented: $isFinished) {
            ResultView(
                correctAnswers: correctAnswers,
                numberOfQuestions: numberOfQuestions
            )
            }
        }
    }



#Preview {
    GameView(chosenNumber: 7, numberOfQuestions: 10)
}
