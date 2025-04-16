//
//  WatermarkModifier.swift
//  ViewsAndModifiers
//
//  Created by Grace couch on 18/07/2024.
//

import SwiftUI

struct WaterMark: ViewModifier {
    var text: String
    func body(content: Content) -> some View {
        content

        Text(text)
            .font(.headline.bold())
            .foregroundStyle(.white)
            .padding(7)
            .background(.cyan)
    }
}

extension View {
    func watermark(with text: String) -> some View {
        modifier(WaterMark(text: text))
    }
}


struct WatermarkModifier: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Color.blue
                .frame(maxWidth: 300, maxHeight: 300)
                .watermark(with: "GTC Developing")
        }
    }
}

#Preview {
    WatermarkModifier()
}
