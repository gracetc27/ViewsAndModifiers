//
//  PolkaDotButtonStyle.swift
//  ViewsAndModifiers
//
//  Created by Grace couch on 16/04/2025.
//

import SwiftUI

struct PolkaDot: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(
                ZStack {
                    GeometryReader { proxy in
                        Color.blue
                        GridStack(columns: Int(proxy.size.height) / 12, rows: Int(proxy.size.width) / 12) { _, _ in
                            Circle().fill(configuration.isPressed ? .cyan : .indigo)
                        }

                    }
                }
            )
            .foregroundStyle(.white)
            .clipShape(Capsule())
    }
}

extension ButtonStyle where Self == PolkaDot {
    static var polkaDot: Self { .init() }
}


struct PolkaDotButtonStyle: View {
    var body: some View {
        VStack {
            Button("tap me!") {}
            Button("tap me!") {}
            Button("tap me!") {}
            Button("tap me!") {}
            Button("tap me!") {}
            Button("tap me!") {}

        }
            .buttonStyle(.polkaDot)
    }
}

#Preview {
    PolkaDotButtonStyle()
}
