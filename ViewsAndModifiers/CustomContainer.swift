//
//  CustomContainer.swift
//  ViewsAndModifiers
//
//  Created by Grace couch on 18/07/2024.
//

import SwiftUI


struct GridStack<Content: View>: View {
    let columns: Int
    let rows: Int
    @ViewBuilder  let content: (Int, Int) -> Content


    var body: some View {
        VStack {
            ForEach(0..<columns, id: \.self) { column in
                HStack {
                    ForEach(0..<rows, id: \.self) { row in
                        content(column, row)
                    }
                }
            }
        }
    }
}


struct CustomContainer: View {
    var body: some View {
        GridStack(columns: 4, rows: 4) { row, col in
                Image(systemName: "\(row).circle")
                Image(systemName: "\(col).square")
        }
    }
}


#Preview {
    CustomContainer()
}
