import SwiftUI

//struct EasyGameCanvas: View {
//    var body: some View {
//        Canvas { context, size in
//
//            let r0 = context.resolveSymbol(id: 0)!
//            let r1 = context.resolveSymbol(id: 1)!
//            let r2 = context.resolveSymbol(id: 2)!
//
//            context.draw(r0, at: .init(x: 10, y: 10), anchor: .topLeading)
//            context.draw(r1, at: .init(x: 30, y: 20), anchor: .topLeading)
//            context.draw(r2, at: .init(x: 50, y: 30), anchor: .topLeading)
//            context.draw(r0, at: .init(x: 70, y: 40), anchor: .topLeading)
//
//        } symbols: {
//            RoundedRectangle(cornerRadius: 10.0).fill(.cyan)
//                .frame(width: 100, height: 50)
//                .tag(0)
//
//            RoundedRectangle(cornerRadius: 10.0).fill(.blue)
//                .frame(width: 100, height: 50)
//                .tag(1)
//
//            RoundedRectangle(cornerRadius: 10.0).fill(.indigo)
//                .frame(width: 100, height: 50)
//                .tag(2)
//        }
//    }
//}
