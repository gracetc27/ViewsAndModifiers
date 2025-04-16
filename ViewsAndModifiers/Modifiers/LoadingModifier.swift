//
//  LoadingModifier.swift
//  ViewsAndModifiers
//
//  Created by Grace couch on 16/04/2025.
//

import SwiftUI

struct Loading: ViewModifier {
    let isPresented: Bool
    func body(content: Content) -> some View {
        if isPresented {
            ZStack {
                content.allowsHitTesting(false)

                Color.black.opacity(0.5).ignoresSafeArea()

                RoundedRectangle(cornerRadius: 10)
                    .fill(.white)
                    .frame(width: 100, height: 100)
                    .overlay {
                        VStack(alignment: .center, spacing: 10) {
                            ProgressView()
                            Text("Loading...")
                        }
                    }
            }
        }
        else {
            content
        }
    }
}

extension View {
    func loading(isPresented: Bool) -> some View {
        modifier(Loading(isPresented: isPresented))
    }
}

struct LoadingModifier: View {
    @State private var isPresented = false
    var body: some View {
        Button("Load something") {
            withAnimation {
                isPresented = true
            }
        }
            .loading(isPresented: isPresented)
    }
}

#Preview {
    LoadingModifier()
}
