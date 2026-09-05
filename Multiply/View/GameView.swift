
import SwiftUI

struct GameView: View {

    let chosenNumber: Int
    let numberOfQuestions: Int
    @State private var session: GameSession
    init(chosenNumber: Int, numberOfQuestions: Int) {
        self.chosenNumber = chosenNumber
        self.numberOfQuestions = numberOfQuestions
        _session = State(
            initialValue: GameSession(
                chosenNumber: chosenNumber,
                numberOfQuestions: numberOfQuestions
            )
        )
    }
    @State private var userAnswer = ""
    @State private var showingAlert = false
    @State private var alertMessage = ""
    @State private var isFinished = false

    var body: some View {
        
        VStack {
            List {
                Text(session.currentQuestion.text)
                    .bold()
            }
        }
        .navigationBarBackButtonHidden(true)
        ZStack {
            Section {
                Text("Question \(session.currentQuestionIndex + 1) out of \(numberOfQuestions)")
                .padding(25)

            }
        }
        VStack {
            TextField("Enter your answer...", text: $userAnswer)
                .keyboardType(.numberPad)
            Button("Check") {
                if Int(userAnswer) == session.currentQuestion.correctAnswer {
                    session.correctAnswers += 1
                    alertMessage = "Your answer is correct!"
                } else {
                    alertMessage = "Your answer is incorrect."
                }

                if session.currentQuestionIndex == session.questions.count - 1 {
                    isFinished = true
                } else {
                    session.currentQuestionIndex += 1
                }
                userAnswer = ""
                showingAlert = true
            }
            .alert("Result", isPresented: $showingAlert) {
                Button("OK") { }
            } message: {
                Text(alertMessage)
            }
        }
        .navigationDestination(isPresented: $isFinished) {
            ResultView(
                chosenNumber: chosenNumber,
                correctAnswers: session.correctAnswers,
                numberOfQuestions: numberOfQuestions
            )
            }
        }
    }



#Preview {
    GameView(chosenNumber: 2, numberOfQuestions: 5)
}
