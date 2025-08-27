//
//  ContentView.swift
//  Animation
//
//  Created by Dmitry Kononov on 27.08.25.
//

import SwiftUI

struct ContentView: View {
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        LinearGradient(colors: [.red, .yellow], startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 200)
            .clipShape(.rect(cornerRadius: 10))
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onChanged { dragAmount = $0.translation }
                    .onEnded { _ in
                        withAnimation(.bouncy) {
                            dragAmount = .zero
                        }
                    }
                )
    }
}

#Preview {
    ContentView()
}
