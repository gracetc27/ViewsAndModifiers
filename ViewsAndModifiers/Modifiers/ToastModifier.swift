//
//  ToastModifier.swift
//  ViewsAndModifiers
//
//  Created by Grace couch on 16/04/2025.
//

import SwiftUI

struct Toast: ViewModifier {
    var text: String
    let isPresented: Bool
    func body(content: Content) -> some View {
        ZStack {

            content

            Text(text)
                .padding()
                .background(Capsule().fill(.brown))
                .foregroundStyle(.white)
                .shadow(color: .brown, radius: 5, x: 0, y: 3)
                .offset(x: 0, y: isPresented ? 0 : 100)
                .frame(maxHeight: .infinity, alignment: .bottom)

        }
    }

}

extension View {
    func toast(_ text: String, isPresented: Bool) -> some View {
        modifier(Toast(text: text, isPresented: isPresented))
    }
}

struct ToastModifier: View {
    @State private var isPresented = false
    var body: some View {
        Button("Show Toast") {
            withAnimation {
                isPresented.toggle()
            }
        }
        .toast("Toast is yummy!", isPresented: isPresented)
    }
}

#Preview {
    ToastModifier()
}
