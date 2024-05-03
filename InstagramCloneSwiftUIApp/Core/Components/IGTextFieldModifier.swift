//
//  IGTextFieldModifier.swift
//  InstagramCloneSwiftUIApp
//
//  Created by Alican TARIM on 3.05.2024.
//

import SwiftUI

struct IGTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal, 24)
    }
}
