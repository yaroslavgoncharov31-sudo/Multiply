import SwiftUI

struct ContentView: View {
    @State private var chosenNumber = 2
    @State private var amountOfQuestions: QuestionAmount = .short
    @State private var navigationToGame = false
    var body: some View {

        NavigationStack {
            Text("Multiply")
                .font(.title)
                .bold()

            List {
                Section {
                    Text("Which number you want to practice?")
                        .frame(maxWidth: .infinity, alignment: .center)
                    HStack {
                        Text("\(chosenNumber)")
                            .frame(maxWidth: .infinity, alignment: .center)
                        Stepper("", value: $chosenNumber, in: 2...12).labelsHidden()
                    }
                }
                Section {
                    Picker("Choose number of questions: ", selection: $amountOfQuestions) {
                        ForEach (QuestionAmount.allCases, id: \.self) { question in
                            Text("\(question.rawValue)")
                        }
                    }
                }
            }

            Section {
                Button("I'm Ready") {
                    navigationToGame = true
                }
                .buttonStyle(PillButtonStyle())
                .navigationDestination(isPresented: $navigationToGame) {
                    GameView(
                        chosenNumber: chosenNumber,
                        amountOfQuestions: amountOfQuestions.rawValue,
                        onReturnToMenu: {
                            navigationToGame = false
                        }
                    )
                }
            }

        }
        .navigationBarBackButtonHidden(true)
    }
}
#Preview {
    ContentView()
}
