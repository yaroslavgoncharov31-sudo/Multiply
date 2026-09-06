import SwiftUI

struct ContentView: View {
    @State private var chosenNumber = 2
    @State private var amountOfQuestions: QuestionAmount = .short
    @State private var navigationToGame = false
    var body: some View {
        NavigationStack {
            VStack(spacing: 10) {
                HStack {
                    Text("Multiply")
                        .padding(.leading, 12)
                        .font(.largeTitle)
                        .bold()
                    Image(systemName: "multiply")
                        .bold()
                        .font(.title)
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                VStack(spacing: 16) {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Which number you want to practice?")
                        Divider()
                        HStack {
                            Text("\(chosenNumber)")
                                .frame(maxWidth: .infinity ,alignment: .center)
                                .font(.title3)
                            Spacer()
                            Stepper("", value: $chosenNumber, in: 1...12)
                                .labelsHidden()
                        }
                    }
                }
                .cardStyle()
                .padding(.top, 50)

                HStack {
                    Text("Choose number of questions:")
                    Spacer()
                    Picker("", selection: $amountOfQuestions) {
                        ForEach (QuestionAmount.allCases, id: \.self) { question in
                            Text("\(question.rawValue)")
                        }
                    }
                    .pickerStyle(.menu)
                }
                .cardStyle()
                Spacer()

                VStack {
                    Button("I'm Ready") {
                        navigationToGame = true
                    }
                    .padding(.horizontal, 20)
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
            .background(Color(.systemGray6))
        }
    }
}
#Preview {
    ContentView()
}
