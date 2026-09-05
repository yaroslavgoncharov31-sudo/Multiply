
struct GameSession {
    let questions: [Question]
    var currentQuestionIndex = 0
    var correctAnswers = 0

    var currentQuestion: Question {
        questions[currentQuestionIndex]
    }

    init(chosenNumber: Int, amountOfQuestions: Int) {
        questions = (0..<amountOfQuestions).map {
            Question(
                chosenNumber: chosenNumber,
                multiplier: Int.random(in: 1...12),
                index: $0 + 1
            )
        }
    }
}
