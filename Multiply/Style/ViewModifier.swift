//
//  CardView.swift
//  Multiply
//
//  Created by Yaroslav on 9/6/26.
//
import SwiftUI

struct CardBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.white)
            .cornerRadius(16)
    }
}

extension View {
    func cardStyle() -> some View {
        modifier(CardBackground())
    }
}
