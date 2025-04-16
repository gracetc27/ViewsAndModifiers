//
//  LoadingModifier2.swift
//  ViewsAndModifiers
//
//  Created by Grace couch on 16/04/2025.
//

import SwiftUI

struct Loading2: ViewModifier {
    @State private var isLoading = false
    let action: () async -> Void

    func body(content: Content) -> some View {
        ZStack {
            if isLoading {
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
        .onLongPressGesture {
            Task {
                isLoading = true
                await action()
                isLoading = false
            }
        }
    }
}

extension View {
    func loading2(_ action: @escaping () async -> Void) -> some View {
        modifier(Loading2(action: action))
    }
}

struct LoadingModifier2: View {
    var body: some View {
        Text("Load something")
            .loading2 {
                try? await Task.sleep(for: .seconds(3))
            }
    }
}

#Preview {
    LoadingModifier2()
}
