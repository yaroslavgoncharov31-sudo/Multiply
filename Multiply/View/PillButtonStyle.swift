//
//  PillButtonStyle.swift
//  Multiply
//
//  Created by Yaroslav on 9/5/26.
//
import SwiftUI

struct PillButtonStyle: ButtonStyle {
    var backgroundColor: Color = .blue

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .minimumScaleFactor(0.5)
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 24)
            .padding(.vertical, 12)
            .background(backgroundColor)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .animation(.easeOut(duration: 0.15), value: configuration.isPressed)
            .minimumScaleFactor(0.5)
    }
}
