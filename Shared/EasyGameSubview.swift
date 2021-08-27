import SwiftUI

struct EasyGameSubview: View {

    /// Background color
    @State var color = Color.red

    // how far the view has been dragged
    @State private var offset = CGSize.zero

    // whether it is currently being dragged or not
    @State private var isDragging = false

    var body: some View {
        // a drag gesture that updates offset and isDragging as it moves around
        let dragGesture = DragGesture()
            .onChanged { value in
                self.isDragging = true
                self.offset = value.translation
            }
            .onEnded { _ in
                withAnimation {
                    self.offset = .zero
                    self.isDragging = false
                }
            }
        return Rectangle()
            .fill(color)
//            .frame(width: 64, height: 64)
            .scaleEffect(isDragging ? 1.5 : 1)
            .offset(offset)
            .gesture(dragGesture)
            .zIndex(isDragging ? 2 : 1)
    }
}
