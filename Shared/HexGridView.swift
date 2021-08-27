//
//  ContentView.swift
//  Shared
//
//  Created by Martin Grider on 8/11/21.
//

import SwiftUI

struct HexGridView: View {

    let cols: Int = 6
    let rows: Int = 6
    let spacing: CGFloat = 0

    var body: some View {

        GeometryReader { proxy in

            let totalWidth = proxy.size.width
            let totalHeight = proxy.size.height
            let newSize = CGSize(width: totalWidth / CGFloat(cols), height: totalHeight / CGFloat(rows))
            let gridItems = Array(repeating: GridItem(.fixed(newSize.width), spacing: 0.0), count: cols)
            let hexWidth = hexagonWidth(newSize.width)

            LazyVGrid(columns: gridItems, spacing: spacing) {
                ForEach(0..<(cols*rows)) { idx in
                    VStack(spacing: 0) {
                        Color(red: 1, green: 0, blue: 1)
//                            .resizable()
                            .frame(width: newSize.width, height: newSize.height)
                            .clipShape(PolygonShape(sides: 6).rotation(Angle.degrees(90)))
                            .offset(x: isEvenRow(idx) ? 0 : hexWidth / 2 + (spacing/2))
                    }
                    .frame(width: hexWidth, height: newSize.height * 0.75)
                }
            }
            .frame(width: (hexWidth + spacing) * CGFloat(cols-1))
        }
    }

    func isEvenRow(_ idx: Int) -> Bool { (idx / cols) % 2 == 0 }
    func hexagonWidth(_ cellWidth: CGFloat) -> CGFloat {
        (cellWidth / 2) * cos(.pi / 6) * 2
    }
}

struct HexGridView_Previews: PreviewProvider {
    static var previews: some View {
        HexGridView()
    }
}

/// This technique from 
struct PolygonShape: Shape {
    var sides: Int

    func path(in rect: CGRect) -> Path {
        let h = Double(min(rect.size.width, rect.size.height)) / 2.0
        let c = CGPoint(x: rect.size.width / 2.0, y: rect.size.height / 2.0)
        var path = Path()

        for i in 0..<sides {
            let angle = (Double(i) * (360.0 / Double(sides))) * Double.pi / 180

            let pt = CGPoint(x: c.x + CGFloat(cos(angle) * h), y: c.y + CGFloat(sin(angle) * h))

            if i == 0 {
                path.move(to: pt) // move to first vertex
            } else {
                path.addLine(to: pt) // draw line to next vertex
            }
        }

        path.closeSubpath()

        return path
    }
}
