
import SwiftUI

struct GameView: View {

    let chosenNumber: Int
    let amountOfQuestions: Int
    let onReturnToMenu: () -> Void
    @State private var session: GameSession

    init(
        chosenNumber: Int,
        amountOfQuestions: Int,
        onReturnToMenu: @escaping () -> Void
    ) {
        self.chosenNumber = chosenNumber
        self.amountOfQuestions = amountOfQuestions
        self.onReturnToMenu = onReturnToMenu
        _session = State(
            initialValue: GameSession(
                chosenNumber: chosenNumber,
                amountOfQuestions: amountOfQuestions
            )
        )
    }
    @State private var userAnswer = ""
    @State private var showingAlert = false
    @State private var alertMessage = ""
    @State private var isFinished = false

    var body: some View {


        HStack {
            Text(session.currentQuestion.text)
                .frame(maxWidth: .infinity, maxHeight: 250)
                .font(.title)
                .bold()
        }
        Spacer()
            .navigationBarBackButtonHidden(true)

        VStack(spacing: 20) {

            Text("Question \(session.currentQuestionIndex + 1) out of \(amountOfQuestions)")

            TextField("Enter your answer...", text: $userAnswer)
                .multilineTextAlignment(.center)
                .padding()
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .keyboardType(.numberPad)

                Button("Check") {
                    guard !userAnswer.isEmpty else {
                        alertMessage = "Answer can't be empty"
                        showingAlert = true
                        return
                    }
                    guard let validInput = Int(userAnswer) else {
                        alertMessage = "Invalid Input"
                        showingAlert = true
                        return
                    }
                    if validInput == session.currentQuestion.correctAnswer {
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
                .buttonStyle(PillButtonStyle())
                .alert("Result", isPresented: $showingAlert) {
                    Button("OK") { }
                } message: {
                    Text(alertMessage)
                }
        }
        .padding(.horizontal, 25)
        .navigationDestination(isPresented: $isFinished) {
            ResultView(
                correctAnswers: session.correctAnswers,
                amountOfQuestions: amountOfQuestions,
                onReturnToMenu: {
                    isFinished = false
                    onReturnToMenu()
                },
                onPlayAgain: {
                    session = GameSession(
                        chosenNumber: chosenNumber,
                        amountOfQuestions: amountOfQuestions
                    )
                    userAnswer = ""
                    isFinished = false
                }
            )
        }
    }
}
#Preview {
    GameView(
        chosenNumber: 2,
        amountOfQuestions: 5,
        onReturnToMenu: {}
    )
}
