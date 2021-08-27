//
//  ContentView.swift
//  Shared
//
//  Created by Martin Grider on 8/11/21.
//

import SwiftUI

struct ContentView: View {

    let cols: Int = 6
    let rows: Int = 6
    let spacing: CGFloat = 0

    var body: some View {

        GeometryReader { proxy in

            let totalWidth = proxy.size.width
            let totalHeight = proxy.size.height

            let newSize = CGSize(width: totalWidth / CGFloat(cols), height: totalHeight / CGFloat(rows))
            let gridItems = Array(repeating: GridItem(.fixed(newSize.width), spacing: 0.0), count: cols)

            LazyVGrid(columns: gridItems, spacing: spacing) {
                ForEach(0..<(cols*rows)) { idx in
                    EasyGameSubview(color: Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1)))
                    .frame(width: newSize.width, height: newSize.height)
                }
            }
            .frame(width: totalWidth)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
