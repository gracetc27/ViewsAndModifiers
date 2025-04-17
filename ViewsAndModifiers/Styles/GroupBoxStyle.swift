//
//  GroupBoxStyle.swift
//  ViewsAndModifiers
//
//  Created by Grace couch on 16/04/2025.
//

import SwiftUI

struct GrayShadowGroupBoxStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .trailing) {
            configuration.label
                .foregroundStyle(.white)
                .fontWeight(.bold)
            configuration.content
                .foregroundStyle(.white)
        }
        .buttonStyle(.polkaDot)
        .padding()
        .background(.gray)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 3, x: 0, y: 3)
    }
}

extension GroupBoxStyle where Self == GrayShadowGroupBoxStyle {
    static var grayShadow: Self { .init() }
}

struct GroupBoxStyleExample: View {
    var body: some View {
        VStack {
            GroupBox {
                Button("press me") {}
            } label: {
                Text("Gray shadowed group box")
            }
            GroupBox {
                Button("press me") {}
                    .buttonStyle(.borderedProminent)
            } label: {
                Text("Gray shadowed group box")
            }
        }
        .groupBoxStyle(.grayShadow)
    }
}



#Preview {
    GroupBoxStyleExample()
}
