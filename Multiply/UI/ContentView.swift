import SwiftUI

struct ContentView: View {
    @State private var chosenNumber = 2
    @State private var amountOfQuestions: QuestionAmount = .short
    var body: some View {
        NavigationStack {
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
            }.navigationTitle("Multiply")

            Section {
                NavigationLink("I'm Ready") {
                    GameView(chosenNumber: chosenNumber,
                             numberOfQuestions: amountOfQuestions.rawValue

                    )

                }
            }

        }


    }
}


#Preview {
    ContentView()
}
